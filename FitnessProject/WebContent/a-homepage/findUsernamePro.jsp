<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Find username</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">

<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>

</head>
<body>

<jsp:useBean id="dto" class="com.fitness.members.MembersDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%

MembersDAO dao = new MembersDAO();

String email = dao.getEmail(dto.getPhone(),dto.getFname(),dto.getLname());


if(email != null){
	%>
	<div class="horz-center-box">
		<h1>This is your email:</h1><br/>
		<p><%=email %></p>
		<br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
} else{
	%>
	<script>
	alert("No matched information!");
	window.location="findUsername.jsp";
	</script>
	<%
}

%>






<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>


</body>
</html>