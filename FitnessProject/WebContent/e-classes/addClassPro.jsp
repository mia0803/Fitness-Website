<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.classDAO" %>
<%@ page import="com.fitness.clubs.classDTO" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add a Class</title>
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
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.fitness.clubs.classDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%

classDAO dao = new classDAO();
// no same day, time, teacher
boolean result = dao.check(dto);
if(!result){
	dao.addClass(dto);
	%>
	<div class="horz-center-box">
		<h1>New Class Added!</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
} else{
	%>
	<script>
		alert("Submitted same teacher for duplicate time on same day");
		window.location="addClass.jsp?club_name="+<%=dto.getClub()%>;
	</script>
	<%
}
%>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/classes.js"></script>

</body>
</html>