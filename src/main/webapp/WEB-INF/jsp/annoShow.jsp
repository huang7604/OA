<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@include file="included/header.jsp" %>
    <div class="content">
      <div class="left-nav">
        <%@include file="included/leftnav.jsp" %>
      </div>
      <div class="right-main">
         <div class="title">
           <ol class="breadcrumb">
             <li><a href="">公共信息管理</a></li>
             <li><a href="">公告详情</a></li>
           </ol>
         </div>
         <div class="listUser">
              <h1 class="label label-info">公告信息详情</h1>
              
              <div class="addDiv panel panel-info">
              <div class="panel-heading">${anno.topic }</div>
                 <div class="panel-body">
                    <p>${anno.content }</p>
                    <p><span>发布人：${anno.publisher.name }</span></p>
                    <p><span>发布部门：${anno.publishDept.name }</span></p>
                 </div>
              </div>
         </div>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { 
		
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