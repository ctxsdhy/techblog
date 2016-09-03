package org.xs.techblog.common.persistence;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.xs.techblog.common.config.Global;

/**
 * 底层查询支持类
 */
public class QueryDaoBak<T> extends BaseDao<T> {
	
	/**
	 * 新增实体
	 * @param entity
	 */
	public void add(T entity) {
        getSession().save(entity);
	}
	
	/**
	 * 保存实体
	 * @param entity
	 */
	public void save(T entity) {
        getSession().saveOrUpdate(entity);
	}
	
	/**
	 * 保存实体列表
	 * @param entityList
	 */
	public void save(List<T> entityList) {
		for (T entity : entityList){
			save(entity);
		}
	}
	
	/**
	 * 更新实体
	 * @param entity
	 */
	public void update(T entity) {
        getSession().update(entity);
	}
	
	/**
	 * 更新
	 * @param qlString
	 * @return
	 */
	public int update(String qlString) {
		return update(qlString, null);
	}
	
	/**
	 * 更新
	 * @param qlString
	 * @param parameters
	 * @return
	 */
	public int update(String qlString, Object[] parameters) {
		return createQuery(qlString, parameters).executeUpdate();
	}
	
	/**
	 * sql 更新
	 * @param sqlString
	 * @param parameter
	 * @return
	 */
	public int updateBySql(String sqlString) {
		return updateBySql(sqlString, null);
	}
	
	/**
	 * sql 更新
	 * @param sqlString
	 * @param parameters
	 * @return
	 */
	public int updateBySql(String sqlString, Object[] parameters) {
		return createSqlQuery(sqlString, parameters).executeUpdate();
	}
	
