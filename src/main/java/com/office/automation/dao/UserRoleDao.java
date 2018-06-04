package com.office.automation.dao;

public interface UserRoleDao {
	
	public int getRoleId(int uid);
	public void deleteUserRole(int id);
	public void addUserRole(int uid,int rid);
	public int getUserIdByRoleName(String name);
}
