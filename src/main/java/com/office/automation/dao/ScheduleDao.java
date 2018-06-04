package com.office.automation.dao;

import java.util.ArrayList;

import com.office.automation.bean.Schedule;

public interface ScheduleDao {

	public ArrayList<Schedule> getSchedules(int uid);
	public Schedule getScheduleById(int id);
	public void addSchedule(Schedule schedule);
	public void updateSchedule(Schedule schedule);
	public void deleteSchedule(int id);
}
