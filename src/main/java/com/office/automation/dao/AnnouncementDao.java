package com.office.automation.dao;

import java.util.ArrayList;

import com.office.automation.bean.Announcement;

public interface AnnouncementDao {

	public void addAnno(Announcement anno);
	public int getAnnoTotal();
	public ArrayList<Announcement> getAnnos(int start,int end);
	public Announcement getAnno(int id);
	public void deleteAnno(int id);
	public void updateAnno(Announcement anno);
}
