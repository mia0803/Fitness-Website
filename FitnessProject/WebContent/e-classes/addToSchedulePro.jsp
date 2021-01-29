<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add to Schedule</title>
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

String club_name = request.getParameter("club_name");

String sid = request.getParameter("class_id");
int class_id = Integer.parseInt(sid);

String member_sid = (String)session.getAttribute("mem_id");
int member_id = Integer.parseInt(member_sid);

classCartDAO dao = new classCartDAO();
boolean result = dao.checkExistance(class_id, member_id); 

if(!result){
	dao.addClass(class_id, member_id);
	
	%>
	<div class="horz-center-box">
		<h1>Selected class has added to my class schedule!</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
	
} else{
	%>
	<div class="horz-center-box">
		<h1>Selected class already exists in the schedule!</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
}


%>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/classes.js"></script>

</body>
</html>






