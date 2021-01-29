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

.main-img2{
	width: 100%;
	
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



	<div class="container">
		<b class="uppercase left">Studio Pilates</b>
		<img class="main-img2" alt="Starry personal training img" src="/fitnessProject/z-images/pilates2.jpg">
	</div>
	
	<div class="narrow-body-box">
		<div class="row-align bottom-margin">
			<div class="left-box"><b class="uppercase">About pilates at Starry fitness</b></div>
			<div class="right-box">
				<h3>Small Moves. Big Changes.</h3>
				<p>At its core, Studio Pilates tightens what’s loose and loosens what’s tight. By working evenly with subtle moves, no muscles are ever over or under–trained, creating balance in the body.</p>
			</div>
		</div>
		
	</div>





</div>




<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/homepage.js"></script>





</body>
</html>