<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>%>
<%@ page import="com.fitness.payment.*" %>  
<%@ page import="java.util.ArrayList" %>   
<!DOCTYPE html>
<html style="width:100%">
<head>
<meta charset="EUC-KR">
<title>Transaction info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

html, body{
width: auto;
}

table{
width: auto;
margin: 20px;
}

</style>


</head>
<body id="transactions" style="width:100%">

<%
//cookie check
Cookie cookies[] = request.getCookies();
if(cookies != null){
	for(Cookie c:cookies){
		if(c.getName().equals("c_email")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_pw")){
			c.setMaxAge(60*60*24);
		}
		if(c.getName().equals("c_remember")){
			c.setMaxAge(60*60*24);
		}
	}
}

//session check
String sessionId = (String)session.getAttribute("mem_id");
if(sessionId == null){
	response.sendRedirect("/fitnessProject/a-homepage/main.jsp");
	return;
}

String user = (String)session.getAttribute("user");
if(!"admin".equals(user)){
	%>
	<script>
	alert("Admin only accepted");
	window.location="/fitnessProject/a-homepage/main.jsp";
	</script>
	<%
}


transactionDAO dao = new transactionDAO();
ArrayList<transactionDTO> transactions = dao.getTransactions();
%>

<div class="black-banner" style="width:100%">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Transaction Information Table</b>
		<br/>
		<table>
			<tr>
			    <th>Transaction ID</th>
			    <th>Member ID</th>
			    <th>Payment info ID</th>
			    <th>Total Payment</th>
			    <th>Title</th>
			    <th>Membership</th>
			    <th>Paid Date</th>
			    <th>Initiation fee check</th>
			    <th>Refund check</th>
			    <th>Function</th>
			 </tr>
		<%
		for(transactionDTO transaction:transactions){
			%>
			<tr>
			    <td><%=transaction.getId() %></td>
			    <td><%=transaction.getMember_id() %></td>
			    <td><%=transaction.getPayment_info_id() %></td>
			    <td><%=transaction.getAmount() %></td>
			    <td><%=transaction.getTitle() %></td>
			    <td><%=transaction.getMembership() %></td>
			    <td><%=transaction.getPaid_date() %></td>
			    <td><%=transaction.getInitiation_fee() %></td>
			    <td><%=transaction.getRefund_check() %></td>
			    <%
			    int check1 = transaction.getRefund_check();
			    if(check1==1){
			    	%>
			    	<td>Refunded</td>
			    	<%
			    } else{
			    	%>
			    	<td><button class="refund-btn" id="<%=transaction.getId() %>">Refund</button></td>
			    	<%
			    }%>
			 </tr>
			<% } %>
		</table>
	</div>
</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/admin.board.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>

</body>
</html>