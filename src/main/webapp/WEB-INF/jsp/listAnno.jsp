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
             <li><a href="">公告管理</a></li>
           </ol>
         </div>
         <div class="listUser">
              <h1 class="label label-info">公告信息列表</h1>
              <table class="table table-striped table-bordered table-hover  table-condensed">
                <thead>
                   <tr class="success">
                     <th>公共编号</th>
                     <th>公告主题</th>
                     <th>公告内容</th>
                     <th>公告备注</th>
                     <th>发布人</th>
                     <th>发布部门</th>
                     <th>编辑</th>
                     <th>删除</th>
                   </tr>
               </thead>
               <tbody>
                  <c:forEach items="${annos }" var="anno">
                    <tr>
                      <td>${anno.id }</td>
                      <td>${anno.topic }</td>
                      <td>${anno.content }</td>
                      <td>${anno.remark }</td>
                      <td>${anno.publisher.name }</td>
                      <td>${anno.publishDept.name }</td>
                      <td><a href="listAnno/editAnnoForm/${anno.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                      <td><a href="listAnno/deleteAnno/${anno.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
                 </c:forEach>
              </tbody>
          </table>
          <%@include file="included/pager.jsp" %>
        </div>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { $('#collapseTwo').collapse('show')});
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