 <%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <div class="addDiv panel panel-info">
              <div class="panel-heading">添加日程</div>
                 <div class="panel-body">
                   <form:form commandName="schedule" action="/OfficeAutomation/home/calendar/addSchedule" method="post">
                      <table class="addTable">
                       <tr>
                         <td>日程标题</td>
                         <td colspan="3"><form:textarea path="title" id="title" cssClass="form-control"/></td>
                      </tr>
                      <tr>
                        <td>开始时间</td>
                        <td>
                        <fmt:formatDate value="${schedule.start}" var="startDate" pattern="yyyy-MM-dd HH:mm" />
                        <form:input path="start" id="start" cssClass="form-control start" value="${startDate}" lay-key="1"/>
                        </td>
                       
                        <td>结束时间</td>
                        <fmt:formatDate value="${schedule.end}" var="endDate" pattern="yyyy-MM-dd HH:mm" />
                        <td><form:input path="end" id="end" cssClass="form-control end" value="${endDate }" lay-key="2"/></td>
                      </tr>
              
                       
                       
                       <tr>
                         <td class="length" colspan="2"><span class="a">全天</span><span><form:checkbox value="1" id="allDay"  path="allDay"/></span></td>
                         <td colspan="2" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
                       </tr>
                 </table>
             </form:form>
           </div>
</div>
<style type="text/css">
table.addTable{
    width: 99%;
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
    width: 300px;
  }
  
  td.length span{
    display: block;
    float: left;
    margin-right: 10px;
  }
  
  td.length span.a{
     margin-top: 5px;
  }
  
  
</style>
<script type="text/javascript">
	$(function () { 
		
		$("input.start").datetimepicker();
		$("input.end").datetimepicker();
		
		
		});
	
	
	
</script> 