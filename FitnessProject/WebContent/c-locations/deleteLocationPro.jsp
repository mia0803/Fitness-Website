<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.LocationDAO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Location Deletion Processing</title>
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

String location = request.getParameter("location"); 
LocationDAO dao = new LocationDAO();


boolean result = dao.checkDelete(location);
if(!result){
	dao.deleteLocation(location);
%>
<div class="horz-center-box">
	<h1>Successfully deleted.</h1><br/><br/>
	<button class="close-btn">Close</button>
</div>

<%

} else{
	%>
	<div class="horz-center-box">
		<h1 class="warning-msg">(Failed)<br/>Existence of Club(s) in this location!</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
}
%>




<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>