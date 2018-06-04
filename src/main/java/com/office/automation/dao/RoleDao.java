package com.office.automation.dao;

import java.util.ArrayList;

import com.office.automation.bean.Role;

public interface RoleDao {
	
	public ArrayList<Role> getRoles(int start,int end);
    public int getRoleTotal();
    public void addRole(Role role);
    public Role getRole(int id);
    public void updateRole(Role role);
    public void deleteRole(int id);

}
