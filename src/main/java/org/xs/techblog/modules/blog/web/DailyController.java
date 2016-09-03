package org.xs.techblog.modules.blog.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xs.techblog.common.persistence.Page;
import org.xs.techblog.common.utils.StringUtils;
import org.xs.techblog.modules.blog.entity.Category;
import org.xs.techblog.modules.blog.entity.Daily;
import org.xs.techblog.modules.blog.service.DailyService;

import com.alibaba.fastjson.JSON;

/**
 * 文章Controller
 */
@Controller
@RequestMapping("d")
public class DailyController {

	private final Logger log = LoggerFactory.getLogger(getClass().getName());
	
	@Autowired
	private DailyService dailyService;

	/**
	 * 获得json列表
	 */
	@ResponseBody
	@RequestMapping(value = "getListj", produces = { "text/plain;charset=utf-8" })
	public String getListj(HttpServletRequest request) {
		String dailyName = request.getParameter("dailyName");
		String categoryId = request.getParameter("categoryId");
		log.info("233");
		return JSON.toJSONString(dailyService.getPageNameSearch(new Page<Daily>(request), dailyName, categoryId));
	}
	
	/**
	 * 获得json实体
	 */
	@ResponseBody
	@RequestMapping(value = "getModelj", produces = { "text/plain;charset=utf-8" })
	public String getModelj(HttpServletRequest request) {
		String dailyId = request.getParameter("dailyId");
		return JSON.toJSONString(dailyService.getById(dailyId));
	}
	
	/**
	 * 编辑列表
	 */
	@RequestMapping("m/list")
	public String mlist(HttpServletRequest request) throws Exception {
		return mlist(1, request);
	}
	
	/**
	 * 编辑列表
	 */
	@RequestMapping("m/list/{pageNo}")
	public String mlist(@PathVariable("pageNo") int pageNo, HttpServletRequest request) throws Exception {
		
		request.setAttribute("pageDailyList", dailyService.getPageNameSearch(new Page<Daily>(pageNo), null, null));
		return "modules/manage/daily/dailyList";
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "m/e")
	public String edit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return edit(null, request, response);
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value = "m/e/{id}")
	public String edit(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!StringUtils.isEmpty(id)) {
			Daily dailyInfo= dailyService.getById(id);
			request.setAttribute("dailyInfo", dailyInfo);
		}
		
		return "modules/manage/daily/dailyEdit";
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value = "s")
	public String save(Daily dailyInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(dailyInfo != null) {
			dailyInfo.setUpdateDate(new Date());
			if(StringUtils.isEmpty(dailyInfo.getId())) {
				dailyInfo.setUserId("123");
				dailyService.add(dailyInfo);
			} else {
				dailyService.update(dailyInfo);
			}
		}
		
		return "redirect:/d/m/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "d/{id}")
	public String delete(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!StringUtils.isEmpty(id)) {
			dailyService.deleteById(id);
		}
		
		return "redirect:/d/m/list";
	}
}
