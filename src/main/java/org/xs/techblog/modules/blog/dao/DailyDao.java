package org.xs.techblog.modules.blog.dao;

import org.springframework.stereotype.Repository;
import org.xs.techblog.common.persistence.QueryDao;
import org.xs.techblog.modules.blog.entity.Daily;

/**
 * 文章数据层
 */
@Repository("DailyDao")
public class DailyDao extends QueryDao<Daily> {
	
}
