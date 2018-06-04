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
             <li><a href="">角色信息修改</a></li>
           </ol>
         </div>
       
            <table class="addTable">
               <form:form commandName="role" action="/OfficeAutomation/home/listRole/editRole" method="post">
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
             </form:form>
            </table>
         <div class="addDiv panel panel-info">
              <div class="panel-heading">分配角色权限</div>
                 <div class="panel-body">
                    <form>
                      <ul id="browser" class="filetree treeview-famfamfam">
                      
                      <c:forEach items="${ras }" var="roleAt">
                         <li>
                         <c:if test="${roleAt.isHave}">
                             <span class="checkbox"><input type="checkbox" checked="${roleAt.isHave}"  name="${roleAt.functionId}"/>${roleAt.functionName}</span>
                         </c:if>
                         <c:if test="${!roleAt.isHave}">
                            <span class="checkbox"><input type="checkbox"  name="${roleAt.functionId}"/>${roleAt.functionName}</span>
                         </c:if>
                           <ul>
                            <c:forEach items="${roleAt.childRoleAts }" var="childRoleAt">
                              <li>
                              <c:if test="${childRoleAt.isHave}">
                                <span class="checkbox"><input type="checkbox" checked="${childRoleAt.isHave}" name="${childRoleAt.functionId}"/>${childRoleAt.functionName}</span>
                              </c:if>
                              <c:if test="${!childRoleAt.isHave}">
                                <span class="checkbox"><input type="checkbox"  name="${childRoleAt.functionId}"/>${childRoleAt.functionName}</span>
                              </c:if>
                              </li>
                            </c:forEach>
                          </ul>
                         </li>
                      </c:forEach>
			        	
	               </ul>
	               </form>
                 </div>
              </div>
         <div>
          
         </div>
      </div>
    </div>
    
<%@include file="included/footer.jsp" %>
<script type="text/javascript">
	$(function () { 
		
		$("#browser").treeview({
			toggle: function() {
				
			}
		});
		 var id=$("#id").val();
		 $("input[type=checkbox]").click(function(){
			  var name=$(this).attr('name');
			  var checked=$(this).get(0).checked;
			  var page="/OfficeAutomation/home/listRole/updateRoleAt/"+id;
				$.ajax({
					type: "POST",
					contentType: "application/x-www-form-urlencoded",
				    url: page,
				    data:{"name":name,"isHave":checked},
					success: function(result) {
						 
				    }
				});
		  });
	});
</script> 
<style type="text/css">
  table.addTable{
    width: 35%;
    margin-left: 50px;
    margin-top: 30px;
    font-size: 18px;
    float: left;
  }
  
  div.addDiv{
    width: 40%;
    margin-top: 30px;
    margin-right: 50px;
    font-size: 13px;
    float: right;
  }
  
  div.addDiv span.checkbox {
    
    margin-left: 30px;
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
  