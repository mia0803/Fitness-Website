<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fitness.payment.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update process...</title>
</head>
<body>

<jsp:useBean id="dto" class="com.fitness.payment.paymentDTO" ></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
paymentDAO dao = new paymentDAO(); 
dao.update(dto);


%>

<script>
alert("Updated");
window.location = "editPaymentInfo.jsp";
</script>


</body>
</html>