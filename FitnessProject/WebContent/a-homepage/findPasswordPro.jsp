<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Reset password</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">

<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>

</head>
<body>


<%

String email = request.getParameter("email");
String phone = request.getParameter("phone");

MembersDAO dao = new MembersDAO();
String pw = dao.getPw(email, phone);

if(pw!=null){
	%>
	<form action="setPasswordPro.jsp" method="post">
		<div class="horz-center-box">
			<p>Set new password:</p>
			<input type="password" name="pw" pattern="(?=.*\d)(?=.*[a-z]).{5,}" title="Must contain at least one number and lowercase letter, and at least 5 or more characters" required>
			<input type="hidden" name="email" value="<%=email %>" required>
			<div class="speech-bubble" id="message">
			  <p>Password must contain the following:</p>
			  <p >A <b>lowercase</b> letter</p>
			  <p >A <b>number</b></p>
			  <p >Minimum <b>5 characters</b></p>
			</div>
			
			<br/><br/>
			<input type="submit" value="Submit">
		</div>
		
	</form>
	
	<%
}

%>


</body>
</html>