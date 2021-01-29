<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.clubsDAO" %>
<%@ page import="com.fitness.clubs.clubsDTO" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Find a Club</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>

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


String location = request.getParameter("location");
if(location == null){
	response.sendRedirect("/fitnessProject/c-locations/locations.jsp");
	return;
}

String user = (String)session.getAttribute("user");

clubsDAO dao = new clubsDAO();
int total_n = dao.getClubCount(location);
ArrayList<clubsDTO> clubs = dao.getClubs(location);

String sessionId = (String)session.getAttribute("mem_id");

%>


<body>
<div class="main-body">

<%
if(sessionId!=null){
	%><jsp:include page="/a-homepage/userTopMenuBar.jsp" /><%
} else{
	%><jsp:include page="/a-homepage/topMenuBar.jsp" /><%
}
%>



	<div class="body-box">
		<div class="total-clubs">
			<h1>We have total <%=total_n %> Club(s) in <%=location %>!</h1>
		</div>
		<div class="add-box" >
		<%
		if("admin".equals(user)){%>
			<button class="club-add-btn" id="<%=location %>">Add a Club</button>
			<%}
		%>
		</div>
		<% 
		for(clubsDTO club:clubs){	
		%> 
		<div class="top-align">
			<div class="content-box club-box" id="<%=club.getName() %>">
				<div class="loc-desc">
					<h2><%=club.getName() %> </h2>
					<p><%=club.getAddress() %></p>
					<p><%=club.getPhone() %></p>
					<a>-> View this club</a>
				</div>
				<div class="blank-space">
				
				</div>
				<div class="vert-center-box">
					<img src="data:image/jpeg;base64,<%=club.getImg()%>" class="img-size" alt="Club Image" >
				</div>
			</div>
			<div class="vert-center-box">
			<%
			if("admin".equals(user)){%>
				<div class="btn-box">
					<button class="club-edit-btn" id="<%=club.getName() %>">Edit</button>
					<button class="club-delete-btn" id="<%=club.getName() %>">Delete</button>
				</div>
				
				<%}
			%>
			</div>
		</div>
		<%
		}%>
	</div>
</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/clubs.js"></script>

</body>
</html>