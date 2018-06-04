package com.office.automation.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.office.automation.bean.Schedule;
import com.office.automation.bean.User;
import com.office.automation.dao.ScheduleDao;

@Controller
@RequestMapping("/home")
public class CalendarController {
	
	@Autowired
	private ScheduleDao scheduleDao;
	@RequestMapping("/calendar/scheduleForm")
	public String calendarForm(Model model,@RequestParam("date") Date date){
		Schedule schedule=new Schedule();
		schedule.setStart(date);
		model.addAttribute("schedule",schedule);
		return "included/scheduleForm";
	}
	
	@ResponseBody
	@RequestMapping("/calendar/json")
	public List<Schedule> getJson(HttpSession session){
		User user=(User)session.getAttribute("user");
		List<Schedule> list=new ArrayList<Schedule>();
		list=scheduleDao.getSchedules(user.getId());
		return list;
	}
	
	@RequestMapping("/calendar/addSchedule")
	public String addSchedule(Schedule schedule,HttpSession session){
		User user=(User)session.getAttribute("user");
		schedule.setUser(user);
		scheduleDao.addSchedule(schedule);
		return "redirect:/home/calendar";
	}
	
	@RequestMapping("/calendar/scheduleUpdateForm")
	public String updateScheduleForm(Model model,@RequestParam("id") int id){
		model.addAttribute("schedule",scheduleDao.getScheduleById(id));
		return "included/scheduleUpdateForm";
	}
	
	@RequestMapping("/calendar/updateSchedule")
	public String updateSchedule(Schedule schedule){
		scheduleDao.updateSchedule(schedule);
		return "redirect:/home/calendar";
	}
	
	@RequestMapping("/calendar/deleteSchedule/{id}")
	public String deleteSchedule(Schedule schedule,@PathVariable int id){
		scheduleDao.deleteSchedule(id);
		return "redirect:/home/calendar";
	}

}
