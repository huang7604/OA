package com.office.automation.controller;


import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.activiti.engine.HistoryService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.office.automation.bean.MessageProcess;
import com.office.automation.bean.ProcessBean;
import com.office.automation.bean.User;
import com.office.automation.service.GIService;


@Controller
@RequestMapping("/home")
public class ActivityController {
	
	@Autowired
	private ProcessEngine processEngine;
	
	@Autowired
	private GIService giService;
	
	
	@RequestMapping("/listRunTask")
	public String listRunTask(Model model,HttpSession session){
		TaskService taskService=processEngine.getTaskService();
		User user=(User)session.getAttribute("user");
		List<Task> taskList=taskService.createTaskQuery()
				   .taskAssignee(String.valueOf(user.getId()))
				   .list();
		ArrayList<ProcessBean> beanList=new ArrayList<ProcessBean>();
		for(Task task: taskList){
			ProcessBean bean=new ProcessBean();
			MessageProcess messageProcess=(MessageProcess)taskService.getVariable(task.getId(), "messageProcess");
			bean.setId(task.getId());
			bean.setProcessName(messageProcess.getProcessName());
			bean.setUserName(giService.getUser(Integer.valueOf(task.getAssignee())).getName());
			bean.setTitle(messageProcess.getTitle());
			bean.setCreateDate(messageProcess.getCreateDate());
			bean.setStartDate(task.getCreateTime());
			bean.setTaskName(task.getName());
			beanList.add(bean);
		}
		model.addAttribute("beans", beanList);
		return "activity/listRunTask";
	}
	
	@RequestMapping("/listHistoryTask")
	public String listHistoryTask(Model model,HttpSession session){
		User user=(User)session.getAttribute("user");
		HistoryService historyService=processEngine.getHistoryService();
		List<HistoricTaskInstance> thList=historyService.createHistoricTaskInstanceQuery()
		              .taskAssignee(String.valueOf(user.getId()))
		              .finished()
		              .list();
		ArrayList<ProcessBean> beanList=new ArrayList<ProcessBean>();
		
		for(HistoricTaskInstance hTask: thList){
			ProcessBean bean=new ProcessBean();
			bean.setId(hTask.getId());
			bean.setUserName(giService.getUser(Integer.valueOf(hTask.getAssignee())).getName());
			bean.setEndDate(hTask.getEndTime());
			bean.setStartDate(hTask.getStartTime());
			bean.setTaskName(hTask.getName());
			bean.setProcessInstanceId(hTask.getProcessInstanceId());
			ProcessInstance pi=processEngine.getRuntimeService() // 获取运行时Service
		            .createProcessInstanceQuery() // 创建流程实例查询
		            .processInstanceId(hTask.getProcessInstanceId()) // 用流程实例id查询
		            .singleResult();
		    
			if(pi!=null){
		       bean.setType("流程正在执行！");
		    }else{
	        	bean.setType("流程已经执行结束！");
            }
			ProcessDefinition pd=processEngine.getRepositoryService()
			              .createProcessDefinitionQuery()
			              .processDefinitionId(hTask.getProcessDefinitionId())
			              .singleResult();
			if(pd.getName().equals("LeaveProcessName")){
				bean.setProcessName("请假申请");
			}else{
				bean.setProcessName(pd.getName());
			}
			beanList.add(bean);
		}
		
		model.addAttribute("beans", beanList);
		return "activity/listHistoryTask";
	}
	
	//AJAX访问
	@RequestMapping("/messageShow/{id}")
	public String messageShowAjax(Model model,@PathVariable int id,@RequestParam("name") String name){
		
		TaskService taskService=processEngine.getTaskService();
		MessageProcess messageProcess=(MessageProcess)taskService.getVariable(String.valueOf(id),"messageProcess");
		model.addAttribute("message", messageProcess);
		model.addAttribute("id", id);
		String result=null;
		if(name.equals("借款申请")){
			result= "activity/messageLoanShow";
		}else if(name.equals("请假申请")){
			result= "activity/messageLeaveShow";
		}else if(name.equals("出差申请")){
			result= "activity/messageBusinessTravelShow";
		}
		else if(name.equals("加班申请")){
			result= "activity/messageOvertimeShow";
		}
		
		return result;
		
	}
	
	//AJAX访问
	@RequestMapping("/historyShow/{id}")
	public String historyShowAjax(Model model,@PathVariable String id,@RequestParam("name") String name){
		HistoryService historyService=processEngine.getHistoryService();
		List<HistoricVariableInstance> list=historyService.createHistoricVariableInstanceQuery()
		              .processInstanceId(id)
		              .list();
		for(HistoricVariableInstance var:list){
			String varName=var.getVariableName();
			if(varName.equals("messageProcess")){
				MessageProcess messageProcess=(MessageProcess)var.getValue();
				model.addAttribute("message", messageProcess);
			}
			
		}
		
		String result=null;
		if(name.equals("借款申请")){
			result= "activity/historyLoanShow";
		}else if(name.equals("请假申请")){
			result= "activity/historyLeaveShow";
		}else if(name.equals("出差申请")){
			result= "activity/historyBusinessTravelShow";
		}else if(name.equals("加班申请")){
			result= "activity/historyOvertimeShow";
		}
		
		return result;
	
		
	}
	
	

}
