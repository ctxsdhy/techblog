package org.xs.techblog.modules.blog.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.xs.techblog.common.persistence.Page;
import org.xs.techblog.common.service.BaseService;
import org.xs.techblog.common.utils.StringUtils;
import org.xs.techblog.modules.blog.entity.Daily;

/**
 * 文章服务层
 */
@Service
public class DailyService extends BaseService<Daily> {
	
	/**
	 * 查询列表
	 * @param dailyName
	 * @param categoryId
	 * @return
	 */
	public List<Daily> getListSearch(String dailyName, String categoryId) {
		
		List<Criterion> criterionList = new ArrayList<Criterion>();
		if(!StringUtils.isEmpty(dailyName)) {
			criterionList.add(Restrictions.like("dailyName", dailyName, MatchMode.ANYWHERE));
		}
		if(!StringUtils.isEmpty(categoryId)) {
			criterionList.add(Restrictions.eq("categoryId", categoryId));
		}
		
		return queryDao.find(criterionList, Order.desc("createDate"));
	}
	
	/**
	 * 查询列表
	 * @param dailyName
	 * @param categoryId
	 * @return
	 */
	public List<Daily> getListNameSearch(String dailyName, String categoryId) {
		return getListNameSearch(null, dailyName, categoryId);
	}
	
	/**
	 * 查询列表
	 * @param page
	 * @param dailyName
	 * @param categoryId
	 * @return
	 */
	public List<Daily> getListNameSearch(Page<Daily> page, String dailyName, String categoryId) {
		
		List<String> map = new ArrayList<String>();
		String hql = "select new Daily(id, dailyName, pageViews, pageReviews, categoryId, userId, createDate, updateDate) from Daily where 1=1 ";
		if(!StringUtils.isEmpty(dailyName)) {
			hql += " and dailyName like ? ";
			map.add("%" + dailyName + "%");
		}
		if(!StringUtils.isEmpty(categoryId)) {
			hql += " and categoryId = ? ";
			map.add(categoryId);
		}
		hql += " order by createDate desc ";
		
		List<Daily> list = queryDao.find(page, hql, map.toArray());
		return list;
	}
	
	/**
	 * 查询分页列表
	 * @param page
	 * @param dailyName
	 * @param categoryId
	 * @return
	 */
	public Page<Daily> getPageNameSearch(Page<Daily> page, String dailyName, String categoryId) {
		page.setList(getListNameSearch(page, dailyName, categoryId));
		return page;
	}
}
