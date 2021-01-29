<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>


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


String club_name = request.getParameter("club_name");
if(club_name == null){
	response.sendRedirect("/fitnessProject/c-locations/locations.jsp");
	return;
}

String user = (String)session.getAttribute("user");

clubsDAO dao = new clubsDAO();
clubsDTO club = dao.getClub(club_name);

classDAO cdao = new classDAO();
int total_classes = cdao.getTotalCount(club_name);


Calendar cal = Calendar.getInstance();
String Today = new SimpleDateFormat("EEE").format(cal.getTime());
String today = Today.toLowerCase();


%>




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Club Details</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>
.main-body{
	align-items: center;
	background: #e0e0e0;
	margin:0;
	margin-bottom: 30px;
	padding:0;
	color: black;
	
}
</style>

</head>
<body>
<div class="main-body">

<%
if(sessionId!=null){
	%><jsp:include page="/a-homepage/userTopMenuBar.jsp" /><%
} else{
	%><jsp:include page="/a-homepage/topMenuBar.jsp" /><%
}
%>



	<div class="row-container">
		<div class="width-setting">
			<h1><%=club.getName() %></h1>
			<p><%=club.getDesc() %></p>
			<p><%=club.getAddress() %></p>
			<p><%=club.getPhone() %></p>
			<button class="become-member">Become a Member</button>
		</div>
		<div class="img-box">
			<img src="data:image/jpeg;base64,<%=club.getImg()%>" class="img-size2" alt="Club Image">
		</div>
	</div>
	<div class="row-container">
		<div class="just-box2">
			<h2>We have <%= total_classes %> Classes this week.</h2>
			<p>
			Enjoy access to 11 class categories, including signature Cycling, high-intensity Boxing and Martial Arts classes, and sculpting Pilates sessions. All classes in the club and on the Variis by Starry fitness app are unlimited and included in your membership.
			</p>
			<button type="button" class="class-schedule-btn" id="<%=today%>">View Class Schedule</button>
			
		</div>
		<div class="time-table">
			<div class="time-table-line">
				<p>Pilates</p> 
				<pre>    </pre>
				<h4>Pilates Fusion</h4>
			</div>
			<div class="time-table-line">
				<p>Running</p> 
				<pre>    </pre>
				<h4>Starry Run Club</h4>
			</div>
			<div class="time-table-line">
				<p>Yoga</p> 
				<pre>    </pre>
				<h4>Gentle Yoga</h4>
			</div>
		</div>
	</div>
</div>


<div class="theModal">
	<div class="modal-content">
		<div class="modal-header">
		  	<div class="head-title">
		  		<h3><%=total_classes %> Classes</h3>
		  		<span class="close" aria-hidden="true">&times;</span>
		  	</div>
		  	<div class="week-box">
			  	<div class="head-days">
				  	<div class="class-btn" data-showingbutton="mon">Mon</div>
				  	<div class="class-btn" data-showingbutton="tue">Tue</div>
				  	<div class="class-btn" data-showingbutton="wed">Wed</div>
				  	<div class="class-btn" data-showingbutton="thu">Thu</div>
				  	<div class="class-btn" data-showingbutton="fri">Fri</div>
				  	<div class="class-btn" data-showingbutton="sat">Sat</div>
				  	<div class="class-btn" data-showingbutton="sun">Sun</div>
			  	</div>
		  	</div>
		</div>
		
		<div class="modal-body">
			<table class="schedule-content" data-button="mon">
				<%
				ArrayList<classDTO> classes = cdao.getClasses(club_name, "mon");
				for(classDTO class1:classes){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
			<table class="schedule-content" data-button="tue">
				<%
				ArrayList<classDTO> classes2 = cdao.getClasses(club_name, "tue");
				for(classDTO class1:classes2){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
			<table class="schedule-content" data-button="wed">
				<%
				ArrayList<classDTO> classes3 = cdao.getClasses(club_name, "wed");
				for(classDTO class1:classes3){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
			<table class="schedule-content" data-button="thu">
				<%
				ArrayList<classDTO> classes4 = cdao.getClasses(club_name, "thu");
				for(classDTO class1:classes4){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
			<table class="schedule-content" data-button="fri">
				<%
				ArrayList<classDTO> classes5 = cdao.getClasses(club_name, "fri");
				for(classDTO class1:classes5){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
			<table class="schedule-content" data-button="sat">
				<%
				ArrayList<classDTO> classes6 = cdao.getClasses(club_name, "sat");
				for(classDTO class1:classes6){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
			<table class="schedule-content" data-button="sun">
				<%
				ArrayList<classDTO> classes7 = cdao.getClasses(club_name, "sun");
				for(classDTO class1:classes7){ 
				%>
				<tr>
					<td class="schedule-tr bigger"><%=class1.getTitle() %></td>
					<td class="schedule-tr"><%=class1.getTeacher() %></td>
					<td class="schedule-tr"><%=class1.getC_time() %></td>
					<td class="schedule-tr"><%=club_name %></td>
					<td><input type="radio" class="hide" name="select-class" value="<%=class1.getC_id()%>"></td>
				</tr>
				<%}%>
			</table>
		</div>
	
		<div class="modal-footer">
		<%
		if("admin".equals(user)){%>
			<button class="modal-btn first-delete">Delete Class</button>
		  	<button class="modal-btn class-delete-btn">Delete Class</button>
		  	<button class="modal-btn first-edit">Edit Class</button>
		  	<button class="modal-btn class-edit-btn">Edit Class</button>
		  	<button class="modal-btn class-add-btn" id="<%= club_name%>">Add Class</button>
			<%}
		else if("member".equals(user)){%>
			<button class="modal-btn first-select">Select</button>
		  	<button class="modal-btn add-to-schedule" id="<%= club_name%>">Add to my schedule</button>
			<%}
		%>
		</div>
	</div>
</div>




<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/classes.js"></script>

</body>
</html>

























