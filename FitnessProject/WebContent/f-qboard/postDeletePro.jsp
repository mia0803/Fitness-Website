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


String post_sid = request.getParameter("post_id");

qboardDAO dao = new qboardDAO();

if(post_sid!=null){
	int post_id = Integer.parseInt(post_sid);
	dao.deletePost(post_id);
	
	%>
	<script>
	alert("Post has deleted!");
	window.location="qBoard.jsp";
	</script>
	
	<%
}



%>


</body>
</html>