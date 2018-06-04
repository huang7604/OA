package com.office.automation.bean;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Admin implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;          //µÇÂ¼ÐÅÏ¢±àºÅ
	private int account;     //µÇÂ¼ÕË»§
	private String password;  //µÇÂ¼ÃÜÂë
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
