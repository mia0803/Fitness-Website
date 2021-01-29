<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<%

String club_name = request.getParameter("club_name");

%>


    
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


<form action="addClassPro.jsp" method="post">
	<div class="horz-center-box1">
		<div>
			<h1>Add a Class</h1>
		</div>
		<div >
			<div class="align-right">
				Class Title:<br/><br/>
				Teacher:<br/><br/>
				Time:<br/><br/>
				Day of Week: <br/><br/>
			</div>
			<div class="align-left">
				<input type="text" name="title"><br/><br/>
				 <input type="text" name="teacher"><br/><br/>
				 
				<input type="text" name="time1" placeholder="6:00"> - 
				<input type="text" name="time2" placeholder="6:45"> &nbsp;
				<select name="time3">
					<option value="am">AM</option>
					<option value="pm">PM</option>
				</select>
				<br/><br/>
				
				<select name="c_day">
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
			<input type="hidden" name="club" value="<%=club_name %>">
			<input type="submit" name="Submit"><br/><br/>
		</div>
	</div>
</form>


</body>
</html>