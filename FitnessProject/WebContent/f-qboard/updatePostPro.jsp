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

<jsp:useBean id="dto" class="com.fitness.qboard.qboardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%

String sid = request.getParameter("id");
int id = 0;
if(sid!= null){
	id = Integer.parseInt(sid);
}

dto.setId(id);

qboardDAO dao = new qboardDAO();
dao.updatePost(dto);

%>
<script>
alert("Updated!");
window.location="editContent.jsp?post_id=" + <%=dto.getId()%>;
</script>
<%

%>




</body>
</html>