<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>
html, body{width:100%; height: 100%}
</style>


</head>
<body id="my-info">

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
if(!"member".equals(user)){
	%>
	<script>
	alert("Member only accepted");
	window.location="/fitnessProject/a-homepage/main.jsp";
	</script>
	<%
}

int mem_id = Integer.parseInt(sessionId);

membersDAO dao = new membersDAO();
membersDTO member = dao.getMember(mem_id);


%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="memberMenuBar.jsp" />
	
	
	<div class="body-content">
		
		<form action="editMemberPro.jsp" method="post" enctype="multipart/form-data">
			<div class="horz-center-box">
				<div>
					<h1>My Profile</h1>
				</div>
				<div>
					Picture <br/>
					<img class="img-size" alt="member image" src="/fitnessProject/z-member-profile/<%=member.getProfile() %>">
				</div>
				<div>
					Update Image: &nbsp; 
					<input type="file" name="img">
				</div>
				<div>
					Email: <input type="text" name="email" value="<%=member.getEmail() %>" readonly><br/>
				</div>
				<div>
					Password: <input type="text" name="pw" value="<%=member.getPw() %>"><br/>
				</div>
				<div>
					First name: <input type="text" name="fname" value="<%=member.getFname() %>"><br/>
				</div>
				<div>
					Last name: <input type="text" name="lname" value="<%=member.getLname() %>"><br/>
				</div>
				<div>
					Phone: <input type="text" name="phone" value="<%=member.getPhone() %>"><br/>
				</div>
				<div>
					Membership: <input type="text" name="membership" value="<%=member.getMembership() %>" readonly><br/>
				</div>
				<div>
					Registered Date: <input type="text" name="registredAt" value="<%=member.getRegisteredAt() %>" readonly><br/>
				</div>
				<div>
					Club: <input type="text" name="club" value="<%=member.getClub() %>" readonly><br/>
				</div>
				<div>
					Location: <input type="text" name="location" value="<%=member.getLocation() %>" readonly><br/>
				</div>
				<div>
					Payment: <input type="text" name="payment" value="<%=member.getPayment() %>" readonly><br/>
				</div>
				<div>
					<input type="hidden" name="id" value="<%=member.getId()%>">
					<input type="submit" class="member-update-btn" name="update" value="Update">
					<input type="button" class="change-membership-btn" id="<%=member.getId()%>" value="Change membership">
					<input type="button" class="deactivate" id="<%=member.getId()%>" value="Close account">
				</div>
			</div>
		</form>
		

	</div>
	
</div>

<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/member.board.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>