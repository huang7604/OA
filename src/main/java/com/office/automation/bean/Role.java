package com.office.automation.bean;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Role implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;         //½ÇÉ«±àºÅ
	private String name;     //½ÇÉ«Ãû³Æ
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
