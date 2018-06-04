<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@include file="../included/header.jsp" %>
    
    <div class="content">
      <div class="left-nav">
        <%@include file="../included/leftnav.jsp" %>
      </div>
      <div class="right-main">
         <div class="title">
           <ol class="breadcrumb">
             <li><a href="">工作流管理</a></li>
             <li><a href="">请假申请</a></li>
           </ol>
         </div>
         
         
              
              <div class="addDiv panel panel-info">
              <div class="panel-heading">请假申请</div>
                 <div class="panel-body">
                   <form:form commandName="messageProcess" action="/OfficeAutomation/home/overtimeForm/startOvertimeProcess" method="post">
                      <table class="addTable">
                       <tr>
                         <td>请假类型</td>
                         <td>
                         <form:select path="type" id="type" cssClass="form-control">
                           <form:option value="假日加班">假日加班</form:option>
                           <form:option value="下班后加班">下班后加班</form:option>
                         </form:select>
                         </td>
                         <td><span class="error"><form:errors path="type"></form:errors></span></td>
                      </tr>
                      <tr>
                         <td>标题</td>
                         <td><form:input path="title" id="title" cssClass="form-control"/></td>
                         <td><span class="error"><form:errors path="title"></form:errors></span></td>
                      </tr>
                      <tr>
                        <td>开始时间</td>
                        <td><form:input path="startDate" id="startDate" cssClass="form-control datepicker"/></td>
                        <td><span class="error"><form:errors path="startDate"></form:errors></span></td>
                      </tr>
              
                       <tr>
                         <td>结束时间</td>
                         <td><form:input path="endDate" id="endDate" cssClass="form-control datepicker"/></td>
                         <td><span class="error"><form:errors path="endDate"></form:errors></span></td>
                       </tr>
              
                       <tr>
                         <td>请假理由</td>
                         <td><form:textarea path="reason" id="reason" cssClass="form-control"/></td>
                         <td><span class="error"><form:errors path="reason"></form:errors></span></td>
                      </tr>
              
              
             <tr>
               <td colspan="3" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
            </tr>
            </table>
         </form:form>
                 </div>
              </div>
         
      </div>
    </div>
    
<%@include file="../included/footer.jsp" %>
<script type="text/javascript">
	$(function () { 
		$('#collapseTwo').collapse('show');
		$( "input.datepicker" ).datetimepicker();
		});
</script> 
<style type="text/css">
  table.addTable{
    width: 80%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    font-size: 18px;
  }
  
  div.addDiv{
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    
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
  