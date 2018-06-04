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
             <li><a href="/OfficeAutomation/home/listRole?start=0">角色管理</a></li>
             <li><a href="">角色信息添加</a></li>
           </ol>
         </div>
         <form:form commandName="role" action="/OfficeAutomation/home/listRole/addRole" method="post">
            <table class="addTable">
               <tr>
                 <td>角色编号</td>
                 <td><form:input path="id" id="id" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="id"></form:errors></span></td>
              </tr>
              <tr>
                 <td>角色名称</td>
                 <td><form:input path="name" id="name" cssClass="form-control"/></td>
                 <td><span class="error"><form:errors path="name"></form:errors></span></td>
              </tr>
              
              
             <tr>
               <td colspan="3" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
            </tr>
            </table>
         </form:form>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { $('#collapseThree').collapse('show')});
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
  
</style>
  