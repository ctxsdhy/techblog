package org.xs.techblog.modules.manage.dao;

import org.springframework.stereotype.Repository;
import org.xs.techblog.common.persistence.QueryDao;
import org.xs.techblog.modules.manage.entity.User;

/**
 * 用户数据层
 */
@Repository("UserDao")
public class UserDao extends QueryDao<User> {
	
}
