<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
             <li><a href="">员工信息添加</a></li>
           </ol>
         </div>
         <form:form commandName="user" action="/OfficeAutomation/home/listUser/addUser" method="post">
            <table class="addTable">
               <tr>
                 <td>员工编号</td>
                 <td><form:input path="id" id="id" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>员工姓名</td>
                 <td><form:input path="name" id="name" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>员工性别</td>
                 <td><form:input path="sex" id="sex" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>省份证号码</td>
                 <td><form:input path="idCard" id="idCard" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>员工民族</td>
                 <td><form:input path="nation" id="nation" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>员工国籍</td>
                 <td><form:input path="nationality" id="nationality" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>员工生日</td>
                 <td><form:input path="birthtime" id="birthtime" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                  <td>员工地址</td>
                 <td><form:input path="address" id="address" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>员工邮箱</td>
                 <td><form:input path="email" id="email" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                  <td>手机号码</td>
                 <td><form:input path="tel" id="tel" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>政治面貌</td>
                 <td><form:input path="poliStatus" id="poliStatus" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                   <td>毕业学校</td>
                 <td><form:input path="school" id="school" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>毕业时间</td>
                 <td><form:input path="graduDate" id="graduDate" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>员工学历</td>
                 <td><form:input path="diploma" id="diploma" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>员工专业</td>
                 <td><form:input path="major" id="major" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>员工职称</td>
                 <td><form:input path="professor" id="professor" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              
              <tr>
                 <td>入职时间</td>
                 <td><form:input path="joinDate" id="joinDate" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                   <td>离职时间</td>
                 <td><form:input path="leaveDate" id="leaveDate" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>参加工作时间</td>
                 <td><form:input path="jobDate" id="jobDate" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>合同起始日期</td>
                 <td><form:input path="ctStartDate" id="ctStartDate" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>合同终止日期</td>
                 <td><form:input path="ctEndDate" id="ctEndDate" cssClass="form-control datepicker"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
                 <td>备注</td>
                 <td><form:textarea path="remark" id="remark" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
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
	$(function () { 
		$('#collapseThree').collapse('show');
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
  