<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>
<%@ page import="java.util.ArrayList" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Member's info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

html, body{
width: auto;
}

table.memberTable{
width: 1000px;
margin: 20px;

}



</style>


</head>



<body id="member-info">

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


membersDAO dao = new membersDAO();
ArrayList<membersDTO> members = dao.getMembers();

%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Member Information Table</b>
		<br/><br/>
	
		<i class="fa fa-search"></i>&nbsp;
		<input type="text" class="search-box" id="memberInput" placeholder="Search email" ><br/>
		
		<table id="memberTable">
			<tr>
			    <th>Member ID</th>
			    <th>Password</th>
			    <th>First name</th>
			    <th>Last name</th>
			    <th>Email</th>
			    <th>Phone</th>
			    <th>Membership</th>
			    <th>Registered Date</th>
			    <th>Profile</th>
			    <th>Club</th>
			    <th>Location</th>
			    <th>Payment</th>
			    <th>Deactivate</th>
			    <th>Function</th>
			 </tr>
		<%
		for(membersDTO member:members){
			%>
			<tr>
			    <td><%=member.getId() %></td>
			    <td><%=member.getPw() %></td>
			    <td><%=member.getFname() %></td>
			    <td><%=member.getLname() %></td>
			    <td><%=member.getEmail() %></td>
			    <td><%=member.getPhone() %></td>
			    <td><%=member.getMembership() %></td>
			    <td><%=member.getRegisteredAt() %></td>
			    <td><img class="profile-size"  src="/fitnessProject/z-member-profile/<%=member.getProfile() %>" alt="Member picture"></td>
			    <td><%=member.getClub() %></td>
			    <td><%=member.getLocation() %></td>
			    <td><%=member.getPayment() %></td>
			    <td><%=member.getDeactivate() %></td>
			    <%
			    if(member.getDeactivate()==1){
			    	%>
			    	<td><button class="activate-btn" id="<%=member.getId() %>">Activate</button></td>
			    	<%
			    } else{
			    	%>
			    	<td><button class="deactivate-btn" id="<%=member.getId() %>">Deactivate</button></td>
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
<!-- <script type="text/javascript" src="js/addons/datatables.min.js"></script> -->



</body>
</html>