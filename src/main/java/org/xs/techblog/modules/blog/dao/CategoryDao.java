package org.xs.techblog.modules.blog.dao;

import org.springframework.stereotype.Repository;

import org.xs.techblog.common.persistence.QueryDao;
import org.xs.techblog.modules.blog.entity.Category;

/**
 * 分类数据层
 */
@Repository("CategoryDao")
public class CategoryDao extends QueryDao<Category> {
	
}
