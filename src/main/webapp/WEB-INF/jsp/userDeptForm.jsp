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
             <li><a href="/OfficeAutomation/home/listUser?start=0">用户管理</a></li>
             <li><a href="">用户部门信息管理</a></li>
           </ol>
         </div>
         <div class="addDiv panel panel-info">
             <div class="panel-heading">用户部门修改</div>
                 <div class="panel-body">
                    <form  action="/OfficeAutomation/home/listUser/userDept/${uid }" method="post">
                     <table class="addTable">
                       <tr>
                         <td>部门</td>
                         <td>
                          <select name="did" class="form-control">
                           <c:forEach items="${depts}" var="dept">
                            <option value="${dept.id }">${dept.name }</option>
                           </c:forEach>
                          </select>
                        </td>
                      </tr>
                      <tr>
                         <td colspan="2" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
                      </tr>
                  </table>
                 </form>
                 </div>
            </div>
            
             <div class="addDiv panel panel-info">
              <div class="panel-heading">用户部门修改</div>
                 <div class="panel-body">
                    <p><span>部门：${dept.name }</span></p>
                    <p><span><a href="/OfficeAutomation/home/listUser/deleteUserDept/${uid}" class="">删除</a></span></p>
                 </div>
              </div>
         
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
  