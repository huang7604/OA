package com.office.automation.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.office.automation.bean.Announcement;
import com.office.automation.bean.Dept;
import com.office.automation.bean.User;
import com.office.automation.service.GIService;
import com.office.automation.util.Page;

@Controller
@RequestMapping("/home")
public class AnnoController {

	@Autowired
	private GIService service;
	@RequestMapping("/annoForm")
	public String announcementForm(Model model){
		model.addAttribute("anno", new Announcement());
		return "annoForm";
	}
	
	@RequestMapping("/annoForm/addAnno")
	public String announcementAdd(Model model,Announcement anno,HttpSession session){
		User user=(User)session.getAttribute("user");
		Dept dept=service.getUserDept(user.getId());
		anno.setPublisher(user);
		anno.setPublishDept(dept);
		anno.setCreateDate(new Date());
		service.addAnnouncement(anno);
		return "redirect:/home/listAnno?start=0";
	}
	
	@RequestMapping("/listAnno")
	public String listAnno(Model model,@RequestParam int start){
		Page page=new Page(0,10);
		page.setStart(start);
		page.setTotal(service.getAnnoTotal());
		model.addAttribute("annos",service.getAnnos(start,start+page.getCount()));
		model.addAttribute("page", page);
		return "listAnno";
	}
	
	@RequestMapping("/listAnno/editAnnoForm/{id}")
	public String editAnnoForm(Model model,@PathVariable int id){
		model.addAttribute("anno",service.getAnno(id));
		return "editAnnoForm";
	}
	
	@RequestMapping("/listAnno/deleteAnno/{id}")
	public String deleteAnno(@PathVariable int id){
		service.deleteAnno(id);
		return "redirect:/home/listAnno?start=0";
	}
	
	@RequestMapping("/listAnno/updateAnno")
	public String updateAnno(Announcement anno){
		service.updateAnno(anno);
		return "redirect:/home/listAnno?start=0";
	}
	
	@RequestMapping("/annoShow/{id}")
	public String annoShow(@PathVariable int id,Model model){
		model.addAttribute("anno", service.getAnno(id));
		return "annoShow";
	}
}
