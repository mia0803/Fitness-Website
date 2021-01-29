<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.qboard.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="dto" class="com.fitness.qboard.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>


<%

String s_announcement = request.getParameter("announcement");
int announcement = Integer.parseUnsignedInt(s_announcement);
dto.setAnnouncement(announcement);

BoardDAO dao = new BoardDAO();

dao.addPost(dto);

response.sendRedirect("qBoard.jsp");

%>




</body>
</html>