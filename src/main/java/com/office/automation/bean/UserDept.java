package com.office.automation.bean;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class UserDept implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;            //用户所属部门编号
	private User  uid;         //用户
	private Dept  did;         //部门
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
	public Dept getDid() {
		return did;
	}
	public void setDid(Dept did) {
		this.did = did;
	}
}
