<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.locationDAO" %>
<%@ page import="com.fitness.clubs.locationDTO" %>
    
<%

String loc_name = request.getParameter("location"); 
locationDAO dao = new locationDAO();
locationDTO location = dao.getLocation(loc_name);


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Edit Location </title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">

<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>
</head>

<body>

<form action="editLocationPro.jsp" method="post" enctype="multipart/form-data">
	<div class="horz-center-box">
		<div>
			<h1>Edit Location</h1>
		</div>
		<div>
			Location: <input type="text" name="location" value="<%=location.getLocation() %>"><br/>
		</div>
		<div class="top-align">
			Description: &nbsp; 
			<textarea class="desc" name="desc"><%=location.getLoc_desc() %></textarea>
		</div>
		<div>
			<img class="loc-img" alt="Location Image" src="data:image/jpeg;base64,<%=location.getImg()%>">
		</div>
		<div>
			Update Image: &nbsp; 
			<input type="file" name="img">
		</div>
		<div>
			<input type="hidden" name="id" value="<%=location.getLocation_id()%>">
			<input type="submit" value="Update">&nbsp;
			<button class="close-btn">Close</button>
		</div>
	</div>
</form>



<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>