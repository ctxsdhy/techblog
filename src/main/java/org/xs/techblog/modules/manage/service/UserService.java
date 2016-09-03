package org.xs.techblog.modules.manage.service;

import org.springframework.stereotype.Service;
import org.xs.techblog.common.service.BaseService;
import org.xs.techblog.modules.manage.entity.User;

/**
 * 用户服务层
 */
@Service
public class UserService extends BaseService<User> {
	
	public User getByLoginName(String loginName) {
		String hql = "from User where loginName=?";
		return queryDao.getByHql(hql, new Object[]{loginName});
	}
}
