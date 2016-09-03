package org.xs.techblog.modules.blog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.xs.techblog.common.persistence.IdEntity;

/**
 * 分类实体类
 */
@Entity
@Table(name="techblog_category")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Category extends IdEntity{
	
	private String categoryName; //分类名称
	private String categoryContent; //分类内容
	private String imageUrl; //图片地址
	private String imageKey; //图片key
	private String parentId; //父级id
	@Column(updatable=false)
	private String userId; //用户id
	private Integer orderId; //排序号
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryContent() {
		return categoryContent;
	}
	public void setCategoryContent(String categoryContent) {
		this.categoryContent = categoryContent;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getImageKey() {
		return imageKey;
	}
	public void setImageKey(String imageKey) {
		this.imageKey = imageKey;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
}
