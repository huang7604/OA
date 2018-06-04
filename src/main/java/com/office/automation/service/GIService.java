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
	//��ȡȫ���û�
	public ArrayList<User> getUsers(){
		return userDao.getUsers(0, 1000);
	}
	
	//��ȡ�����û�
	public ArrayList<User> getUsers(int start,int end){
		ArrayList<User> users=new ArrayList<User>();
		users=userDao.getUsers(start, end);
		for(User user:users){
			user.setRole(getUserRole(user.getId()));
			user.setDept(getUserDept(user.getId()));
		}
		return users;
	}
	//��ȡ�û�����
	public int getUserCount(){
		int total=userDao.getUserCount();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//����û�
	public void addUser(User user){
		userDao.addUser(user);
	}
	
	//����ID��ȡ�û�
	public User getUser(int id){
		User user=userDao.getUser(id);
		user.setRole(getUserRole(user.getId()));
		user.setDept(getUserDept(user.getId()));
		return user;
	}
	
	//�����û�����
	public void updateUser(User user){
		
		userDao.updateUser(user);
	}
	
	//ɾ���û�����
	public void deleteUser(int id){
		userDao.deleteUser(id);
	}
	
	//��ȡȫ��������Ϣ
	public ArrayList<Dept> getDepts(){
		return deptDao.getDepts(0, Short.MAX_VALUE);
	}
	
	//��ȡ���ֲ�����Ϣ
		public ArrayList<Dept> getDepts(int start,int end){
			return deptDao.getDepts(start,end);
		}
	
	//���沿����Ϣ
	public void addDept(Dept dept){
		deptDao.addDept(dept);
	}
	
	//��ȡ��������
	public int getTotal(){
		int total=deptDao.getTotal();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//����ID��ȡ������Ϣ
	public Dept getDept(int id){
		return deptDao.getDept(id);
	}
	
	//���²�����Ϣ
	public void updateDept(Dept dept){
		deptDao.editDept(dept);
	}
	
	//ɾ��������Ϣ
	public void deleteDept(int id){
		deptDao.deleteDept(id);
	}
	
	//��ȡ��ɫ������
	public int getRoleTotal(){
		int total=roleDao.getRoleTotal();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//��ȡȫ����ɫ��Ϣ
	public ArrayList<Role> getRoles(){
		return roleDao.getRoles(0, Short.MAX_VALUE);
	}
	
	//��ȡ���ֽ�ɫ��Ϣ
	public ArrayList<Role> getRoles(int start,int end){
		return roleDao.getRoles(start, end);
	}
	
	//��ӽ�ɫ��Ϣ
	public void addRole(Role role){
		roleDao.addRole(role);
	}
	
	//����ID��ȡ��ɫ��Ϣ
	public Role getRole(int id){
		return roleDao.getRole(id);
	}
	
	//���½�ɫ��Ϣ
	public void updateRole(Role role){
		roleDao.updateRole(role);
	}
	
	//����IDɾ����ɫ��Ϣ
	public void deleteRole(int id){
		roleDao.deleteRole(id);
	}
	
	//��ӵ�¼�˻�
	public void addAdmin(Admin admin){
		adminDao.addAdmin(admin);
	}
	
	//ɾ����¼�˻�
	public void deleteAdmin(int id){
		adminDao.deleteAdmin(id);
	}
	
	//��ȡ����
	public String getPassword(String account){
		return adminDao.getPassword(account);
	}
	
	//�޸�����
	public void updatePassword(int id,String password){
		adminDao.updatePassword(id, password);
	}
	
	//��ȡ�û�������ɫ
	public Role getUserRole(int id){
		int rid=userRoleDao.getRoleId(id);
		Role role=new Role();
		if(rid!=0){
			role=roleDao.getRole(rid);;
		}
		return role;
	}
	
	//��ȡ�û���������
	public Dept getUserDept(int id){
		int did=userDeptDao.getDeptId(id);
		Dept dept=new Dept();
		if(did!=0){
		   dept=deptDao.getDept(did);
		}
		return dept;
	}
	
	//�޸�������ɫ
	public void modifyUserRole(int uid,int rid){
		userRoleDao.deleteUserRole(uid);
		userRoleDao.addUserRole(uid, rid);
	}
	
	//�޸���������
	public void modifyUserDept(int uid,int did){
		userDeptDao.deleteUserDept(uid);
		userDeptDao.addUserDept(uid, did);
	}
	
	//ɾ��������ɫ
	public void deleteUserRole(int uid){
		userRoleDao.deleteUserRole(uid);
	}
		
	//ɾ����������
	public void deleteUserDept(int uid){
		userDeptDao.deleteUserDept(uid);
	}
		
	
	//��ӹ���
	public void addAnnouncement(Announcement anno){
		annoDao.addAnno(anno);
	}
	
	//��ȡ��������
	public int getAnnoTotal(){
		int total=annoDao.getAnnoTotal();
		if(total<1){
			total=1;
		}
		return total;
	}
	
	//��ȡ���ֹ���
	public ArrayList<Announcement> getAnnos(int start,int end){
		return annoDao.getAnnos(start,end);
	}
	
	//��ȡ���ֹ���
	public ArrayList<Announcement> getAnnos(){
		return annoDao.getAnnos(0,Short.MAX_VALUE);
	}
	
	//����ID��ȡ����
	public Announcement getAnno(int id){
		return annoDao.getAnno(id);
	}
	
	//ɾ������
	public void deleteAnno(int id){
		annoDao.deleteAnno(id);
	}
	
	//���¹���
	public void updateAnno(Announcement anno){
		annoDao.updateAnno(anno);
	}
	
	//��ȡ��ɫȨ��
	public ArrayList<RoleAt> getRoleAts(int rid){
		ArrayList<RoleAt> list=roleAtDao.getRoleAtsByNULL(rid);
		for(RoleAt roleAt:list){
			ArrayList<RoleAt> childList=roleAtDao.getRoleAts(rid, roleAt.getFunctionId());
			roleAt.setChildRoleAts(childList);
		}
		return list;
	}
	
	//����Ȩ��
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
