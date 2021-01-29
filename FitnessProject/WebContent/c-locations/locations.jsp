<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %>
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

String user = (String)session.getAttribute("user");

LocationDAO dao = new LocationDAO();
int total_n = dao.getClubCount();
ArrayList<LocationDTO> locations = dao.getLocations();

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
			<h1>We have total <%=total_n %> Club(s) nationwide!</h1>
		</div>
		<div class="add-box">
		<%
		if("admin".equals(user)){%>
			<button class="add-btn" type="submit">Add Location</button>
			<%}
		%>
		</div>
		<% 
		for(LocationDTO location:locations){
			int branch_n = dao.getBranch_n(location.getLocation());	
		%> 
		<div class="top-align">
			<div class="content-box location-box" id="<%=location.getLocation() %>">
				<div class="loc-desc">
					<h2><%=location.getLocation() %> </h2>
					<p><%=location.getLoc_desc() %></p>
					<a>-> View all <%=branch_n %> clubs</a>
				</div>
				<div class="vert-center-box">
					<img src="data:image/jpeg;base64,<%=location.getImg()%>" class="img-size" alt="Location Image" >
				</div>
			</div>
			<div class="vert-center-box">
			<%
			if("admin".equals(user)){%>
				<div class="btn-box">
					<button class="edit-btn" id="<%=location.getLocation() %>">Edit</button>
					<button class="delete-btn" id="<%=location.getLocation() %>">Delete</button>
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
<script src="/fitnessProject/z-js/locations.js"></script>

</body>
</html>



















