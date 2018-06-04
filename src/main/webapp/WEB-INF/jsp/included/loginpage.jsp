<%@page contentType="text/html;charset=utf8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="loginDiv" >
	<form class="loginForm" action="check" method="post">
		<div id="loginSmallDiv" class="loginSmallDiv">
			<div class="loginErrorMessageDiv">
				<div>
				  	<span class="errorMessage">${error}</span>
				</div>
			</div>
			<div class="login_acount_text">账户登录</div>
			<div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-user"></span>
				</span>
				<input id="account" name="account" placeholder="账户" type="text">			
			</div>
			
			<div class="loginInput " >
				<span class="loginInputIcon ">
					<span class=" glyphicon glyphicon-lock"></span>
				</span>
				<input id="password" name="password" type="password" placeholder="密码" type="text">
			</div>
			
			
			
			<div style="margin-top:20px">
				<button class="btn btn-block redButton" type="submit">登录</button>
			</div>
		</div>	
	</form>
</div>
<style type="text/css">

div.loginSmallDiv {
	background-color: white;
	margin-left: auto;
	margin-right: auto;
	width: 350px;
	height: 400px;
	padding: 60px 25px 80px 25px;
}


div.login_acount_text {
	color: #3C3C3C;
	font-size: 16px;
	font-weight: bold;
}

div.loginInput {
	border: 1px solid #CBCBCB;
	margin: 20px 0px;
}

div.loginInput input {
	display: inline-block;
	border: 0px solid transparent;
	width: 244px;
	height: 30px;
	position: relative;
	left: 6px;
	top: 6px;
}

div.loginInput span, div.loginInput input {
	display: inline-block;
}

div.loginInput span.loginInputIcon {
	margin: 0px;
	background-color: #CBCBCB;
	width: 40px;
	height: 40px;
}

span.loginInputIcon span.glyphicon {
	font-size: 22px;
	position: relative;
	left: 9px;
	top: 9px;
	color: #606060;
}

button.redButton {
	color: white;
	background-color: #C40000;
	font-size: 14px;
	font-weight: bold;
}

span.errorMessage{
    color: red;
}

</style>