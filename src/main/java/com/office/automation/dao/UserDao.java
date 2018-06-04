package com.office.automation.dao;

import java.util.ArrayList;



import com.office.automation.bean.User;


public interface UserDao {

	public ArrayList<User> getUsers(int start,int end);
	public int getUserCount();
	public void addUser(User user);
	public User getUser(int id);
	public void updateUser(User user);
	public void deleteUser(int id);
}
