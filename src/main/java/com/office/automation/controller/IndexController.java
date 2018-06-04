package com.office.automation.controller;



import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.office.automation.bean.User;
import com.office.automation.service.GIService;
import com.office.automation.util.MD5;


@Controller
@RequestMapping("/home")
public class IndexController {

	@Autowired
	private GIService service;
	
	@Autowired
	private MD5 md5;
	
	
	
	@RequestMapping("/index")
	public String index(Model model){
		model.addAttribute("annos", service.getAnnos());
		
		return "index";
	}
	
	@RequestMapping("/login")
	public String login(Model model){
		model.addAttribute("loginForm",true);
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		session.removeAttribute("roleAts");
		return "index";
	}
	
	@RequestMapping("/check")
	public String loginCheck(Model model,@RequestParam String account,@RequestParam String password,HttpSession session){
		String result="login";
		String oldPassword=service.getPassword(account);
		if(oldPassword==null||oldPassword.equals("")){
			model.addAttribute("error", "’ÀªßªÚ√‹¬Î¥ÌŒÛ");
			model.addAttribute("loginForm",true);
			return result;
		}
		try {
			if(md5.checkpassword(password, oldPassword)){
				User user=service.getUser(Integer.valueOf(account));
				session.setAttribute("user", user);
				session.setAttribute("roleAts",service.getRoleAts(user.getRole().getId()));
				result="redirect:/home/index";
			}else{
			    model.addAttribute("loginForm",true);
				model.addAttribute("error", "’ÀªßªÚ√‹¬Î¥ÌŒÛ");
			}
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/calendar")
	public String CalendarManager(Model model){
		return "fullCalendar";
	}
	
	
}
