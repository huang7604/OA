<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<div class="annoInfo">
   <div class="addDiv panel panel-info">
    <div class="panel-heading">公告信息</div>
    <div class="panel-body">
       <ul>
        <c:forEach items="${annos}" var="anno">
          <li><a href="annoShow/${anno.id }">${anno.topic }</a></li>
        </c:forEach>
       </ul>
    </div>
   </div>
   
</div>

<style type="text/css">
  div.annoInfo{
    width: 35%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
  }
  
</style>