	/**
	 * 删除
	 * @param entity
	 */
	public void delete(T entity) {
        getSession().delete(entity);
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public int deleteById(String id) {
		return update("delete from " + Global.getConfig("database.prefix") + entityClass.getName() + " where id= ?", new Object[]{id});
	}
	
	/**
	 * 获取实体
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T getById(String id) {
		return (T) getSession().get(entityClass, id);
	}
	
	/**
	 * 获取实体
	 * @param qlString
	 * @return
	 */
	public T getByHql(String qlString) {
		return getByHql(qlString, null);
	}
	
	/**
	 * 获取实体
	 * @param qlString
	 * @param parameters
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T getByHql(String qlString, Object[] parameters) {
		return (T) createQuery(qlString, parameters).uniqueResult();
	}
	
	/**
	 * 查询
	 * @param qlString
	 * @return
	 */
	public List<T> find(String qlString){
		return find(qlString, null);
	}
	
	/**
	 * 查询
	 * @param qlString
	 * @param parameters
	 * @return
	 */
	public List<T> find(String qlString, Object[] parameters){
		return find(null, qlString, parameters);
	}
	
	/**
	 * 查询
	 * @param page
	 * @param qlString
	 * @return
	 */
	public List<T> find(Page<T> page, String qlString){
		return find(page, qlString, null);
	}
	
	/**
	 * 查询
	 * @param page
	 * @param qlString
	 * @param parameters
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> find(Page<T> page, String qlString, Object[] parameters){
		
		Query query = createQuery(qlString, parameters);
		
		if(page != null) {
			
			//获取总数
	        String countQlString = "select count(*) " + removeSelect(removeOrders(qlString));
	        Query queryc = createQuery(countQlString, parameters);
	        List<Object> list = queryc.list();
	        if (list.size() > 0){
	        	page.setCount(Long.valueOf(list.get(0).toString()));
	        }else{
	        	page.setCount(list.size());
	        }
			if (page.getCount() < 1) {
				return null;
			}
			
			query.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
			query.setMaxResults(page.getPageSize());
		}
		
		return query.list();
	}
	
	/**
	 * QL 查询所有
	 * @return
	 */
	public List<T> find(Page<T> page, Order order){
		return find(page, null, order);
	}
	
	/**
	 * QL 查询所有
	 * @return
	 */
	public List<T> find(List<Criterion> criterionList, Order order){
		return find(null, criterionList, order);
	}
	
	/**
	 * QL 查询所有
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> find(Page<T> page, List<Criterion> criterionList, Order order){
		
		Criteria criteria = getSession().createCriteria(entityClass);
		
		if(criterionList != null) {
			for (Criterion criterion : criterionList) {
				criteria.add(criterion);
			}
		}
		
		if(page != null) {
			
			//获取总数
			criteria.setProjection(Projections.rowCount());
			page.setCount(Long.valueOf(criteria.uniqueResult().toString()));
			criteria.setProjection(null);
			criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
			
			criteria.setFirstResult((page.getPageNo() - 1) * page.getPageSize());
			criteria.setMaxResults(page.getPageSize());
		}
		
		if(order != null) {
			criteria.addOrder(order);
		}
		
		return criteria.list();
	}
	
	/**
	 * sql 查询
	 * @param sqlString
	 * @return
	 */
	public <E> List<E> findBySql(String sqlString){
		return findBySql(sqlString, null);
	}
	
	/**
	 * sql 查询
	 * @param sqlString
	 * @param parameter
	 * @return
	 */
	public <E> List<E> findBySql(String sqlString, Object[] parameters){
		return findBySql(sqlString, parameters, null);
	}
	
	/**
	 * sql 查询
	 * @param sqlString
	 * @param resultClass
	 * @param parameters
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <E> List<E> findBySql(String sqlString, Object[] parameters, Class<?> resultClass){
		SQLQuery query = createSqlQuery(sqlString, parameters);
		setResultTransformer(query, resultClass);
		return query.list();
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public List<T> findAll(){
		return find((Page<T>)null, (List<Criterion>)null, (Order)null);
	}
	
	/**
	 * 查询所有
	 * @param order
	 * @return
	 */
	public List<T> findAll(Order order){
		return find((Page<T>)null, (List<Criterion>)null, order);
	}
	
	// -------------- Query Tools --------------
	
	/**
	 * 创建 Query 查询对象
	 * @param qlString
	 * @param parameters
	 * @return
	 */
	public Query createQuery(String qlString, Object[] parameters){
		Query query = getSession().createQuery(qlString);
		setParameter(query, parameters);
		return query;
	}
	
	/**
	 * 创建 SQL 查询对象
	 * @param sqlString
	 * @param parameters
	 * @return
	 */
	private SQLQuery createSqlQuery(String sqlString, Object[] parameters){
		SQLQuery query = getSession().createSQLQuery(sqlString);
		setParameter(query, parameters);
		return query;
	}
	
	/**
	 * 设置查询参数
	 * @param query
	 * @param parameter
	 */
	private void setParameter(Query query, Object[] parameters){
		for(int i=0; i<parameters.length; i++) {
			query.setParameter(i, parameters[i]);
		}
	}
	
	/**
	 * 设置查询结果类型
	 * @param query
	 * @param resultClass
	 */
	private void setResultTransformer(SQLQuery query, Class<?> resultClass){
		if (resultClass != null){
			if (resultClass == Map.class){
				query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
			}else if (resultClass == List.class){
				query.setResultTransformer(Transformers.TO_LIST);
			}else{
				query.addEntity(resultClass);
			}
		}
	}
	
	/** 
     * 去除qlString的select子句。 
     * @param qlString
     * @return 
     */  
    private String removeSelect(String qlString){  
        int beginPos = qlString.toLowerCase().indexOf("from");  
        return qlString.substring(beginPos);  
    }
    
    /** 
     * 去除hql的orderBy子句。 
     * @param qlString
     * @return 
     */  
    private String removeOrders(String qlString) {  
        Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);  
        Matcher m = p.matcher(qlString);  
        StringBuffer sb = new StringBuffer();  
        while (m.find()) {  
            m.appendReplacement(sb, "");  
        }
        m.appendTail(sb);
        return sb.toString();  
    } 
}
