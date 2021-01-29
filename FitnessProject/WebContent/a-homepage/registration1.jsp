<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %>
<%@ page import="java.util.ArrayList" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Registration Step 1</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/register.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>


<%

ClubsDAO dao = new ClubsDAO();

String state = request.getParameter("state");

if(state != null){
	session.setAttribute("state", state);
}

%>




<body>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="left-leaning">
	<div class="narrow-high-box">
		<h1>Choose your membership</h1>
	</div>
	<div class="thick-top-margin row-align">
	Select a Club to continue &nbsp;
	<a class="small-underline select-btn">select club</a>
	</div>
	<div class="thick-top-margin">
		<input class="big-next-btn reg1-btn" type="submit" value="Next">
	</div>
	
</div>

<div class="theModal">
	<div class="modal-content">
		<div class="modal-header">
			<div class="in-line">
		  		<span class="close" aria-hidden="true">&times;</span>
		  	</div>
			<div class="narrow-high-box">
				<h1>100+ Clubs worldwide</h1>
				Choose a club for your membership
			</div>
			<div class="underline-box">
				<i class="fa fa-search"></i>&nbsp;&nbsp;
				<input class="search-btn" type="text" name="location" placeholder="Enter State">
			</div>
		</div>
		
		<div class="modal-body">
		<%
		ArrayList<ClubsDTO> clubs = dao.getClubs();
		
		for(ClubsDTO club:clubs){
			%>
			<div class="large-box <%=club.getLocation() %>">
				<p class="header club"><%=club.getName() %></p>
				<p class="narrow-box"> <%=club.getAddress() %></p>
				<%=club.getPhone() %><br/>
				<%=club.getLocation() %>
			</div>
			
			<%
		}
		%>
		</div>
		
	</div>
</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/homepage.js"></script>

</body>
</html>