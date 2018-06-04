<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../included/header.jsp" %>
    <div class="content">
      <div class="left-nav">
        <%@include file="../included/leftnav.jsp" %>
      </div>
      <div class="right-main">
         <div class="title">
           <ol class="breadcrumb">
             <li><a href="">工作流管理</a></li>
             <li><a href="">个人已完成业务</a></li>
           </ol>
         </div>
         <div class="listUser">
              <h1 class="label label-info">个人已完成业务列表</h1>
              <div class="addDiv panel panel-info">
              <div class="panel-heading"></div>
                 <div class="panel-body">
                   <table class="table table-striped table-bordered table-hover  table-condensed">
                     <thead>
                       <tr class="success">
                         <th>流水号</th>
                         <th>流程名称</th>
                         <th>处理人</th>
                         <th>任务名称</th>
                         <th>开始时间</th>
                         <th>结束时间</th>
                         <th>流程状态</th>
                         <th>操作</th>
                       </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${beans }" var="bean">
                        <fmt:formatDate value="${bean.endDate }" var="endDate" pattern="yyyy-MM-dd" />
                        <fmt:formatDate value="${bean.startDate }" var="startDate" pattern="yyyy-MM-dd" />
                        <tr>
                         <td>${bean.processInstanceId }</td>
                         <td>${bean.processName }</td>
                         <td>${bean.userName }</td>
                         <td>${bean.taskName }</td>
                         <td>${startDate }</td>
                         <td>${endDate }</td>
                         <td>${bean.type }</td>
                         <td>
                           <button class="btn btn-primary messageLook" data-toggle="modal" data-target="#myModal"
                           data-id="${bean.processInstanceId }" data-path="historyShow" data-name="${bean.processName}">查看/操作</button>
                          </td>
                        </tr>
                     </c:forEach>
                    </tbody>
                  </table>
                   
                 </div>
              </div>
             
          
        </div>
      </div>
    </div>
    
<%@include file="../included/footer.jsp" %>
<%@include file="../included/model.jsp" %>
<script type="text/javascript">
	$(function () { $('#collapseThree').collapse('show')});
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