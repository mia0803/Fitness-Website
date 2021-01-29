<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.clubsDAO" %>
<%@ page import="com.fitness.clubs.clubsDTO" %>
    
<%
// club info edit page

String name = request.getParameter("name"); 
clubsDAO dao = new clubsDAO();
clubsDTO club = dao.getClub(name);


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Edit Club</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>
</head>

<body>

<form action="editClubPro.jsp" method="post" enctype="multipart/form-data">
	<div class="horz-center-box">
		<div>
			<h1>Edit Club</h1>
		</div>
		<div>
			Title: <input type="text" name="name" value="<%=club.getName() %>"><br/>
		</div>
		<div>
			Address: <input type="text" name="address" value="<%=club.getAddress() %>"><br/>
		</div>
		<div>
			Phone: <input type="text" name="phone" value="<%=club.getPhone() %>"><br/>
		</div>
		<div class="top-align">
			Description: &nbsp; 
			<textarea class="desc" name="desc"><%=club.getDesc() %></textarea>
		</div>
		<div>
			<img class="img-size" alt="Club Image" src="data:image/jpeg;base64,<%=club.getImg()%>">
		</div>
		<div>
			Update Image: &nbsp; 
			<input type="file" name="img">
		</div>
		<div>
			<input type="hidden" name="id" value="<%=club.getId()%>">
			<input type="submit" value="Update">&nbsp;
			<button class="close-btn">Close</button>
		</div>
	</div>
</form>



<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>