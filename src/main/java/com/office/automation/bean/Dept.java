package com.office.automation.bean;



import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class Dept implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;            //���ű��
	           
	private String  name;      //��������
	private User  leader;     //���ž���
	private String  remark;    //��ע
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
	public User getLeader() {
		return leader;
	}
	public void setLeader(User learder) {
		this.leader = learder;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
