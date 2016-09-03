package org.xs.techblog.modules.blog.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.xs.techblog.common.persistence.IdEntity;

/**
 * 文章实体类
 */
@Entity
@Table(name="techblog_daily")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Daily extends IdEntity{
	
	private String dailyName; //文章名称
	private String dailyContent; //文章内容
	private String pageViews; //浏览量
	private String pageReviews; //评论量
	private String categoryId; //分类id
	@Column(updatable=false)
	private String userId; //用户id
	@Column(updatable=false)
	private Date createDate; //创建时间
	private Date updateDate; //更新时间
	
	public Daily() {}
	
	public Daily(String id, String dailyName, String pageViews, String pageReviews, String categoryId, String userId, Date createDate, Date updateDate) {
		setId(id);
		this.dailyName = dailyName;
		this.pageViews = pageReviews;
		this.pageReviews = pageReviews;
		this.categoryId = categoryId;
		this.userId = userId;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	public String getDailyName() {
		return dailyName;
	}
	public void setDailyName(String dailyName) {
		this.dailyName = dailyName;
	}
	public String getDailyContent() {
		return dailyContent;
	}
	public void setDailyContent(String dailyContent) {
		this.dailyContent = dailyContent;
	}
	public String getPageViews() {
		return pageViews;
	}
	public void setPageViews(String pageViews) {
		this.pageViews = pageViews;
	}
	public String getPageReviews() {
		return pageReviews;
	}
	public void setPageReviews(String pageReviews) {
		this.pageReviews = pageReviews;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
}
