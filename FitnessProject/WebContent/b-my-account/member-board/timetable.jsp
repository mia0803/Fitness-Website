<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My Class Timetable</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>
html, body{width:100%; height: 100%}
</style>


</head>
<body id="time-table">

<%
//cookie check
Cookie cookies[] = request.getCookies();
if(cookies != null){
	for(Cookie c:cookies){
		if(c.getName().equals("c_email")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_pw")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_remember")){
			c.setMaxAge(60*60*24);
		}
	}
}

//session check
String sessionId = (String)session.getAttribute("mem_id");

if(sessionId == null){
	response.sendRedirect("/fitnessProject/a-homepage/main.jsp");
	return;
}

int mem_id = Integer.parseInt(sessionId);

String user = (String)session.getAttribute("user");

if(!"member".equals(user)){
	%>
	<script>
	alert("Member only accepted");
	window.location="/fitnessProject/a-homepage/main.jsp";
	</script>
	<%
}

ClassCartDAO dao = new ClassCartDAO();


Calendar cal = Calendar.getInstance();
String Today = new SimpleDateFormat("EEE").format(cal.getTime());
String today = Today.toLowerCase();


%>


<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="memberMenuBar.jsp" />
	
	
	<div class="body-content">
		<div class="horz-center-box longer-center">
			<div class="modal-title">
			  	<div class="head-title">
			  		<b class="some-margin">My Class Timetable</b>
			  	</div>
			  	<div class="head-days" id="<%=today%>">
				  	<span class="class-btn" data-showingbutton="mon">Mon</span>
				  	<span class="class-btn" data-showingbutton="tue">Tue</span>
				  	<span class="class-btn" data-showingbutton="wed">Wed</span>
				  	<span class="class-btn" data-showingbutton="thu">Thu</span>
				  	<span class="class-btn" data-showingbutton="fri">Fri</span>
				  	<span class="class-btn" data-showingbutton="sat">Sat</span>
				  	<span class="class-btn" data-showingbutton="sun">Sun</span>
			  	</div>
		  	</div>
			
			<div class="modal-body">
				<table class="schedule-content" id="mon">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes = dao.getClassInfo(mem_id, "mon");
					for(ClassCartDTO class1:classes){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
				<table class="schedule-content" id="tue">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes2 = dao.getClassInfo(mem_id, "tue");
					for(ClassCartDTO class1:classes2){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
				<table class="schedule-content" id="wed">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes3 = dao.getClassInfo(mem_id, "wed");
					for(ClassCartDTO class1:classes3){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
				<table class="schedule-content" id="thu">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes4 = dao.getClassInfo(mem_id, "thu");
					for(ClassCartDTO class1:classes4){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
				<table class="schedule-content" id="fri">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes5 = dao.getClassInfo(mem_id, "fri");
					for(ClassCartDTO class1:classes5){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
				<table class="schedule-content" id="sat">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes6 = dao.getClassInfo(mem_id, "sat");
					for(ClassCartDTO class1:classes6){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
				<table class="schedule-content" id="sun">
					<tr id="head">
					    <th>Title</th>
					    <th>Teacher</th>
					    <th>Time</th>
					    <th>Club</th>
					    <th>Function</th>
					</tr>
					<%
					ArrayList<ClassCartDTO> classes7 = dao.getClassInfo(mem_id, "sun");
					for(ClassCartDTO class1:classes7){ 
					%>
					<tr>
						<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
						<td class="schedule-tr"><%=class1.getTeacher() %></td>
						<td class="schedule-tr"><%=class1.getC_time() %></td>
						<td class="schedule-tr"><%=class1.getClub() %></td>
						<td><button class="drop-class-btn" id="<%=class1.getId() %>">Drop</button></td>
					</tr>
					<%}%>
				</table>
			</div>
		</div>
	</div>
</div>



<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/member.board.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>


</body>
</html>










