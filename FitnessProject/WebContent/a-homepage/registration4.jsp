<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %> 
<%@ page import="com.fitness.clubs.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Membership Payment</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/register.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/payment.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
</head>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="com.fitness.members.membersDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

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

membersDAO dao = new membersDAO();

//received 9 parameters
String str = null;
int membership_payment = 0;
int final_payment =0;
int memberId = 0;
String membership = null;
String location = null;
String club = null;
String fname = null;
String lname = null;


Calendar cal = Calendar.getInstance();
String month = new SimpleDateFormat("MMMM").format(cal.getTime());
String year = new SimpleDateFormat("YYYY").format(cal.getTime());


String id = dto.getEmail();
String sessionId = (String)session.getAttribute("mem_id");
String state = (String)session.getAttribute("state"); //for changing membership
int mem_id = 0;
if(sessionId != null){
	mem_id = Integer.parseInt(sessionId);
}
		
%>    
 

<body>



<%

if(sessionId != null && id==null){
	// member changing membership & member who pays later
	membersDTO dto1 = dao.getMember(mem_id);
	str = dto1.getPayment();
	membership_payment = Integer.parseInt(str.substring(1, 4));
	final_payment = membership_payment + 100;
	memberId = dto1.getId();
	membership = dto1.getMembership();
	location = dto1.getLocation();
	club = dto1.getClub();
	fname = dto1.getFname();
	lname = dto1.getLname();
	
}  else if(sessionId==null && id!=null){
	// new member following payment stage
	
	String email = dto.getEmail();
	String phone = dto.getPhone();
	boolean result = dao.checkDuplicate(email, phone);
	
	if(!result){
		dao.addMember(dto);
	} else{
		
		%>
		<script>
		alert("Duplicate email or phone number!");
		window.history.back();
		</script>
		<%
		
	}
	
	%>
	<script>
	alert("You are registered!");
	</script>
	<%
	
	str = dto.getPayment();
	membership_payment = Integer.parseInt(str.substring(1, 4));
	final_payment = membership_payment + 100;
	memberId = dao.getId(dto.getEmail());
	membership = dto.getMembership();
	location = dto.getLocation();
	club = dto.getClub();
	fname = dto.getFname();
	lname = dto.getLname();
	
	
} else if(sessionId==null && id==null) {
	// block stranger
	response.sendRedirect("/fitnessProject/a-homepage/main.jsp");
	return;
}


%>


<div class="right-align">
	<button class="go-to-main">Pay later</button>
</div>
<div class="content-body">
	<div class="header">Review and pay</div>
	<div class="narrow-box">
	<%
	if("one".equals(membership)){
		%>
		<div class="row-align one">
			<div>
				<p class="bigger">Total payment today</p>
				<p class="light-grey">Membership: Access to <%=club %></p>
			</div>
			$<%=final_payment %>.00
		</div>
		<%
	} else{
		%>
		<div class="row-align multiple">
			<div>
				<p class="bigger">Total payment today</p>
				<p class="light-grey">Membership: Access to <%=location %></p>
			</div>
			$<%=final_payment %>.00
		</div>
		<%
	} %>
		<br/>
		<div class="row-align">
			<div><%=month %> payment</div>
			$<%=membership_payment %>.00
		</div>
		<div class="row-align">
			<div>Initiation fee</div>
			$100.00
		</div>
	</div>
	<br/>
	<br/>
	<p class="small">This is our best rate, for both online and in-club. You can cancel without fees for up to 7 days, no questions asked.</p>
	<br/>
	<br/>
	
	<form action="registrationPro.jsp" class="validate-checkbox" method="post">
		<div>
		
			<div class="narrow-high-box">
				<h3>Home Address</h3>
			</div>
			<div class="thick-top-margin row-align">
			
				<div class="some-margin longer">
					First Name<br/>
					<input name="fname" type="text" value="<%=fname %>">			
				</div>
				<div class="longer">
					Last Name<br/>
					<input name="lname" type="text" value="<%=lname %>">
				</div>
			</div>
			<div class="thick-top-margin">
				Country<br>
				<input name="country" type="text" value="USA" readonly>
			</div>
			<div class="thick-top-margin">
				Postal Code<br/>
				<div class="underline-box">
					<input class="short-length" name="postal" type="text" placeholder="Postal code">&nbsp;
					<button type="button" class="address-srch-box">Search</button>
				</div>	
			</div>
			<div class="thick-top-margin">
				Street Address<br>
				<input name="address" type="text" placeholder="Street address">
			</div>
			<div class="thick-top-margin">
				Floor, Apt, Suite<br>
				<input name="address2" type="text" placeholder="Floor, Apt, Suite">
			</div>
			<div class="thick-top-margin row-align">
				<div class="some-margin longer">
					City<br/>
					<input name="city" type="text" placeholder="City">
				</div>
				<div class="longer">
					State<br/>
					<input name="state" type="text" placeholder="State">	
				</div>
				
			</div>
			
		</div>
		<br/>
		<br/>
		<br/>
		
		<div>
			<div class="narrow-high-box">
				<h3>Billing Address</h3>
			</div>
			<div class="thick-top-margin">
				Name on Card<br>
				<input name="name_on_card" type="text" required="required" placeholder="Name on Card">
			</div>
			<div class="thick-top-margin">
				Credit or Debit card number<br>
				<input name="card_number" type="text" required="required" placeholder="XXXX-XXXX-XXXX-XXXX">
			</div>
			<div class="thick-top-margin">
				Expiration(MM/YY)<br>
				<input name="expiration" type="text" required="required" placeholder="(MM/YY)">
			</div>
			
			<div class="thick-top-margin row-align">
				<div class="some-margin longer">
					CVC<br/>
					<input name="cvc" type="password" required="required" placeholder="CVC">			
				</div>
				<div class="longer">
					Postal Code<br/>
					<input name="card_postal" type="text" required="required" placeholder="Postal Code">
				</div>
			</div>
		</div>
		<br/><br/><br/><br/>
		
		You will be charged $<%=final_payment %>.00 today, and $<%=membership_payment %>.00 on the 23rd of each month. 
		<br/><br/><br/><br/>
		
		<input type="checkbox" class="agree-btn agree-btn1"> 
		I agree to the Membership <a href="#">Terms & Conditions</a>
		<br/>
		
		<p><input type="checkbox" class="agree-btn agree-btn2"> I understand that the monthly dues will be $<%=final_payment %>.00 excluding taxes and will be
		transferred on the 23rd day of each month beginning <%=month %> <%=year %> on the
		credit card used for payment today.</p>
		
		<br/><br/><br/><br/>
		<div class="align-right">
			<input class="big-next-btn " type="submit" value="Pay now $<%=final_payment %>.00">
			<input type="hidden" name="member_id" value="<%=memberId %>">
			<input type="hidden" name="membership" value="<%=membership %>">
			<input type="hidden" name="final_payment" value="<%=final_payment %>">
		</div>
		
		
	</form>
		
	
	

</div>


<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/homepage.js"></script>

</body>
</html>













