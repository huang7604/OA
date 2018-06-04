package com.office.automation.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.office.automation.bean.Admin;
import com.office.automation.bean.Announcement;
import com.office.automation.bean.Dept;
import com.office.automation.bean.Role;
import com.office.automation.bean.RoleAt;
import com.office.automation.bean.User;
import com.office.automation.dao.AdminDao;
import com.office.automation.dao.AnnouncementDao;
import com.office.automation.dao.DeptDao;
import com.office.automation.dao.RoleAtDao;
import com.office.automation.dao.RoleDao;
import com.office.automation.dao.UserDao;
import com.office.automation.dao.UserDeptDao;
import com.office.automation.dao.UserRoleDao;

@Component
public class GIService {

	@Autowired
	private UserDao userDao;
	@Autowired
	private DeptDao deptDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private UserRoleDao userRoleDao;
	@Autowired
	private UserDeptDao userDeptDao;
	@Autowired
	private AnnouncementDao annoDao;
	@Autowired
	private RoleAtDao roleAtDao;
	//获取全部用户
	public ArrayList<User> getUsers(){
		return userDao.getUsers(0, 1000);
	}
	
	//获取部分用户
	public ArrayList<User> getUsers(int start,int end){
		ArrayList<User> users=new ArrayList<User>();
		users=userDao.getUsers(start, end);
		for(User user:users){
			user.setRole(getUserRole(user.getId()));
			user.setDept(getUserDept(user.getId()));
		}
		return users;
	}
	//获取用户数量
	public int getUserCount(){
		int total=userDao.getUserCount();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//添加用户
	public void addUser(User user){
		userDao.addUser(user);
	}
	
	//根据ID获取用户
	public User getUser(int id){
		User user=userDao.getUser(id);
		user.setRole(getUserRole(user.getId()));
		user.setDept(getUserDept(user.getId()));
		return user;
	}
	
	//更新用户数据
	public void updateUser(User user){
		
		userDao.updateUser(user);
	}
	
	//删除用户数据
	public void deleteUser(int id){
		userDao.deleteUser(id);
	}
	
	//获取全部部门信息
	public ArrayList<Dept> getDepts(){
		return deptDao.getDepts(0, Short.MAX_VALUE);
	}
	
	//获取部分部门信息
		public ArrayList<Dept> getDepts(int start,int end){
			return deptDao.getDepts(start,end);
		}
	
	//储存部门信息
	public void addDept(Dept dept){
		deptDao.addDept(dept);
	}
	
	//获取部门数量
	public int getTotal(){
		int total=deptDao.getTotal();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//根据ID获取部门信息
	public Dept getDept(int id){
		return deptDao.getDept(id);
	}
	
	//更新部门信息
	public void updateDept(Dept dept){
		deptDao.editDept(dept);
	}
	
	//删除部门信息
	public void deleteDept(int id){
		deptDao.deleteDept(id);
	}
	
	//获取角色的数量
	public int getRoleTotal(){
		int total=roleDao.getRoleTotal();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//获取全部角色信息
	public ArrayList<Role> getRoles(){
		return roleDao.getRoles(0, Short.MAX_VALUE);
	}
	
	//获取部分角色信息
	public ArrayList<Role> getRoles(int start,int end){
		return roleDao.getRoles(start, end);
	}
	
	//添加角色信息
	public void addRole(Role role){
		roleDao.addRole(role);
	}
	
	//根据ID获取角色信息
	public Role getRole(int id){
		return roleDao.getRole(id);
	}
	
	//更新角色信息
	public void updateRole(Role role){
		roleDao.updateRole(role);
	}
	
	//根据ID删除角色信息
	public void deleteRole(int id){
		roleDao.deleteRole(id);
	}
	
	//添加登录账户
	public void addAdmin(Admin admin){
		adminDao.addAdmin(admin);
	}
	
	//删除登录账户
	public void deleteAdmin(int id){
		adminDao.deleteAdmin(id);
	}
	
	//获取密码
	public String getPassword(String account){
		return adminDao.getPassword(account);
	}
	
	//修改密码
	public void updatePassword(int id,String password){
		adminDao.updatePassword(id, password);
	}
	
	//获取用户所属角色
	public Role getUserRole(int id){
		int rid=userRoleDao.getRoleId(id);
		Role role=new Role();
		if(rid!=0){
			role=roleDao.getRole(rid);;
		}
		return role;
	}
	
	//获取用户所属部门
	public Dept getUserDept(int id){
		int did=userDeptDao.getDeptId(id);
		Dept dept=new Dept();
		if(did!=0){
		   dept=deptDao.getDept(did);
		}
		return dept;
	}
	
	//修改所属角色
	public void modifyUserRole(int uid,int rid){
		userRoleDao.deleteUserRole(uid);
		userRoleDao.addUserRole(uid, rid);
	}
	
	//修改所属部门
	public void modifyUserDept(int uid,int did){
		userDeptDao.deleteUserDept(uid);
		userDeptDao.addUserDept(uid, did);
	}
	
	//删除所属角色
	public void deleteUserRole(int uid){
		userRoleDao.deleteUserRole(uid);
	}
		
	//删除所属部门
	public void deleteUserDept(int uid){
		userDeptDao.deleteUserDept(uid);
	}
		
	
	//添加公告
	public void addAnnouncement(Announcement anno){
		annoDao.addAnno(anno);
	}
	
	//获取公告总数
	public int getAnnoTotal(){
		int total=annoDao.getAnnoTotal();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//获取部分公告
	public ArrayList<Announcement> getAnnos(int start,int end){
		return annoDao.getAnnos(start,end);
	}
	
	//获取部分公告
	public ArrayList<Announcement> getAnnos(){
		return annoDao.getAnnos(0,Short.MAX_VALUE);
	}
	
	//根据ID获取公告
	public Announcement getAnno(int id){
		return annoDao.getAnno(id);
	}
	
	//删除公告
	public void deleteAnno(int id){
		annoDao.deleteAnno(id);
	}
	
	//更新公告
	public void updateAnno(Announcement anno){
		annoDao.updateAnno(anno);
	}
	
	//获取角色权限
	public ArrayList<RoleAt> getRoleAts(int rid){
		ArrayList<RoleAt> list=roleAtDao.getRoleAtsByNULL(rid);
		for(RoleAt roleAt:list){
			ArrayList<RoleAt> childList=roleAtDao.getRoleAts(rid, roleAt.getFunctionId());
			roleAt.setChildRoleAts(childList);
		}
		return list;
	}
	
	//更新权限
	public void updateRoleAt(int rid,String name,boolean isHave){
		roleAtDao.updateRoleAt(rid, name, isHave);
	}
	
	public void addRoleAt(int rid){
		roleAtDao.addRoleAt(rid);
	}
	
	public void deleteRoleAt(int rid){
		roleAtDao.deleteRoleAt(rid);
	}
}
