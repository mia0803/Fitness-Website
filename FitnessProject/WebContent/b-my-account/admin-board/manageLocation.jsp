<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %>    
<%@ page import="java.util.ArrayList" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Location info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>
<body id="mng-locations">

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

String user = (String)session.getAttribute("user");
if(!"admin".equals(user)){
	%>
	<script>
	alert("Admin only accepted");
	window.location="/fitnessProject/a-homepage/main.jsp";
	</script>
	<%
}


locationDAO dao = new locationDAO();
ArrayList<locationDTO> locations = dao.getLocations();

%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Location Information Table</b>
		<br/><br/>
		<div class="align-right">
			<button class="add-location">Add Location</button>
		</div>
		<table>
			<tr>
			    <th>Location ID</th>
			    <th>Location</th>
			    <th>Location Description</th>
			    <th>Location Image</th>
			    <th>Function</th>
			 </tr>
		<%
		for(locationDTO location:locations){
			%>
			<tr>
			    <td><%=location.getLocation_id() %></td>
			    <td><%=location.getLocation() %></td>
			    <td><%=location.getLoc_desc() %></td>
			    <td><img src="data:image/jpeg;base64,<%=location.getImg()%>" class="img-size" alt="Location Image" ></td>
			    <td>
			    	<button class="edit-loc-btn" id="<%=location.getLocation() %>">Edit</button>
			    	<button class="delete-loc-btn" id="<%=location.getLocation() %>">Delete</button>
			    </td>
			 </tr>
			<% } %>
		</table>
	</div>
</div>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/admin.board.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>