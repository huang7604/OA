package com.office.automation.dao;

import java.util.ArrayList;

import com.office.automation.bean.Dept;

public interface DeptDao {
	
	public ArrayList<Dept> getDepts(int start,int end);
	public void addDept(Dept dept);
	public int getTotal();
	public Dept getDept(int id);
	public void editDept(Dept dept);
	public void deleteDept(int id);

}
