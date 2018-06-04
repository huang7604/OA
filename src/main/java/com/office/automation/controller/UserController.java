package com.office.automation.controller;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.office.automation.bean.Admin;
import com.office.automation.bean.User;
import com.office.automation.service.GIService;
import com.office.automation.util.MD5;
import com.office.automation.util.Page;

@Controller
@RequestMapping("/home")
public class UserController {

	@Autowired
	private GIService service;
	@Autowired 
	private MD5 md5;
	
	@RequestMapping("/listUser//userForm")
	public String user(Model model){
		model.addAttribute("user", new User());
		return "userForm";
	}
	
	@RequestMapping("listUser")
	public String listUser(Model model,@RequestParam int start){
		Page page=new Page(0,10);
		page.setTotal(service.getUserCount());
		page.setStart(start);
		model.addAttribute("users", service.getUsers(start,start+page.getCount()));
		model.addAttribute("page", page);
		return "listUser";
	}
	
	@RequestMapping("/listUser/addUser")
	public String addUser(Model model,User user){
		service.addUser(user);
		String password=null;
		try {
			 password=md5.EncoderByMd5("123456");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Admin admin=new Admin();
		admin.setId(user.getId());
		admin.setAccount(user.getId());
		admin.setPassword(password);
		//Ìí¼ÓµÇÂ¼ÕË»§
		service.addAdmin(admin);
		return "redirect:/home/listUser?start=0";
	}
	
	@RequestMapping("/listUser/editUserForm/{id}")
	public String editForm(Model model,@PathVariable int id){
		model.addAttribute("user", service.getUser(id));
		return "editUserForm";
	}
	
	@RequestMapping("/listUser/editUser")
	public String editUser(Model model,@ModelAttribute User user){
		service.updateUser(user);
		return "redirect:/home/listUser?start=0";
		
		
	}
	
	@RequestMapping("/listUser/deleteUser/{id}")
	public String deleteUser(@PathVariable int id){
		service.deleteUser(id);
		//É¾³ýµÇÂ¼ÕË»§
        service.deleteAdmin(id);
		return "redirect:/home/listUser?start=0";
	}
	
	@RequestMapping("/listUser/userRoleForm/{uid}")
	public String userRoleForm(Model model,@PathVariable int uid){
		model.addAttribute("roles", service.getRoles());
		model.addAttribute("uid", uid);
		model.addAttribute("role", service.getUserRole(uid));
		return "userRoleForm";
	}
	
	@RequestMapping("/listUser/userDeptForm/{uid}")
	public String userDeptForm(Model model,@PathVariable int uid){
		model.addAttribute("depts", service.getDepts());
		model.addAttribute("uid", uid);
		model.addAttribute("dept",service.getUserDept(uid));
		return "userDeptForm";
	}
	
	@RequestMapping("/listUser/userRole/{uid}")
	public String userRole(@PathVariable int uid,@RequestParam int rid){
		service.modifyUserRole(uid, rid);
		return "redirect:/home/listUser?start=0";
	}
	
	@RequestMapping("/listUser/userDept/{uid}")
	public String userDept(@PathVariable int uid,@RequestParam int did){
		service.modifyUserDept(uid, did);
		return "redirect:/home/listUser?start=0";
	}
	
	@RequestMapping("/listUser/deleteUserRole/{uid}")
	public String deleteUserRole(@PathVariable int uid){
		service.deleteUserRole(uid);
		return "redirect:/home/listUser?start=0";
	}
	
	@RequestMapping("/listUser/deleteUserDept/{uid}")
	public String deleteUserDept(@PathVariable int uid){
		service.deleteUserDept(uid);
		return "redirect:/home/listUser?start=0";
	}
	
}
