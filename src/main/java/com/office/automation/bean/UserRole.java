package com.office.automation.bean;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class UserRole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;        //用户角色信息
	private User uid;      //用户
	private Role rid;      //角色
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getUid() {
		return uid;
	}
	public void setUid(User uid) {
		this.uid = uid;
	}
	public Role getRid() {
		return rid;
	}
	public void setRid(Role rid) {
		this.rid = rid;
	}
	
}
