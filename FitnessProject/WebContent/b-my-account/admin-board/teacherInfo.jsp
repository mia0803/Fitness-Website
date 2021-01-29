<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>
<%@ page import="java.util.ArrayList" %>    
    
<!DOCTYPE html>
<html style="width:100%">
<head>
<meta charset="EUC-KR">
<title>Teacher's info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

html, body{
width: auto;
}

table{
width: auto;
margin: 20px;
}

</style>

</head>
<body id="teacher-info" style="width:100%">

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

MembersDAO dao = new MembersDAO();
ArrayList<MembersDTO> teachers = dao.getTeachers();
%>

<div class="black-banner" style="width:100%">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Teacher Information Table</b>
		<br/>
		<table>
			<tr>
			    <th>Member ID</th>
			    <th>Password</th>
			    <th>First name</th>
			    <th>Last name</th>
			    <th>Email</th>
			    <th>Phone</th>
			    <th>Registered Date</th>
			    <th>Profile</th>
			    <th>Club</th>
			    <th>Location</th>
			    <th>Deactivate</th>
			    <th>Function</th>
			 </tr>
		<%
		for(MembersDTO teacher:teachers){
			%>
			<tr>
			    <td><%=teacher.getId() %></td>
			    <td><%=teacher.getPw() %></td>
			    <td><%=teacher.getFname() %></td>
			    <td><%=teacher.getLname() %></td>
			    <td><%=teacher.getEmail() %></td>
			    <td><%=teacher.getPhone() %></td>
			    <td><%=teacher.getRegisteredAt() %></td>
			    <td><img class="profile-size"  src="/fitnessProject/z-member-profile/<%=teacher.getProfile() %>" alt="Teacher picture"></td>
			    <td><%=teacher.getClub() %></td>
			    <td><%=teacher.getLocation() %></td>
			    <td><%=teacher.getDeactivate() %></td>
			    <%
			    if(teacher.getDeactivate()==1){
			    	%>
			    	<td><button class="activate-btn" id="<%=teacher.getId() %>">Activate</button></td>
			    	<%
			    } else{
			    	%>
			    	<td><button class="deactivate-btn" id="<%=teacher.getId() %>">Deactivate</button></td>
			    	<%
			    }%>
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