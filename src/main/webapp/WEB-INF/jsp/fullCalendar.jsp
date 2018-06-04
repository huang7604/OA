<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="included/header.jsp" %>
    <div class="content">
      <div class="left-nav">
        <%@include file="included/leftnav.jsp" %>
      </div>
      <div class="right-main">
         <div class="title">
           <ol class="breadcrumb">
             <li><a href="">个人信息管理</a></li>
             <li><a href="">日程安排</a></li>
           </ol>
         </div>
         <div class="listUser">
              <h1 class="label label-info">个人日程安排</h1>
              <div class="addDiv panel panel-info">
              <div class="panel-heading"></div>
                 <div class="panel-body">
                    <div id='calendar'></div>
                 </div>
              </div>
             
          
        </div>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<%@include file="included/model.jsp" %>
<script type="text/javascript">

function myformatter(date){
	var y = date.getFullYear();
	var m = date.getMonth()+1;
	var d = date.getDate();
	return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}
	$(function () { 
		$('#collapseOne').collapse('show');
		
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
		    dayClick: function(date, allDay, jsEvent, view) {
			    var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');
			    $("#calendarModal").modal('show'); 
			    $('#calendarModal').on('shown.bs.modal', function (e) {  
	                // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零  
	                 $(this).css('display', 'block');  
                     $(this).find('.modal-dialog').css({  
		                   'margin-top': '30px'  
		             });
			          
			          var page="/OfficeAutomation/home/calendar/scheduleForm";
			          
				      $.ajax({
					     type: "GET",
					     contentType: "application/x-www-form-urlencoded",
					     url: page,
					     data: {"date":myformatter(date)},
					     success: function(result) {
			   		        $("div.modal-body").html(result)
					     }
				      });
			      }); 
	         },
	       //单击事件项时触发
	 		eventClick: function(calEvent, jsEvent, view) {
	 			$("#calendarModal").modal('show'); 
			    $('#calendarModal').on('shown.bs.modal', function (e) {  
	                // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零  
	                 $(this).css('display', 'block');  
                     $(this).find('.modal-dialog').css({  
		                   'margin-top': '30px'  
		             });
			          
			          var page="/OfficeAutomation/home/calendar/scheduleUpdateForm";
			          
				      $.ajax({
					     type: "GET",
					     contentType: "application/x-www-form-urlencoded",
					     url: page,
					     data: {"id":calEvent.id},
					     success: function(result) {
			   		        $("div.modal-body").html(result)
					     }
				      });
			      }); 
	 		},
	        editable: true,
		    events: '/OfficeAutomation/home/calendar/json'
			
		});
		
		
	
		
		
			
	
     });
</script> 
<style type="text/css">
   div.listUser{
     width: 80%;
     margin-left: auto;
     margin-right: auto;
   }
   
   div.title{
   
     width: 50%;
   }
   div.addDiv a{
     display: block;
     text-decoration: none;
     text-align: center;
     width: 200px;
     font-size: 20px;
     padding: 5px;
     margin-left: auto;
     margin-right: auto;
     margin-top: 20px;
     color: #31708f;
     background-color: #bce8f1;
   }
   
   div.page{
     text-align: center;
   }
   
   div.page ul{
    
   }
</style>