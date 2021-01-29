<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Write Post</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/qboard.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

.narrow-body-box{
	text-align: center;
	background: #d4d4d4;
	width: 1000px;
	margin: auto;
	margin-top:10px;
	border-radius: 15px;
	color: black;
	padding: 20px;
	padding-bottom:40px;
	margin-bottom:20px;
}

</style>

</head>
<body>

<%

request.setCharacterEncoding("UTF-8");

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
String user = (String)session.getAttribute("user");

String email = request.getParameter("email");


%>


<%
if(email!=null){
	%><jsp:include page="/a-homepage/userTopMenuBar.jsp" /><%
} else{
	%><jsp:include page="/a-homepage/topMenuBar.jsp" /><%
}
%>

<div class="main-body" >
	<div class="narrow-body-box">

		<div class="post-content-box">
			<button class="go-to-qboard">Main board</button>
			<form action="writePostPro.jsp" method="post" class="length-check">
				<div class="row-align">
					<div class="post-title">
						<p>Post Title:</p>
						<p>Writer: </p>
						<p>Content:</p>
					</div>
					
					<div class="post-contents">
						<%
						if("admin".equals(user)){
						%>
						<input name="title" type="text" value="[Announcement] ">  <br/><br/>
						<input name="email" type="text" value="<%=email %>" readonly><br/><br/>
						<textarea name="content" rows="10" cols="20" placeholder="Content..."></textarea><br/>
						<input name="announcement"  type="hidden" value="1">
						<%
					} else{
						%>
						<input name="title" type="text" placeholder="Title...">  <br/><br/>
						<input name="email" type="text" value="<%=email %>" readonly><br/><br/>
						<textarea name="content" rows="10" cols="20" placeholder="Content..."></textarea><br/>
						<input name="announcement"  type="hidden" value="0">
						<%}%>
					</div>
				</div>
				<div class="full-box">
					<input type="submit" value="Post">
				</div>
			</form>
		</div>
	</div>
</div>





<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/qboard.js"></script>

</body>
</html>