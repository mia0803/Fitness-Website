<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Star Fitness Login</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/login.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>
<body>

<%
//cookie check
String email = null;
String remember = null;
Cookie cookies[] = request.getCookies();
if(cookies != null){
	for(Cookie c:cookies){
		if(c.getName().equals("c_email")){
			c.setMaxAge(60*60*24);
			email = c.getValue();
		}
		if(c.getName().equals("c_pw")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_remember")){
			c.setMaxAge(60*60*24);
			remember = c.getValue();
		}
	}
}


%>


<div class="white-box center-align">
	<div class="thick-box left-align">
		<br/><br/>
		<h1 class="go-to-main">Star Fitness</h1>
		<p>Log in to your Star Fitness account</p><br/><br/>
	</div>
	<form action="loginPro.jsp" method="post">
		<%
		if(remember!=null){
			%>
		<div class="thick-box center-align">
			<input class="big-size email" name="email" type="text" value="<%=email%>" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" required><br/><br/>
			<input class="big-size pw" name="pw" type="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z]).{5,}" required><br/><br/>
			<input class="big-size button" type="submit" value="Login">
		</div>
		<input type="checkbox" name="remember" value="remember" checked><p class="grey">Remember my ID</p>
			<%
		} else{
			%>
		<div class="thick-box center-align">
			<input class="big-size email" name="email" type="text" placeholder="Email" pattern="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" required><br/><br/>
			<input class="big-size pw" name="pw" type="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z]).{5,}" required><br/><br/>
			<input class="big-size button" type="submit" value="Login">
		</div>
		<input type="checkbox" name="remember" value="remember"><p class="grey">Remember my ID</p>
			<%
		}
		%>
	</form>
	
	<div class="thick-box center-row-align">
		<a class="forgot-username">Forgot UserName</a> 
		<pre>      </pre>
		<a class="forgot-password">Forgot Password</a>
	</div>
	<p>___ or ___</p>
	<div class="center-align login-api">
		<p>Login with Facebook</p><br/>
		<p>Sign in with Apple</p>
	</div>
	<p class="large-top-margin">Don't have an account yet? Click <a href="registration1.jsp">here</a> to register.</p>

</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/homepage.js"></script>


</body>
</html>














