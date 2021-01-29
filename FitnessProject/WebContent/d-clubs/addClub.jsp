<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.clubsDAO" %>
<%@ page import="com.fitness.clubs.clubsDTO" %>    

<%

String location = request.getParameter("location"); 


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add a Club</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>

</head>
<body>

<form action="addClubPro.jsp" method="post" enctype="multipart/form-data">
	<div class="horz-center-box">
		<div>
			<h1>Add a Club</h1>
		</div>
		<div>
			Club Title: <input type="text" name="name"><br/><br/>
		</div>
		<div>
			Address: <input type="text" name="address"><br/><br/>
		</div>
		<div>
			Phone: <input type="text" name="phone"><br/><br/>
		</div>
		<div class="top-align">
			Description: &nbsp; 
			<textarea class="desc" name="desc"></textarea>
		</div>
		<div>
			Photo: <input type="file" name="img"><br/><br/>
		</div>
		<div>
			<input type="hidden" name="location" value="<%=location %>">
			<input type="submit" name="Submit">
		</div>
	</div>
</form>




</body>
</html>