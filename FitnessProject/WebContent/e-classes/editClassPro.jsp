<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.clubs.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Edit Class</title>
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
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.fitness.clubs.ClassDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%

int c_id = Integer.parseInt(request.getParameter("c_id"));

dto.setC_id(c_id);

ClassDAO dao = new ClassDAO();
dao.updateClass(dto);

%>



<script>
alert("Updated!");
window.location="editClass.jsp?class_id="+ "<%= dto.getC_id()%>";
</script>

</body>
</html>