package com.office.automation.dao;

public interface UserDeptDao {

	public int getDeptId(int uid);
	public void deleteUserDept(int id);
	public void addUserDept(int uid,int did);
}
