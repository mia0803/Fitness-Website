<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Board</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>
html, body{width:100%; height: 100%}
</style>

</head>
<%

//cookie check
Cookie cookies[] = request.getCookies();
if(cookies != null){
	for(Cookie c:cookies){
		if(c.getName().equals("c_email")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_pw")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_remember")){
			c.setMaxAge(60*60*24);
		}
	}
}

//session check
String sessionId = (String)session.getAttribute("mem_id");
if(sessionId == null){
	response.sendRedirect("/fitnessProject/a-homepage/main.jsp");
	return;
}

String email = (String)session.getAttribute("email");

String user = (String)session.getAttribute("user");

if(!"member".equals(user)){
	%>
	<script>
	alert("Member only accepted");
	window.location="/fitnessProject/a-homepage/main.jsp";
	</script>
	<%
}

%>

<body id="main">

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="memberMenuBar.jsp" />
	
	
	<div class="body-content">
		<div class="horz-center-box center">
			<h1>My Main board</h1><br/>
			Welcome!<br/>
			Email: <%=email %><br/><br/>
			<button class="go-to-main">Main</button> &nbsp;
			<button class="log-out-btn">Log out</button>
		</div>
	</div>
	
	
</div>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/member.board.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>