 <%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <div class="addDiv panel panel-info">
              <div class="panel-heading">修改日程</div>
                 <div class="panel-body">
                   <form:form commandName="schedule" action="/OfficeAutomation/home/calendar/updateSchedule" method="post">
                      <table class="addTable">
                       <tr>
                         <td>日程标题</td>
                         <td colspan="3">
                         <form:textarea path="title" id="title" cssClass="form-control"/>
                         <form:input path="id" id="id" type="hidden" cssClass="form-control"/>
                         </td>
                      </tr>
                      <tr>
                       <td>开始时间</td>
                        <td>
                        <fmt:formatDate value="${schedule.start}" var="startDate" pattern="yyyy-MM-dd HH:mm" />
                        <form:input path="start" id="start" cssClass="form-control start" value="${startDate }"/>
                        </td>
                       
                        <td>结束时间</td>
                        <fmt:formatDate value="${schedule.end}" var="endDate" pattern="yyyy-MM-dd HH:mm" />
                        <td><form:input path="end" id="end" cssClass="form-control end" value="${endDate }"/></td>
                      </tr>
                       <tr>
                         <td class="length" colspan="2"><span class="a">全天</span><span><form:checkbox  id="allDay"  path="allDay" cssClass="form-control"/></span></td>
                         <td><button type="submit" class="btn btn-success submit">修改日程</button></td>
                         <td><button class="btn btn-danger delete submit" id="delete">删除日程</button></td>
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
    width: 100px;
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
		$("button.delete").click(function(){
			var id=$("#id").val();
			var page="/OfficeAutomation/home/calendar/deleteSchedule/"+id;
			$.ajax({
				type: "GET",
				contentType: "application/x-www-form-urlencoded",
			    url: page,
				success: function(result) {
					 return false;
			    }
			})
			
		});
		});
</script> 