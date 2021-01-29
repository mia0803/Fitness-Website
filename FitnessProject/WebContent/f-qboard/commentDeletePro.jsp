<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.qboard.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%


String comment_sid = request.getParameter("comment_id");
String post_id = request.getParameter("post_id");

CommentDAO dao = new CommentDAO();

if(comment_sid!=null){
	int comment_id = Integer.parseInt(comment_sid);
	dao.delete(comment_id);
	
	response.sendRedirect("editContent.jsp?post_id="+post_id);
	return;
}



%>








</body>
</html>