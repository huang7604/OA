package com.office.automation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.office.automation.bean.Dept;
import com.office.automation.service.GIService;
import com.office.automation.util.Page;

@Controller
@RequestMapping("/home")
public class DeptController {
	
	@Autowired
	private GIService service;
	
	@RequestMapping("/listDept")
	public String listDept(Model model,@RequestParam int start){
		Page page=new Page(0,10);
		page.setStart(start);
		page.setTotal(service.getTotal());
		model.addAttribute("depts",service.getDepts(start,start+page.getCount()));
		model.addAttribute("page", page);
		return "listDept";
	}
	
	@RequestMapping("/listDept/deptForm")
	public String deptForm(Model model){
		model.addAttribute("dept", new Dept());
		return "deptForm";
	}
	
	@RequestMapping("/listDept/addDept")
	public String addDept(Model model,Dept dept){
		service.addDept(dept);
		return "redirect:/home/listDept?start=0";
	}
	
	@RequestMapping("/listDept/editDeptForm/{id}")
	public String editDeptForm(Model model,@PathVariable int id){
		model.addAttribute("dept", service.getDept(id));
		return "editDeptForm";
	}
	
	@RequestMapping("/listDept/editDept")
	public String editDept(Dept dept){
		service.updateDept(dept);
		return "redirect:/home/listDept?start=0";
		//return "test";
	}
	
	@RequestMapping("/listDept/deleteDept/{id}")
	public String editDept(@PathVariable int id){
		service.deleteDept(id);
		return "redirect:/home/listDept?start=0";
		
	}
}
