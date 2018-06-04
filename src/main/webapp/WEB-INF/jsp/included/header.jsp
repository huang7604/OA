<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <link type="text/css" rel="stylesheet" href="/OfficeAutomation/css/bootstrap/3.3.7/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="/OfficeAutomation/css/jqueryUI/1.9.2/jquery-ui-1.9.2.custom.css">
    <link type="text/css" rel="stylesheet" href="/OfficeAutomation/css/fullcalendar.css">
    <link type="text/css" rel="stylesheet" href="/OfficeAutomation/css/index.css">
    <link type="text/css" rel="stylesheet" href="/OfficeAutomation/css/jquery.treeview.css">
    <script type="text/javascript" src="/OfficeAutomation/js/jquery/2.1.1/jquery.js"></script>
    <script type="text/javascript" src="/OfficeAutomation/js/bootstrap/3.3.7/bootstrap.min.js"></script>
    <script type="text/javascript" src="/OfficeAutomation/js/jqueryUI/1.9.2/jquery-ui-1.9.2.custom.js"></script>
    <script type="text/javascript" src="/OfficeAutomation/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="/OfficeAutomation/js/fullcalendar.min.js"></script>
    <script type="text/javascript" src="/OfficeAutomation/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/OfficeAutomation/js/jquery.treeview.js"></script>
  </head>
  
  <script type="text/javascript">
  
  jQuery(function($){ 
      $.datepicker.regional['zh-CN'] = {
          clearText: '清除', 
          clearStatus: '清除已选日期', 
          closeText: '关闭', 
          closeStatus: '不改变当前选择', 
          prevText: '< 上月', 
          prevStatus: '显示上月', 
          prevBigText: '<<', 
          prevBigStatus: '显示上一年', 
          nextText: '下月>', 
          nextStatus: '显示下月', 
          nextBigText: '>>', 
          nextBigStatus: '显示下一年', 
          currentText: '今天', 
          currentStatus: '显示本月', 
          monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
          monthNamesShort: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
          monthStatus: '选择月份', 
          yearStatus: '选择年份', 
          weekHeader: '周', 
          weekStatus: '年内周次', 
          dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'], 
          dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'], 
          dayNamesMin: ['日','一','二','三','四','五','六'], 
          dayStatus: '设置 DD 为一周起始', 
          dateStatus: '选择 m月 d日, DD', 
          dateFormat: 'yy-mm-dd', 
          firstDay: 1, 
          initStatus: '请选择日期', 
          isRTL: false}; 
      $.datepicker.setDefaults($.datepicker.regional['zh-CN']); 
  });
  </script>
<style type="text/css">
  
nav a{
	text-decoration: none;
	color: #999;
}

nav a:hover{
	text-decoration: none;
	color: #C40000;
}

nav span a{
	text-decoration: none;
	color: #999;
}

nav span a:hover{
	text-decoration: none;
	color: #C40000;
}

nav.top{
	padding-top: 5px;
	padding-bottom: 5px;
	width: 100%;
	background-color: #f2f2f2;
}

.redColor{
	color: #C40000;
}
nav.top span.a{
	margin-left: 20px;
}

nav span.right{
    margin-right: 20px;
    float: right;
    color: #999;
}

nav span.b{
    margin-right: 150px;
}

nav.top a{
	margin-left: 20px;
}
  </style>
  <body>
    <div class="header">
      <nav class="top">
       <a href="/OfficeAutomation/home/index"><span class="glyphicon glyphicon-home redColor"></span>
                         首页
       </a>
       <span class="a">欢迎来到办公自动化系统</span>
       <c:if test="${!empty sessionScope.user }">
          <a href="/OfficeAutomation/home/login">${user.name }</a>
          <a href="/OfficeAutomation/home/logout">退出</a>
       </c:if>
       <c:if test="${empty sessionScope.user }">
         <c:if test="${empty loginForm }">
           <c:redirect url="/home/login"></c:redirect>
         </c:if>
       </c:if>
      
  
       <span class="right b"><a href="/OfficeAutomation/home/listRunTask">个人待办业务</a></span>
       <span class="right"><a href="/OfficeAutomation/home/listHistoryTask">个人已办业务</a></span>
     </nav>
    </div>
    
    