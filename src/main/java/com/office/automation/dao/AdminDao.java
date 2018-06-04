package com.office.automation.dao;

import com.office.automation.bean.Admin;

public interface AdminDao {

	public void addAdmin(Admin admin);
	public void deleteAdmin(int id);
	public String getPassword(String account);
	public void updatePassword(int id,String password);
}
