<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="panel-group" id="accordion">
    
    <c:forEach items="${roleAts }" var="roleAt">
       <c:if test="${roleAt.isHave }">
           <div class="panel panel-success">
		   <div class="panel-heading">
			 <h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#${roleAt.functionId }">
					${roleAt.functionName }
				</a>
			 </h4>
		   </div>
		   <div id="${roleAt.functionId }" class="panel-collapse collapse in">
			 <div class="panel-body">
				 <ul class="nav nav-pills nav-stacked">
				    <c:forEach items="${roleAt.childRoleAts }" var="childRoleAt">
				       <c:if test="${childRoleAt.isHave }">
				         <li><a href="${childRoleAt.url }">${childRoleAt.functionName }</a></li>
				       </c:if>
				    </c:forEach>
				    
				</ul>
			</div>
		  </div>
	      </div>
       </c:if>
    </c:forEach>
	
</div>

<script type="text/javascript">
   $(function () { 
	   $('#a').collapse('show');
	   $('#b').collapse('show');
	   $('#c').collapse('show');
	   $('#d').collapse('show');
	   });
</script>  
<style type="text/css">
  div.panel-group a{
    text-decoration: none;
    text-align: center
  }
  
  div.panel-group h4 a{
    display: block;
    margin-left: auto;
    margin-right: auto;
  }
</style>