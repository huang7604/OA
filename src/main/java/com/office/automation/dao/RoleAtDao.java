package com.office.automation.dao;

import java.util.ArrayList;

import com.office.automation.bean.RoleAt;

public interface RoleAtDao {

	public ArrayList<RoleAt> getRoleAts(int rid,String parentId);
	public ArrayList<RoleAt> getRoleAtsByNULL(int rid);
	public void updateRoleAt(int rid,String name,boolean isHave);
	public void addRoleAt(int rid);
	public void deleteRoleAt(int rid);
}
