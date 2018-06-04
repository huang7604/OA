package com.office.automation.bean;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class Announcement implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;                //公告编号
	private Date  createDate;      //公告创建时间
	private String  topic;         //主题
	private String  content;       //内容
	private String  remark;        //备注
	private User  publisher;       //发布人
	private Dept  publishDept;     //发布部门
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public User getPublisher() {
		return publisher;
	}
	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}
	public Dept getPublishDept() {
		return publishDept;
	}
	public void setPublishDept(Dept publishDept) {
		this.publishDept = publishDept;
	}
}
