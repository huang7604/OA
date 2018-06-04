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
             <li><a href="">综合信息管理</a></li>
             <li><a href="">员工管理</a></li>
             <li><a href="">员工信息</a></li>
           </ol>
         </div>
         <div class="listUser">
              <h1 class="label label-info">员工信息列表</h1>
              <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                   <tr class="success">
                     <th>用户编号</th>
                     <th>用户名称</th>
                     <th>所属角色</th>
                     <th>所属部门</th>
                     <th>所属角色管理</th>
                     <th>所属部门管理</th>
                     <th>编辑</th>
                     <th>删除</th>
                   </tr>
               </thead>
               <tbody>
                  <c:forEach items="${users }" var="user">
                    <tr>
                      <td>${user.id }</td>
                      <td>${user.name }</td>
                      <td>${user.role.name }</td>
                      <td>${user.dept.name }</td>
                      <td><a href="listUser/userRoleForm/${user.id }"><span class="glyphicon glyphicon-th-list"></span></a></td>
                      <td><a href="listUser/userDeptForm/${user.id }"><span class="glyphicon glyphicon-th-list"></span></a></td>
                      <td><a href="listUser/editUserForm/${user.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                      <td><a href="listUser/deleteUser/${user.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                 </c:forEach>
              </tbody>
          </table>
          <%@include file="included/pager.jsp" %>
          <div class="addDiv">
             <a href="listUser/userForm">添加用户</a>
          </div>
        </div>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { $('#collapseThree').collapse('show')});
</script> 
<style type="text/css">
   div.listUser{
     width: 70%;
     margin-left: auto;
     margin-right: auto;
   }
   
   div.title{
   
     width: 70%;
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