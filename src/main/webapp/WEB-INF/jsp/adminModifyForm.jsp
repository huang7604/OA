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
             <li><a href="">个人信息管理</a></li>
             <li><a href="">密码修改</a></li>
           </ol>
         </div>
         <form  action="/OfficeAutomation/home/adminModifyForm/modifyAdmin" method="post">
            <table class="addTable">
               <tr>
                 <td colspan="2" align="center"><span class="error">${error }</span></td>
               </tr>
               <tr>
                 <td>原密码</td>
                 <td><input type="password" id="password" name="password" class="form-control"/></td>
              </tr>
                <tr>
                 <td>新密码</td>
                 <td><input type="password" id="newPassword" name="newPassword" class="form-control"/></td>
              </tr>
              
               <tr>
                 <td>重输新密码</td>
                 <td><input type="password" id="rePassword" name="rePassword" class="form-control"/></td>
              </tr>
              
             
              
             <tr>
               <td colspan="2" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
            </tr>
            </table>
         </form>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { 
		
	});
</script> 
<style type="text/css">
  table.addTable{
    width: 35%;
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
   
   span.error{
     color: red;
   }
  
</style>
  