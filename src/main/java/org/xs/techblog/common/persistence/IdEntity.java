package org.xs.techblog.common.persistence;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.hibernate.annotations.GenericGenerator;

/**
 * 主键属性
 */
@MappedSuperclass
public abstract class IdEntity extends BaseEntity {
	
	@Id
	@GeneratedValue(generator="base58-uuid")
	@GenericGenerator(name="base58-uuid", strategy="org.xs.techblog.common.persistence.Base58UuidGenerator")
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
