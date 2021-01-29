<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.payment.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Refund process</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
</head>
<body>

<%

String sid = request.getParameter("id");
int transaction_id = Integer.parseInt(sid);

transactionDAO dao = new transactionDAO();
dao.refund(transaction_id);


%>


<div class="horz-center-box">
	<h1>Selected transaction has refunded.</h1><br/><br/>
	<button class="close-btn">Close</button>
</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>