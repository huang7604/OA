package com.office.automation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.office.automation.dao.UserRoleDao;

@Component
public class ActivityService {
	
	@Autowired
	private UserRoleDao userRoleDao;
	
	//根据角色名称获取用户ID
	public int getUserIdByRoleName(String name){
		return userRoleDao.getUserIdByRoleName(name);
	}

}
