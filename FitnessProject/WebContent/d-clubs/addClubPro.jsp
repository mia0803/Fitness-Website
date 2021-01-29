<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Add a Club</title>
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

int size = 1024*1024*10;  // 10mb, to set maximum size
//MultipartRequest(request, src, size, enc, dp);
String src = getServletContext().getRealPath("z-temp-img");
MultipartRequest mr = new MultipartRequest(request, src, size, "UTF-8", new DefaultFileRenamePolicy());




ClubsDAO dao = new ClubsDAO();
boolean result = dao.checkClub(mr.getParameter("name"));

if(!result){
	
	ClubsDTO dto = new ClubsDTO();
	dto.setName(mr.getParameter("name"));
	dto.setAddress(mr.getParameter("address"));
	dto.setPhone(mr.getParameter("phone"));
	dto.setLocation(mr.getParameter("location"));
	dto.setDesc(mr.getParameter("desc"));
	
	String img = mr.getFilesystemName("img");

	java.io.File f = null;
	java.io.FileInputStream fis = null;

	if(img != null){
		f = mr.getFile("img");
		fis = new java.io.FileInputStream(f);
	}
	
	dao.addClub(dto, fis, f);
	
	// added message
	// close button
	%>
	<div class="horz-center-box">
		<h1>New Club Added!</h1><br/><br/>
		<button class="close-btn">Close</button>
	</div>
	<%
} else{
	// already exist!
	// go back to addlocation jsp page
	%>
	<script>
		alert("Submitted club title already exist!");
		window.location="addClub.jsp";
	</script>
	<%
}

%>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>