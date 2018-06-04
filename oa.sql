/*员工信息*/
CREATE TABLE user(
   id int(11) NOT NULL,
   name varchar(30) NOT NULL,
   sex varchar(10) NOT NULL,
   birthtime datetime NOT NULL,
   address varchar(100) NOT NULL,
   email varchar(30) NOT NULL,
   tel varchar(20) NOT NULL,
   poliStatus varchar(20),
   school varchar(40) NOT NULL,
   graduDate datetime NOT NULL,
   diploma varchar(10) NOT NULL,
   major varchar(40) NOT NULL,
   professor varchar(20),
   remark varchar(100),
   joinDate datetime NOT NULL,
   leaveDate datetime,
   jobDate datetime NOT NULL,
   ctStartDate datetime NOT NULL,
   ctEndDate datetime NOT NULL,
   idCard varchar(30) NOT NULL,
   nation varchar(30) NOT NULL,
   nationality varchar(30) NOT NULL,
   PRIMARY KEY(id)
)engine=InnoDB DEFAULT charset=utf8;

/*部门信息*/
CREATE TABLE dept(
   id int(11) NOT NULL,
   name varchar(20) NOT NULL,
   leader int(11),
   remark varchar(100),
   PRIMARY KEY(id),
   CONSTRAINT fk_dept_user FOREIGN KEY(leader) REFERENCES user(id)
)engine=InnoDB DEFAULT charset=utf8;

/*用户部门信息*/
CREATE TABLE user_dept(
   id int(11) NOT NULL,
   uid int(11) NOT NULL,
   did int(11) NOT NULL,
   PRIMARY KEY(id),
   CONSTRAINT fk_userdept_user FOREIGN KEY(uid) REFERENCES user(id),
   CONSTRAINT fk_userdept_dept FOREIGN KEY(did) REFERENCES dept(id)
)engine=InnoDB DEFAULT charset=utf8;

/*公告信息*/
CREATE TABLE announcement(
   id int(11) NOT NULL,
   createDate datetime NOT NULL,
   topic varchar(30) NOT NULL,
   content varchar(200) NOT NULL,
   remark varchar(100),
   publisher int(11) NOT NULL,
   publishDept int(11),
   PRIMARY KEY(id),
   CONSTRAINT fk_aunouncement_user FOREIGN KEY(publisher) REFERENCES user(id),
   CONSTRAINT fk_aunouncement_dept FOREIGN KEY(publishDept) REFERENCES dept(id)
)engine=InnoDB DEFAULT charset=utf8;

/*角色信息*/
CREATE TABLE role(
   id int(11) NOT NULL,
   name varchar(30) NOT NULL,
   PRIMARY KEY(id)
)engine=InnoDB DEFAULT charset=utf8;

/*用户角色信息*/
CREATE TABLE user_role(
   id int(11) NOT NULL,
   uid int(11) NOT NULL,
   rid int(11) NOT NULL,
   PRIMARY KEY(id),
   CONSTRAINT fk_userrole_user FOREIGN KEY(uid) REFERENCES user(id),
   CONSTRAINT fk_userrole_role FOREIGN KEY(rid) REFERENCES role(id)
)engine=InnoDB DEFAULT charset=utf8;

/*登录信息表*/
CREATE TABLE admin(
  id int(11) NOT NULL,
  account int(11) NOT NULL,
  password varchar(100) NOT NULL,
  PRIMARY KEY(id)
)engine=InnoDB DEFAULT charset=utf8;

/*日程信息表*/
CREATE TABLE schedule(
  id int(11) NOT NULL  AUTO_INCREMENT,
  uid int(11) NOT NULL,
  title varchar(100),
  start datetime,
  end datetime,
  allDay boolean,
  PRIMARY KEY(id),
  CONSTRAINT fk_schedule_user FOREIGN KEY(uid) REFERENCES user(id)
)engine=InnoDB DEFAULT charset=utf8;

/*角色权限表*/
CREATE TABLE role_at(
  id int(11) NOT NULL  AUTO_INCREMENT,
  rid int(11) NOT NULL,
  functionId varchar(10) NOT NULL,
  functionName varchar(30) NOT NULL,
  isHave boolean NOT NULL,
  parentId varchar(10),
  PRIMARY KEY(id),
  CONSTRAINT fk_role_at FOREIGN KEY(rid) REFERENCES role(id)
)engine=InnoDB DEFAULT charset=utf8;

/*管理员*/
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','a','个人办公管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','a1','修改密码',TRUE,'a');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','a2','个人日程管理',TRUE,'a');

insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','b','公共信息管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','b1','查看公告',TRUE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','b2','发布公告',TRUE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','b3','公告管理',TRUE,'b');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','c','综合办公管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','c1','用户管理',TRUE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','c2','部门管理',TRUE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','c3','角色管理',TRUE,'c');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','d','工作流程管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','d1','请假申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','d2','借款申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','d3','出差申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2000','d4','加班申请',TRUE,'d');

/*普通员工*/
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','a','个人办公管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','a1','修改密码',TRUE,'a');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','a2','个人日程管理',TRUE,'a');

insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','b','公共信息管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','b1','查看公告',TRUE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','b2','发布公告',FALSE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','b3','公告管理',FALSE,'b');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','c','综合办公管理',FALSE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','c1','用户管理',FALSE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','c2','部门管理',FALSE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','c3','角色管理',FALSE,'c');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','d','工作流程管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','d1','请假申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','d2','借款申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','d3','出差申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2001','d4','加班申请',TRUE,'d');


/*部门经理*/
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','a','个人办公管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','a1','修改密码',TRUE,'a');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','a2','个人日程管理',TRUE,'a');

insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','b','公共信息管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','b1','查看公告',TRUE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','b2','发布公告',FALSE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','b3','公告管理',FALSE,'b');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','c','综合办公管理',FALSE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','c1','用户管理',FALSE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','c2','部门管理',FALSE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','c3','角色管理',FALSE,'c');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','d','工作流程管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','d1','请假申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','d2','借款申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','d3','出差申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2002','d4','加班申请',TRUE,'d');

/*总经理*/
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','a','个人办公管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','a1','修改密码',TRUE,'a');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','a2','个人日程管理',TRUE,'a');

insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','b','公共信息管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','b1','查看公告',TRUE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','b2','发布公告',FALSE,'b');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','b3','公告管理',FALSE,'b');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','c','综合办公管理',FALSE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','c1','用户管理',FALSE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','c2','部门管理',FALSE,'c');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','c3','角色管理',FALSE,'c');


insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','d','工作流程管理',TRUE,null);
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','d1','请假申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','d2','借款申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','d3','出差申请',TRUE,'d');
insert into role_at(rid,functionId,functionName,isHave,parentId) values('2003','d4','加班申请',TRUE,'d');

/*出纳*/
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','a','个人办公管理',TRUE,null,null);
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','a1','修改密码',TRUE,'a','/OfficeAutomation/home/adminModifyForm');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','a2','个人日程管理',TRUE,'a','/OfficeAutomation/home/calendar');

insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','b','公共信息管理',TRUE,null,null);
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','b1','查看公告',TRUE,'b','/OfficeAutomation/home/index');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','b2','发布公告',FALSE,'b','/OfficeAutomation/home/annoForm');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','b3','公告管理',FALSE,'b','/OfficeAutomation/home/listAnno?start=0');


insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','c','综合办公管理',FALSE,null,null);
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','c1','用户管理',FALSE,'c','/OfficeAutomation/home/listUser?start=0');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','c2','部门管理',FALSE,'c','/OfficeAutomation/home/listDept?start=0');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','c3','角色管理',FALSE,'c','/OfficeAutomation/home/listRole?start=0');


insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','d','工作流程管理',TRUE,null,null);
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2005','d1','请假申请',TRUE,'d','/OfficeAutomation/home/leaveForm');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('200 2','借款申请',TRUE,'d','/OfficeAutomation/home/loanForm');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2004','d3','出差申请',TRUE,'d','/OfficeAutomation/home/businessTravelForm');
insert into role_at(rid,functionId,functionName,isHave,parentId,url) values('2004','d4','加班申请',TRUE,'d','/OfficeAutomation/home/overtimeForm');

update role_at set url='/OfficeAutomation/home/adminModifyForm' where functionId='a1';
update role_at set url='/OfficeAutomation/home/calendar' where functionId='a2';

update role_at set url='/OfficeAutomation/home/index' where functionId='b1';
update role_at set url='/OfficeAutomation/home/annoForm' where functionId='b2';
update role_at set url='/OfficeAutomation/home/listAnno?start=0' where functionId='b3';

update role_at set url='/OfficeAutomation/home/listUser?start=0' where functionId='c1';
update role_at set url='/OfficeAutomation/home/listDept?start=0' where functionId='c2';
update role_at set url='/OfficeAutomation/home/listRole?start=0' where functionId='c3';

update role_at set url='/OfficeAutomation/home/leaveForm' where functionId='d1';
update role_at set url='/OfficeAutomation/home/loanForm' where functionId='d2';
update role_at set url='/OfficeAutomation/home/businessTravelForm' where functionId='d3';
update role_at set url='/OfficeAutomation/home/overtimeForm' where functionId='d4';
