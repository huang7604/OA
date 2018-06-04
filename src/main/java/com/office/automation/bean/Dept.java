package com.office.automation.bean;



import java.io.Serializable;

import org.springframework.stereotype.Component;
@Component
public class Dept implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;            //部门编号
	           
	private String  name;      //部门名称
	private User  leader;     //部门经理
	private String  remark;    //备注
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
