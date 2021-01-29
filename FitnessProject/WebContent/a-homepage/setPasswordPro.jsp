<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Reset password</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">

<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>

</head>
<body>


<%

String email = request.getParameter("email");
String pw = request.getParameter("pw");

MembersDAO dao = new MembersDAO();
dao.updatePw(email, pw);


%>


<div class="horz-center-box">
	<h1>Your password is now reset.</h1>
	<br/><br/>
	<button class="close-btn">Close</button>
</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>


</body>
</html>