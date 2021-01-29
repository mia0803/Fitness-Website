<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fitness.members.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Deactivation</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
</head>
<body>

<%

String sid = request.getParameter("id"); 
int id = 0;
if(sid != null){
	id = Integer.parseInt(sid);
}

membersDAO dao = new membersDAO();
dao.deactivateMember(id);


session.invalidate();


Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(Cookie c: cookies){
		String name = c.getName();
		if(name.equals("c_email")){
			c.setMaxAge(0);
			response.addCookie(c);  // cookie expires
		}
		if(name.equals("c_pw")){
			c.setMaxAge(0);
			response.addCookie(c);  // cookie expires
		}
		if(name.equals("c_remember")){
			c.setMaxAge(0);
			response.addCookie(c);  // cookie expires
		}
	}
}




%>

<div class="horz-center-box">
	<h1>Your account has deactivated.</h1><br/>
	<h1>Please login if you want to activate your account.</h1>
	<br/><br/>
	<button class="close-btn">Close</button>
</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>


</body>
</html>