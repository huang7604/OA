package com.office.automation.bean;

import java.io.Serializable;
import java.util.Date;


import org.springframework.stereotype.Component;

@Component
public class User implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;                //用户ID
	
	private String  name;          //用户姓名
	
	private String  sex;           //用户性别
 
	private Date  birthtime;       //用户生日
	
	private String  address;       //用户地址
	
	private String email;          //用户邮箱
	
	private String  tel;           //用户电话
	private String poliStatus;     //用户政治面貌
	
	private String  school;        //用户学校
	
	private Date  graduDate;       //毕业时间
	
	private String  diploma;       //学历
	
	private String  major;         //专业
	
	private String  professor;     //职称
	private String  remark;        //备注
	
	private Date  joinDate;        //入职时间
	
	private Date  leaveDate;       //离职时间
	
	private Date  jobDate;         //开始工作时间
	
	private Date  ctStartDate;     //合同开始时间
	
	private Date  ctEndDate;       //合同结束时间
	
	private String  idCard;        //省份证
	
	private String  nation;        //民族
	
	private String  nationality;   //国籍
	
    private Role  role;        //所属角色
	
	private Dept  dept;        //所属部门
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getName(){
		return name;
	}
	
	public void setSex(String sex){
		this.sex=sex;
	}
	
	public String getSex(){
		return sex;
	}

	public Date getBirthtime() {
		return birthtime;
	}

	public void setBirthtime(Date birthtime) {
		this.birthtime = birthtime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getPoliStatus() {
		return poliStatus;
	}

	public void setPoliStatus(String poliStatus) {
		this.poliStatus = poliStatus;
	}

	public Date getGraduDate() {
		return graduDate;
	}

	public void setGraduDate(Date graduDate) {
		this.graduDate = graduDate;
	}

	public String getDiploma() {
		return diploma;
	}

	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public Date getJobDate() {
		return jobDate;
	}

	public void setJobDate(Date jobDate) {
		this.jobDate = jobDate;
	}

	public Date getCtStartDate() {
		return ctStartDate;
	}

	public void setCtStartDate(Date ctStartDate) {
		this.ctStartDate = ctStartDate;
	}

	public Date getCtEndDate() {
		return ctEndDate;
	}

	public void setCtEndDate(Date ctEndDate) {
		this.ctEndDate = ctEndDate;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
}
