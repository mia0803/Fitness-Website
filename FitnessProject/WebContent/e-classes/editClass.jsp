<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Edit Class</title>
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
// club info edit page

String class_id = request.getParameter("class_id"); 
ClassDAO dao = new ClassDAO();
ClassDTO selected_class = dao.getClass(class_id);

%>

<form action="editClassPro.jsp" method="post">
	<div class="horz-center-box">
		<div>
			<h1>Edit Class</h1>
		</div>
		<div >
			<div class="align-right">
				Class Title:<br/><br/>
				Teacher:<br/><br/>
				Time:<br/><br/>
				Day of Week: <br/><br/>
			</div>
			<div class="align-left">
				<input type="text" name="title" value="<%=selected_class.getTitle() %>"><br/><br/>
				 <input type="text" name="teacher" value="<%=selected_class.getTeacher() %>"><br/><br/>
				 
				<input type="text" name="time1" value="<%=selected_class.getTime1() %>"> - 
				<input type="text" name="time2" value="<%=selected_class.getTime2() %>"> &nbsp;
				<select name="time3" id="<%=selected_class.getTime3()%>">
					<option value="am">AM</option>
					<option value="pm">PM</option>
				</select>
				<br/><br/>
				
				<select name="c_day" id="<%=selected_class.getC_day()%>">
					<option value="mon">Monday</option>
					<option value="tue">Tuesday</option>
					<option value="wed">Wednesday</option>
					<option value="thu">Thursday</option>
					<option value="fri">Friday</option>
					<option value="sat">Saturday</option>
					<option value="sun">Sunday</option>
				</select>
				<br/><br/>
			</div>
		</div>
		<div >
			<input type="hidden" name="c_id" value="<%=selected_class.getC_id()%>">
			<input type="hidden" name="club" value="<%=selected_class.getClub()%>">
			<input type="submit" name="Update"> &nbsp;
			<button class="close-btn">Close</button>
		</div>
	</div>
</form>



<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/classes.js"></script>

</body>
</html>