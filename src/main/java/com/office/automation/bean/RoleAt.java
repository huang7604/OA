package com.office.automation.bean;

import java.util.ArrayList;

public class RoleAt {

	private int id;
	private int rid;
	private String functionId;
	private String functionName;
	private boolean isHave;
	private String parentId;
	private String url;
	private ArrayList<RoleAt> childRoleAts;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getFunctionId() {
		return functionId;
	}
	public void setFunctionId(String functionId) {
		this.functionId = functionId;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public boolean getIsHave() {
		return isHave;
	}
	public void setIsHave(boolean isHave) {
		this.isHave = isHave;
	}
	
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public ArrayList<RoleAt> getChildRoleAts() {
		return childRoleAts;
	}
	public void setChildRoleAts(ArrayList<RoleAt> childRoleAts) {
		this.childRoleAts = childRoleAts;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
