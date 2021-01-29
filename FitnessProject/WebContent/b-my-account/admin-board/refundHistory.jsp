<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.payment.*" %>
<%@ page import="java.util.ArrayList" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Refund record</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

table{
width: auto;
margin: 20px;
}

</style>

</head>
<body id="refund-history">

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

refundDAO dao = new refundDAO();
ArrayList<refundDTO> refund_records = dao.getRefundHistory();

%>


<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="menuBar.jsp" />

	<div class="body-content">
		<b class="some-margin">Refund Record Table</b>
		<br/>
		<table>
			<tr>
			    <th>Refund ID</th>
			    <th>Transaction ID</th>
			    <th>Member ID</th>
			    <th>Payment Info ID</th>
			    <th>Title</th>
			    <th>Amount</th>
			    <th>Refund Date</th>
			 </tr>
		<%
		for(refundDTO record:refund_records){
			%>
			<tr>
			    <td><%=record.getId() %></td>
			    <td><%=record.getTransaction_id() %></td>
			    <td><%=record.getMember_id() %></td>
			    <td><%=record.getPayment_info_id() %></td>
			    <td><%=record.getTitle() %></td>
			    <td><%=record.getAmount() %></td>
			    <td><%=record.getRefund_date() %></td>
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