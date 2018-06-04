<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@include file="included/header.jsp" %>
    <div class="content">
      
      <div class="right-main">
          <div class="listUser">
              <h1 class="label label-info">错误信息</h1>
              
              <div class="addDiv panel panel-info">
              <div class="panel-heading">错误信息</div>
                 <div class="panel-body">
                                                       无权限访问！
                 </div>
              </div>
         </div>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<style type="text/css">
   div.listUser{
     width: 50%;
     margin-left: auto;
     margin-right: auto;
   }
</style>
  