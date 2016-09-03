package org.xs.techblog.common.service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.criterion.Order;
import org.xs.techblog.common.persistence.Page;
import org.xs.techblog.common.persistence.QueryDao;
import org.xs.techblog.common.utils.ContextUtils;

/**
 * 服务支持类
 */
public abstract class BaseService<T> {
	
	@SuppressWarnings("unchecked")
	private Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	
	protected QueryDao<T> queryDao;
	
	public BaseService() {
		queryDao = ContextUtils.getBean(clazz.getSimpleName() + "Dao");
	}
	
	// -------------- Query --------------
	
	public void add(T entity) {
		queryDao.add(entity);
	}
	
	public void save(T entity) {
		queryDao.save(entity);
	}
	
	public void save(List<T> entityList) {
		queryDao.save(entityList);
	}
	
	public void update(T entity) {
		queryDao.update(entity);
	}
	
	public int update(String qlString) {
		return queryDao.update(qlString, null);
	}

	public int update(String qlString, Object[] parameters) {
		return queryDao.createQuery(qlString, parameters).executeUpdate();
	}
	
	public int deleteById(String id) {
		return queryDao.deleteById(id);
	}
	
	public T getById(String id) {
		return queryDao.getById(id);
	}
	
	public List<T> getList(String qlString) {
		return getList(qlString, null);
	}

	public List<T> getList(String qlString, Object[] parameters) {
		return queryDao.find(qlString, parameters);
	}
	
	public List<T> getList() {
		return queryDao.findAll();
	}
	
	public List<T> getList(Order order) {
		return queryDao.findAll(order);
	}
	
	public List<T> getList(Page<T> page, Order order) {
		return queryDao.find(page, order);
	}
	
	public Page<T> getListPage(Page<T> page, Order order) {
		page.setList(queryDao.find(page, order));
		return page;
	}
}
