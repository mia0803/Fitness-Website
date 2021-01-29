<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.locationDAO" %>
<%@ page import="com.fitness.clubs.locationDTO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update Page</title>
<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>
</head>


<%

int size = 1024*1024*10;  // 10mb, to set maximum size
//MultipartRequest(request, src, size, enc, dp);
String src = getServletContext().getRealPath("z-temp-img");
MultipartRequest mr = new MultipartRequest(request, src, size, "UTF-8", new DefaultFileRenamePolicy());

locationDAO dao = new locationDAO();
locationDTO dto = new locationDTO();
dto.setLocation_id(Integer.parseInt(mr.getParameter("id")));
dto.setLocation(mr.getParameter("location"));
dto.setLoc_desc(mr.getParameter("desc"));

String img = mr.getFilesystemName("img");

java.io.File f = null;
java.io.FileInputStream fis = null;

if(img != null){
	f = mr.getFile("img");
	fis = new java.io.FileInputStream(f);
}

dao.updateLocation(dto, fis, f);
%>



<body>

<script>
alert("Updated!");
window.location="editLocation.jsp?location="+"<%=mr.getParameter("location")%>";
</script>
</body>
</html>