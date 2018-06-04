package com.office.automation.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.office.automation.bean.Role;

import com.office.automation.service.GIService;
import com.office.automation.util.Page;

@Controller
@RequestMapping("/home")
public class RoleController {
	
	@Autowired
	private GIService service;
	
	@RequestMapping("/listRole")
	public String listRole(Model model,@RequestParam int start){
		Page page=new Page(0,10);
		page.setStart(start);
		int total=service.getRoleTotal();
		if(total==0){
			total=1;
		}
		page.setTotal(total);
		model.addAttribute("roles",service.getRoles(start,start+page.getCount()));
		model.addAttribute("page", page);
		return "listRole";
	}
	
	@RequestMapping("/listRole/RoleForm")
	public String roleForm(Model model){
		model.addAttribute("role", new Role());
		return "roleForm";
	}
	
	@RequestMapping("/listRole/addRole")
	public String addRole(Model model,Role role){
		service.addRole(role);
		service.addRoleAt(role.getId());
		return "redirect:/home/listRole?start=0";
	}
	
	@RequestMapping("/listRole/editRoleForm/{id}")
	public String editRoleForm(Model model,@PathVariable int id){
		model.addAttribute("role",service.getRole(id));
		model.addAttribute("ras",service.getRoleAts(id));
		return "editRoleForm";
	}
	
	@RequestMapping("/listRole/editRole")
	public String editRole(Role role){
		service.updateRole(role);
		return "redirect:/home/listRole?start=0";
		//return "test";
	}
	
	@RequestMapping("/listRole/deleteRole/{id}")
	public String editRole(@PathVariable int id){
		service.deleteRoleAt(id);
	    service.deleteRole(id);
		return "redirect:/home/listRole?start=0";
		
	}
	
	//ajax更新权限
	@RequestMapping("/listRole/updateRoleAt/{id}")
	public @ResponseBody String updateRoleAt(@PathVariable int id,@RequestParam("name") String name,@RequestParam("isHave") boolean isHave){
	    service.updateRoleAt(id, name, isHave);
		return "success";
	}
	
	

}
