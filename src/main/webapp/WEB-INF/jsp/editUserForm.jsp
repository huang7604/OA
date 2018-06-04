<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@include file="included/header.jsp" %>
    
    <div class="content">
      <div class="left-nav">
        <%@include file="included/leftnav.jsp" %>
      </div>
      <div class="right-main">
         <div class="title">
           <ol class="breadcrumb">
             <li><a href="">综合信息管理</a></li>
             <li><a href="/OfficeAutomation/home/listUser?start=0">员工管理</a></li>
             <li><a href="">员工信息修改</a></li>
           </ol>
         </div>
         <form:form commandName="user" action="/OfficeAutomation/home/listUser/editUser" method="post">
            <table class="addTable">
               <tr>
                 <td>员工编号</td>
                 <td><form:input path="id" id="id" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>员工姓名</td>
                 <td><form:input path="name" id="name" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="name"></form:errors></span></td>
              </tr>
              <tr>
                 <td>员工性别</td>
                 <td><form:input path="sex" id="sex" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="sex"></form:errors></span></td>
                 <td>省份证号码</td>
                 <td><form:input path="idCard" id="idCard" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="idCard"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>员工民族</td>
                 <td><form:input path="nation" id="nation" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="nation"></form:errors></span></td>
                 <td>员工国籍</td>
                 <td><form:input path="nationality" id="nationality" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="nationality"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>员工生日</td>
                 <td>
                   <fmt:formatDate value="${user.birthtime}" var="birthtime" pattern="yyyy-MM-dd" />
                   <form:input path="birthtime" id="birthtime" cssClass="form-control datepicker" value="${birthtime }" />
                 </td>
                 <td><span class="error"><form:errors path="birthtime"></form:errors></span></td>
                  <td>员工地址</td>
                 <td><form:input path="address" id="address" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="address"></form:errors></span></td>
              </tr>
              <tr>
                 <td>员工邮箱</td>
                 <td><form:input path="email" id="email" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="email"></form:errors></span></td>
                 <td>手机号码</td>
                 <td><form:input path="tel" id="tel" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="tel"></form:errors></span></td>
              </tr>
              <tr>
                 <td>政治面貌</td>
                 <td><form:input path="poliStatus" id="poliStatus" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="poliStatus"></form:errors></span></td>
                   <td>毕业学校</td>
                 <td><form:input path="school" id="school" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="school"></form:errors></span></td>
              </tr>
              <tr>
                 <td>毕业时间</td>
                 <td>
                   <fmt:formatDate value="${user.graduDate}" var="graduDate" pattern="yyyy-MM-dd" />
                   <form:input path="graduDate" id="graduDate" cssClass="form-control datepicker" value="${graduDate}"/>
                 </td>
                 <td><span class="error"><form:errors path="graduDate"></form:errors></span></td>
                 <td>员工学历</td>
                 <td><form:input path="diploma" id="diploma" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="diploma"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>员工专业</td>
                 <td><form:input path="major" id="major" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="major"></form:errors></span></td>
                 <td>员工职称</td>
                 <td><form:input path="professor" id="professor" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="professor"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>入职时间</td>
                 <td>
                   <fmt:formatDate value="${user.joinDate}" var="joinDate" pattern="yyyy-MM-dd" />
                   <form:input path="joinDate" id="joinDate" cssClass="form-control datepicker" value="${joinDate }"/>
                 </td>
                 <td><span class="error"><form:errors path="joinDate"></form:errors></span></td>
                 <td>离职时间</td>
                 <td>
                   <fmt:formatDate value="${user.leaveDate}" var="leaveDate" pattern="yyyy-MM-dd" />
                   <form:input path="leaveDate" id="leaveDate" cssClass="form-control datepicker" value="${leaveDate }"/>
                 </td>
                 <td><span class="error"><form:errors path="leaveDate"></form:errors></span></td>
              </tr>
              <tr>
                 <td>参加工作时间</td>
                 <td>
                  <fmt:formatDate value="${user.jobDate}" var="jobDate" pattern="yyyy-MM-dd" />
                  <form:input path="jobDate" id="jobDate" cssClass="form-control datepicker" value="${jobDate }"/>
                 </td>
                 <td><span class="error"><form:errors path="jobDate"></form:errors></span></td>
                 <td>合同起始日期</td>
                 <td>
                   <fmt:formatDate value="${user.ctStartDate}" var="ctStartDate" pattern="yyyy-MM-dd" />
                   <form:input path="ctStartDate" id="ctStartDate" cssClass="form-control datepicker" value="${ctStartDate }"/>
                 </td>
                 <td><span class="error"><form:errors path="ctStartDate"></form:errors></span></td>
              </tr>
              <tr>
                 <td>合同终止日期</td>
                 <td>
                   <fmt:formatDate value="${user.ctEndDate}" var="ctEndDate" pattern="yyyy-MM-dd" />
                   <form:input path="ctEndDate" id="ctEndDate" cssClass="form-control datepicker" value="${ctEndDate }"/>
                 </td>
                 <td><span class="error"><form:errors path="ctEndDate"></form:errors></span></td>
                 <td>备注</td>
                 <td><form:textarea path="remark" id="remark" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="remark"></form:errors></span></td>
              </tr>
             <tr>
               <td colspan="6" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
            </tr>
            </table>
         </form:form>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { $('#collapseThree').collapse('show');
	$( "input.datepicker" ).datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        showButtonPanel: true,
        showOn: "both",
        buttonImageOnly: true,
        buttonImage: "calendar.gif",
        buttonText: "",
        changeMonth: true,
        changeYear: true
    });
	});
</script> 
<style type="text/css">
  table.addTable{
    width: 70%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    font-size: 18px;
  }
  
  
  
  table.addTable td{
    padding-top: 10px;
    padding-bottom: 10px;
    padding-right: 20px;
  }
  
  button.submit{
    width: 100px;
  }
  
   div.title{
   
     width: 50%;
   }
  
</style>
  