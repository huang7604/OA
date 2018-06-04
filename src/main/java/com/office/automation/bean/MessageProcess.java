package com.office.automation.bean;

import java.io.Serializable;
import java.util.Date;

public class MessageProcess implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private String processInstanceId;
	private String type;
	private String userName;
	private String processName;
	private String title;
	private String dept;
	private Date startDate;
	private Date endDate;
	private String reason;
	private Date createDate;
	private double money;
	private String address;
	private String leaderName;
	private String leaderReason;
	private String leaderMessage;
	private Date leaderCreateDate;
	private String managerName;
	private String managerReason;
	private String managerMessage;
	private Date managerCreateDate;
	private String cashierName;
	private String cashierReason;
	private String cashierMessage;
	private Date cashierCreateDate;
	
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public String getLeaderReason() {
		return leaderReason;
	}
	public void setLeaderReason(String leaderReason) {
		this.leaderReason = leaderReason;
	}
	public String getLeaderMessage() {
		return leaderMessage;
	}
	public void setLeaderMessage(String leaderMessage) {
		this.leaderMessage = leaderMessage;
	}
	
	public String getManagerReason() {
		return managerReason;
	}
	public void setManagerReason(String managerReason) {
		this.managerReason = managerReason;
	}
	public String getManagerMessage() {
		return managerMessage;
	}
	public void setManagerMessage(String managerMessage) {
		this.managerMessage = managerMessage;
	}
	public Date getLeaderCreateDate() {
		return leaderCreateDate;
	}
	public void setLeaderCreateDate(Date leaderCreateDate) {
		this.leaderCreateDate = leaderCreateDate;
	}
	public Date getManagerCreateDate() {
		return managerCreateDate;
	}
	public void setManagerCreateDate(Date managerCreateDate) {
		this.managerCreateDate = managerCreateDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProcessName() {
		return processName;
	}
	public void setProcessName(String processName) {
		this.processName = processName;
	}
	public String getProcessInstanceId() {
		return processInstanceId;
	}
	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getCashierName() {
		return cashierName;
	}
	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}
	public String getCashierReason() {
		return cashierReason;
	}
	public void setCashierReason(String cashierReason) {
		this.cashierReason = cashierReason;
	}
	public String getCashierMessage() {
		return cashierMessage;
	}
	public void setCashierMessage(String cashierMessage) {
		this.cashierMessage = cashierMessage;
	}
	public Date getCashierCreateDate() {
		return cashierCreateDate;
	}
	public void setCashierCreateDate(Date cashierCreateDate) {
		this.cashierCreateDate = cashierCreateDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String adress) {
		this.address = adress;
	}

}
