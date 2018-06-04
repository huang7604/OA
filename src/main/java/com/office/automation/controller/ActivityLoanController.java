package com.office.automation.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.office.automation.bean.MessageProcess;
import com.office.automation.bean.User;
import com.office.automation.service.ActivityService;
import com.office.automation.service.GIService;

@Controller
@RequestMapping("/home")
public class ActivityLoanController {

	@Autowired
	private ProcessEngine processEngine;
	@Autowired
	private ActivityService service;
	@Autowired
	private GIService giService;
	
	@RequestMapping("/loanForm")
	public String leaveForm(Model model){
		model.addAttribute("messageProcess", new MessageProcess());
		return "activity/loanForm";
	}
	
	@RequestMapping("/loanForm/startLoanProcess")
	public String addLoanProcess(Model model,MessageProcess messageProcess,HttpSession session){
		User user=(User)session.getAttribute("user");
		messageProcess.setUserName(user.getName());
		messageProcess.setProcessName("借款申请");
		messageProcess.setDept(user.getDept().getName());
		messageProcess.setCreateDate(new Date());
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("messageProcess", messageProcess);
		map.put("userId", String.valueOf(user.getId()));
		map.put("appUserId", String.valueOf(user.getDept().getLeader().getId()));
		map.put("managerUserId", String.valueOf(service.getUserIdByRoleName("总经理")));
		map.put("cashierId",String.valueOf(service.getUserIdByRoleName("出纳")));
		RuntimeService runtimeService=processEngine.getRuntimeService();
		runtimeService.startProcessInstanceByKey("loanProcessId", map);
		return "redirect:/home/listRunTask";
	}
	
	//完成任务
	@RequestMapping("/loanForm/finishLoanTask/{id}")
	public String finishLoanTask(@PathVariable String id,@RequestParam String reason,@RequestParam String message,@RequestParam String user){
		TaskService taskService=processEngine.getTaskService();
		MessageProcess messageProcess=(MessageProcess)taskService.getVariable(String.valueOf(id),"messageProcess");
			
		if(user.equals("leader")){
			messageProcess.setLeaderReason(reason);
			messageProcess.setLeaderCreateDate(new Date());
			if(message.equals("yes")){
				messageProcess.setLeaderMessage("同意");
				String appManagerId=(String)taskService.getVariable(id, "managerUserId");
				messageProcess.setManagerName(giService.getUser(Integer.valueOf(appManagerId)).getName());
			}else if(message.equals("no")){
				messageProcess.setLeaderMessage("不同意");
			}
				Map<String, Object> map=new HashMap<String,Object>();
				map.put("message",messageProcess.getLeaderMessage());
				taskService.setVariable(id, "messageProcess", messageProcess);
				taskService.complete(id,map);
			}else if(user.equals("manager")){
				messageProcess.setManagerReason(reason);
				messageProcess.setManagerCreateDate(new Date());
				if(message.equals("yes")){
					messageProcess.setManagerMessage("同意");
					String cashierId=(String)taskService.getVariable(id, "cashierId");
					messageProcess.setCashierName(giService.getUser(Integer.valueOf(cashierId)).getName());
				}else if(message.equals("no")){
					messageProcess.setManagerMessage("不同意");
				}
				Map<String, Object> map=new HashMap<String,Object>();
				map.put("message",messageProcess.getManagerMessage());
				taskService.setVariable(id, "messageProcess", messageProcess);
				taskService.complete(id,map);
			}else if(user.equals("cashier")){
				messageProcess.setCashierReason(reason);
				messageProcess.setCashierCreateDate(new Date());
				if(message.equals("yes")){
					messageProcess.setCashierMessage("同意");
				}else if(message.equals("no")){
					messageProcess.setCashierMessage("不同意");
				}
				taskService.setVariable(id, "messageProcess", messageProcess);
				taskService.complete(id);
			}else if(user.equals("user")){
				String appUserId=(String)taskService.getVariable(id, "appUserId");
				messageProcess.setLeaderName(giService.getUser(Integer.valueOf(appUserId)).getName());
				taskService.setVariable(id, "messageProcess", messageProcess);
				taskService.complete(id);
			}
			
		return "redirect:/home/listRunTask";
	}
}
