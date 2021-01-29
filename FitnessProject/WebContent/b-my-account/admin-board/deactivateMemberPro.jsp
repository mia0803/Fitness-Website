<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Deactivation</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<style>

html,body{
	background:white;
	color: black
}

</style>

</head>
<body>

<%


String sid = request.getParameter("id"); 
int id = 0;
if(sid != null){
	id = Integer.parseInt(sid);
}

String state = request.getParameter("state");

membersDAO dao = new membersDAO();



if(state.equals("deact")){
	dao.deactivateMember(id);
	%>
	<div class="horz-center-box">
		<h1>User deactivated.</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
	
	
} else if(state.equals("act")){
	dao.activateMember(id);
	%>
	<div class="horz-center-box">
		<h1>User activated.</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
}
%>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>