<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.payment.*" %>
<%@ page import="com.fitness.members.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Registration on Process</title>
</head>
<body>

<jsp:useBean id="pdto" class="com.fitness.payment.PaymentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="pdto"/>

<%
// no duplicate data check!!!!!

// changing membership parameters
String state = (String)session.getAttribute("state");
String sessionId = (String)session.getAttribute("mem_id");

PaymentDAO pdao = new PaymentDAO();

MembersDAO mdao = new MembersDAO();

TransactionDAO tdao = new TransactionDAO();
TransactionDTO tdto = new TransactionDTO(); //empty



String str = null;
int membership_payment = 0;
int final_payment = 0;
int memberId = 0;
String membership = null;
String location = null;
String club = null;
String fname = null;
String lname = null;
int payment_info_id = 0;

Calendar cal = Calendar.getInstance();
String month = new SimpleDateFormat("MMMM").format(cal.getTime());


if(state == null){
	// new member payment
	pdao.addInfo(pdto); //add payment information to payment_info table
	
	String member_id = request.getParameter("member_id");
	membership = request.getParameter("membership");
	String final_payment1 = request.getParameter("final_payment");
	int mem_id = Integer.parseInt(member_id);
	
	
	payment_info_id = pdao.getId(mem_id);
	
	MembersDTO mdto = mdao.getMember(mem_id);
	

	tdto.setMember_id(mdto.getId());
	tdto.setPayment_info_id(payment_info_id);
	tdto.setMembership(membership);
	tdto.setAmount("$" + final_payment1 +".00");
	tdto.setTitle(month + " payment");
	tdto.setInitiation_fee(1);

	tdao.addTransaction(tdto); // add to transaction table
	
	%>
	<script type="text/javascript">
		alert("Payment success!");
		window.location="main.jsp";
	</script>
	<%
	
	
} else if(sessionId != null && state != null){
	// membership change
	
	int mem_id = Integer.parseInt(sessionId);
	
	MembersDTO mdto = mdao.getMember(mem_id);
	
	str = (String)session.getAttribute("payment");
	membership_payment = Integer.parseInt(str.substring(1, 4));
	final_payment = membership_payment + 100;
	memberId = mdto.getId();
	membership = (String)session.getAttribute("membership");
	location = (String)session.getAttribute("location");
	club = (String)session.getAttribute("club");
	fname = mdto.getFname();
	lname = mdto.getLname();
	
	session.removeAttribute("payment");
	session.removeAttribute("membership");
	session.removeAttribute("location");
	session.removeAttribute("club");
	
	
	
	// add new transaction
	tdto.setMember_id(memberId);
	tdto.setPayment_info_id(payment_info_id);
	tdto.setMembership(membership);
	tdto.setAmount("$" + final_payment+".00");
	tdto.setTitle(month + " payment");
	tdto.setInitiation_fee(0);
	
	tdao.addTransaction(tdto);
	
	
	// change membership in members table
	mdto.setMembership(membership);
	mdto.setClub(club);
	mdto.setLocation(location);
	mdto.setPayment("$" + membership_payment+".00");
	
	mdao.updateMemberMembership(mdto);
	
	%>
	<script type="text/javascript">
		alert("Changed membership successfully.");
		window.location="/fitnessProject/b-my-account/member-board/memberBoard.jsp";
	</script>
	<%
	
} else{
	%>
	<script type="text/javascript">
		alert("Error!");
		window.location="main.jsp";
	</script>
	<%
}




%>





</body>
</html>