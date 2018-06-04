<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@include file="../included/header.jsp" %>
    
    <div class="content">
      <div class="left-nav">
        <%@include file="../included/leftnav.jsp" %>
      </div>
      <div class="right-main">
         <div class="title">
           <ol class="breadcrumb">
             <li><a href="">工作流管理</a></li>
             <li><a href="">借款申请</a></li>
           </ol>
         </div>
         
         
              
              <div class="addDiv panel panel-info">
              <div class="panel-heading">借款申请</div>
                 <div class="panel-body">
                   <form:form commandName="messageProcess" action="/OfficeAutomation/home/loanForm/startLoanProcess" method="post">
                      <table class="addTable">
                      <tr>
                         <td>标题</td>
                         <td><form:input path="title" id="title" cssClass="form-control"/></td>
                         <td><span class="error"><form:errors path="title"></form:errors></span></td>
                      </tr>
                      <tr>
                         <td>借款金额</td>
                         <td><form:input path="money" id="money" cssClass="form-control"/></td>
                         <td><span class="error"><form:errors path="money"></form:errors></span></td>
                      </tr>
                       <tr>
                         <td>借款理由</td>
                         <td><form:textarea path="reason" id="reason" cssClass="form-control"/></td>
                         <td><span class="error"><form:errors path="reason"></form:errors></span></td>
                      </tr>
              
              
             <tr>
               <td colspan="3" align="center"><button type="submit" class="btn btn-success submit">提 交</button></td>
            </tr>
            </table>
         </form:form>
                 </div>
              </div>
         
      </div>
    </div>
    
<%@include file="../included/footer.jsp" %>
<script type="text/javascript">
	$(function () { 
		$('#collapseTwo').collapse('show');
		
		});
</script> 
<style type="text/css">
  table.addTable{
    width: 80%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    font-size: 18px;
  }
  
  div.addDiv{
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
    
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
  