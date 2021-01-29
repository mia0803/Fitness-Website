<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %>
<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Club info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>
<body id="mng-clubs">

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

clubsDAO dao = new clubsDAO();
ArrayList<clubsDTO> clubs = dao.getClubs();

%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Club Information Table</b>
		<br/>
		<table class="club-table">
			<tr>
			    <th>Club ID</th>
			    <th>Club Title</th>
			    <th class="address-row">Address</th>
			    <th class="phone-row">Phone</th>
			    <th class="location-row">Location</th>
			    <th class="description-row">Description</th>
			    <th>Club Image</th>
			    <th>Function</th>
			 </tr>
		<%
		for(clubsDTO club:clubs){
			%>
			<tr>
			    <td><%=club.getId() %></td>
			    <td><%=club.getName() %></td>
			    <td><%=club.getAddress() %></td>
			    <td><%=club.getPhone() %></td>
			    <td><%=club.getLocation() %></td>
			    <td><%=club.getDesc() %></td>
			    <td><img src="data:image/jpeg;base64,<%=club.getImg()%>" class="img-size" alt="Club Image" ></td>
			    <td>
			    	<button class="club-edit-btn" id="<%=club.getName() %>">Edit</button>
			    	<button class="club-delete-btn" id="<%=club.getName() %>">Delete</button>
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