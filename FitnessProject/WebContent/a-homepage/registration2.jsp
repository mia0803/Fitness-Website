<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Registration Step 2</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/register.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>
<body>
<%

String club = request.getParameter("club");
String location = request.getParameter("location");



%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<form action="registration3.jsp" method="post">
	<div class="left-leaning">
		<div class="narrow-high-box">
			<h1>Choose your membership</h1>
		</div>
		
		<div class="big-box">
			<div class="short-box">
				<input type="radio" name="membership" value="one">
			</div>
			<div class="long-box">
				<p class="header">Access to <%=club%></p>
				<p class="description">Perfect for your neighborhood. Single access to Equinox <%=club%>, including all classes and amenities.
			</div>
			<div class="small-box">
				<input type="text" class="header like-p" name="monthly-payment1" value="$190.00/mo" readonly>
				<p class="small-letter">12-mo commitment</p>
			</div>
		</div>
		
		
		<div class="big-box">
			<div class="short-box">
				<input type="radio" name="membership" value="multiple">
			</div>
			<div class="long-box">
				<p class="header">Access to All <%=location %> clubs</p> 
				<p class="description">Access to all clubs in <%=location %>, including all classes and amenities.
			</div>
			<div class="small-box">
				<input type="text" class="header like-p" name="monthly-payment2" value="$225.00/mo" readonly>
				<p class="small-letter">12-mo commitment</p>
			</div>
		</div>
		
		<div class="thick-top-margin row-align">
			<input class="big-next-btn go-back" type=text value="Back" readonly> &nbsp; &nbsp;
			<input class="big-next-btn goto-reg3" type="submit" value="Next">
			
			<input type="hidden" name="club" value="<%=club%>">
			<input type="hidden" name="location" value="<%=location%>">
		</div>
	</div>
</form>





<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/homepage.js"></script>

</body>
</html>