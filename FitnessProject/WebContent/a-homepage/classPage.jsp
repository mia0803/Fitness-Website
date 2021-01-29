<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

.narrow-body-box{
	width: 1200px;
	margin: auto;
	margin-top:10px;
}

button{
	cursor: pointer;
}

</style>


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

//session check
String sessionId = (String)session.getAttribute("mem_id");


%>

<body>
<div class="main-body" >
<%
if(sessionId!=null){
	%><jsp:include page="/a-homepage/userTopMenuBar.jsp" /><%
} else{
	%><jsp:include page="/a-homepage/topMenuBar.jsp" /><%
}
%>


	<div class="align-center">
		<br/><br/><h1>This is the Starry Fitness</h1>
	</div>
	<br/><br/>


	<div class="narrow-body-box">
		<div class="row-align bottom-margin">
			<div class="left-box"><b class="uppercase">Only At Starry fitness</b></div>
			<div class="right-box">
				<p>Created and developed by the industry's best minds and taught by talented instructors who test your limits and inspire results. </p>
				<p>Find them in our pristine studio spaces with physical distancing measures in place to ensure the safety of our members and on demand with the Variis by Equinox app.  </p>
				<button class="big-next-btn go-to-location">Search In-Club Classes</button>
			</div>
		</div>
		<br/>
		<div class="row-align bottom-margin">
			<div class="left-box"><b class="uppercase">OUR IN-CLUB CLASSES</b></div>
			<div class="right-box">
				<p>Experience the power of the pack. We offer signature classes that can only be found at Starry—plus classes across 11 categories, including HIIT, Long + Lean, Cycling, Yoga, Running, Dance, and more. </p>
			</div>
		</div>
		<br/>
		
		
		
		<div class="row-align">
			<div class="feature-box2">
				<img class="main-body-img2" alt="Starry fitness img" src="/fitnessProject/z-images/classimg1.JPG">
				<h4>Choreo Cult™</h4>
				<p class="light-grey">Bring your best self, your best friends—and we’ll bring our best beats. Our newest signature class combines dancing and sculpting for a full-body, all-natural high.</p>
				<a>Learn More →</a>
			</div>
			<div class="feature-box2">
				<img class="main-body-img2" alt="Starry fitness img" src="/fitnessProject/z-images/classimg2.JPG">
				<h4>Master of One</h4>
				<p class="light-grey">One weight is all it takes. Delete distraction and zero in on results with a next-generation HIIT weight training class that strips your training to the core.</p>
				<a>Learn More →</a>
			</div>
		</div>
		
	</div>






</div>




<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/homepage.js"></script>




</body>
</html>