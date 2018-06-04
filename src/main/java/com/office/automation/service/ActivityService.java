package com.office.automation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.office.automation.dao.UserRoleDao;

@Component
public class ActivityService {
	
	@Autowired
	private UserRoleDao userRoleDao;
	
	//���ݽ�ɫ���ƻ�ȡ�û�ID
	public int getUserIdByRoleName(String name){
		return userRoleDao.getUserIdByRoleName(name);
	}

}
