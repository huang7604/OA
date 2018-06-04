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
public class UserManngerController {

	@Autowired
	private GIService service;
	@Autowired
	private MD5 md5;
	@RequestMapping("/adminModifyForm")
	public String modifyForm(){
		return "adminModifyForm";
	}
	
	@RequestMapping("/adminModifyForm/modifyAdmin")
	public String modify(@RequestParam String password,@RequestParam String newPassword,@RequestParam String rePassword,Model model,HttpSession session){
		String result="index";
		if(!newPassword.equals(rePassword)){
			model.addAttribute("error", "ÐÂÃÜÂë²»Ò»ÖÂ");
			return "adminModifyForm";
		}
		User user=(User)session.getAttribute("user");
		String account=String.valueOf(user.getId());
		String oldPassword=service.getPassword(account);
		try {
			if(md5.checkpassword(password, oldPassword)){
				service.updatePassword(user.getId(), md5.EncoderByMd5(newPassword));
				session.removeAttribute("user");
			}else{
				model.addAttribute("error", "Ô­ÃÜÂë´íÎó");
				return "adminModifyForm";
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
}
