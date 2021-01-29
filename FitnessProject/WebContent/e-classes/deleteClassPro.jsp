<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.ClassDAO" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Delete Class Processing</title>
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

String class_id = request.getParameter("class_id"); 
ClassDAO dao = new ClassDAO();
dao.deleteClass(class_id);

%>

<div class="horz-center-box">
	<h1>Successfully deleted.</h1><br/><br/>
	<button class="close-btn">Close</button>
</div>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/classes.js"></script>

</body>
</html>