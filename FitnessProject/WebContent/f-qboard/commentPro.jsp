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

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" class="com.fitness.qboard.commentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%

String post_sid = request.getParameter("post_id");
int post_id = Integer.parseInt(post_sid);
dto.setPost_id(post_id);

String action = request.getParameter("action");

commentDAO dao = new commentDAO();

if(action.equals("comment")){
	dao.addComment(dto);
	response.sendRedirect("editContent.jsp?post_id="+post_id);
	return;
	
} else if(action.equals("reply")){
	String original_comment_sid = request.getParameter("original_comment_id");
	int original_comment_id = Integer.parseInt(original_comment_sid);
	dto.setOriginal_comment_id(original_comment_id);
	
	dao.addReply(dto);
	response.sendRedirect("editContent.jsp?post_id="+post_id);
	return;
}




%>




</body>
</html>