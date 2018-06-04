<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
<form action="/OfficeAutomation/home/overtimeForm/finishOvertimeTask/${id }" method="post">
       <table class="table table-striped table-bordered table-hover  table-condensed">
                <fmt:formatDate value="${message.createDate }" var="createDate" pattern="yyyy-MM-dd" />
                <fmt:formatDate value="${message.leaderCreateDate }" var="leaderCreateDate" pattern="yyyy-MM-dd" />
                <fmt:formatDate value="${message.managerCreateDate }" var="managerCreateDate" pattern="yyyy-MM-dd" />
                <fmt:formatDate value="${message.createDate }" var="createDate" pattern="yyyy-MM-dd" />
                <fmt:formatDate value="${message.startDate }" var="startDate" pattern="yyyy-MM-dd HH:mm" />
                <fmt:formatDate value="${message.endDate }" var="endDate" pattern="yyyy-MM-dd HH:mm" />
               <tbody>
                    <tr>
                      <td>${message.processName }人:</td>
                      <td>${message.userName }</td>
                      <td>发起日期:</td>
                      <td>${createDate}</td>
                    </tr>
                    <tr>
                      <td>请假起始日期：</td>
                      <td>${startDate }</td>
                      <td>请假截止日期:</td>
                      <td>${endDate}</td>
                    </tr>
                    <tr>
                      <td>部门:</td>
                      <td>${message.dept}</td>
                      <td>加班类型:</td>
                      <td>${message.type }</td>
                    </tr>
                     <tr>
                      <td>理由说明：</td>
                      <td colspan="3" align="center">
                      <div>
                         <div class="reason"> ${message.reason}</div>
                      </div>
                      <div>
                          <div class="name">${message.leaderName}</div>
                          <div class="date">${createDate}</div>
                      </div>
                      </td>
                    </tr>
                    <c:if test="${!empty message.leaderName }">
                        <tr>
                         <td>部门经理审批：</td>
                         <td colspan="3" align="center">
                           <c:if test="${empty message.leaderMessage }">
                             <div>
                               <select name="message" class="form-control">
                                 <option value="yes">同意</option>
                                 <option value="no">不同意</option>
                               </select>
                               <textarea class="form-control" placeholder="审批理由...." name="reason"></textarea>
                               <input type="hidden" name="user" value="leader"></input>
                             </div>
                           </c:if>
                           <c:if test="${!empty message.leaderMessage }">
                             <div>
                               <div>
                                 <div class="message">${message.leaderMessage }</div>
                                 <div class="reason">${message.leaderReason }</div>
                               </div>
                               <div>
                                 <div class="name">${message.leaderName }</div>
                                 <div class="date">${leaderCreateDate }</div>
                               </div>
                             </div>
                           </c:if>
                        </td>
                    </tr>
                    </c:if>
                    
                    <c:if test="${!empty message.managerName }">
                        <tr>
                         <td>总经理审批：</td>
                         <td colspan="3" align="center">
                           <c:if test="${empty message.managerMessage }">
                             <div>
                               <select name="message" class="form-control">
                                 <option value="yes">同意</option>
                                 <option value="no">不同意</option>
                               </select>
                               <textarea class="form-control" placeholder="审批理由...." name="reason"></textarea>
                               <input type="hidden" name="user" value="manager"></input>
                             </div>
                           </c:if>
                           <c:if test="${!empty message.managerMessage }">
                             <div>
                               <div>
                                 <div class="message">${message.managerMessage }</div>
                                 <div class="reason">${message.managerReason }</div>
                               </div>
                               <div>
                                 <div class="name">${message.managerName }</div>
                                 <div class="date">${managerCreateDate }</div>
                               </div>
                             </div>
                           </c:if>
                        </td>
                    </tr>
                    </c:if>
                    
              </tbody>
             
          </table>
          <div class="ti">
				<button type="submit" class="btn btn-primary">
					提交
				</button>
		 </div>
		 <c:if test="${empty message.leaderName }">
               <div>
                    <input type="hidden" name="message" class="form-controller" value="none"></input>
                    <input type="hidden" class="form-controller" placeholder="审批理由...." name="reason" value="none"></input>
                    <input type="hidden" name="user" value="user"></input>
                </div>
          </c:if>
   </form>     
</div>
<style type="text/css">
  div.ti{
    width: 200px;
    margin-left: auto;
    margin-right: auto;
  }
  
  table.table td{
   text-align: center;
   vertical-align: center;
  }
  
  table.table td input,table.table td textarea{
   display: block;
   margin-top: 5px;
   margin-buttom: 5px;
  }
  
  div.ti button{
    width: 100%;
  }
  
  div.message{
     float: left;
  }
  
  div.respon,div.name,div.date{
     float: right;
     margin-right: 10px;
  }
</style>