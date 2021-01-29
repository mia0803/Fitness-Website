<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.clubsDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Club Deletion Processing</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
</head>
<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>
<body>



<%

String name = request.getParameter("name"); 
clubsDAO dao = new clubsDAO();

boolean result = dao.checkDelete(name);
if(!result){
	dao.deleteClub(name);
%>
<div class="horz-center-box">
	<h1>Successfully deleted.</h1><br/><br/>
	<button class="close-btn">Close</button>
</div>

<%

} else{
	%>
	<div class="horz-center-box">
		<h1 class="warning-msg">(Failed)<br/>Check class schedule in this club!</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
}
%>



<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>




</body>
</html>