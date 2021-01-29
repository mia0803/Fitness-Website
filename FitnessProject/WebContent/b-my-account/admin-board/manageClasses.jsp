<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %>
<%@ page import="java.util.ArrayList" %>     
<!DOCTYPE html>
<html style="width:100%">
<head>
<meta charset="EUC-KR">
<title>Class info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>
<body id="mng-classes" style="width:100%">

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


classDAO dao = new classDAO();
ArrayList<classDTO> classes = dao.getClasses();

%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Class Information Table</b>
		<br/><br/>
		
		<i class="fa fa-search"></i>&nbsp;
		<input type="text" class="search-box" id="classInput" placeholder="Search day" ><br/>
		
		<table id="classTable">
			<tr>
			    <th>Class ID</th>
			    <th>Day of week</th>
			    <th>Title</th>
			    <th>Teacher</th>
			    <th>Time</th>
			    <th>Club</th>
			    <th>Function</th>
			 </tr>
		<%
		for(classDTO class1:classes){
			%>
			<tr>
			    <td><%=class1.getC_id() %></td>
			    <td><%=class1.getC_day() %></td>
			    <td><%=class1.getTitle() %></td>
			    <td><%=class1.getTeacher() %></td>
			    <td><%=class1.getC_time() %></td>
			    <td><%=class1.getClub() %></td>
			    <td>
			    	<button class="class-edit-btn" id="<%=class1.getC_id() %>">Edit</button>
			    	<button class="class-delete-btn" id="<%=class1.getC_id() %>">Delete</button>
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