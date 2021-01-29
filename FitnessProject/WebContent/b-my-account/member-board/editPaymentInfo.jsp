<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.payment.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Payment info</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/my-account.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>
html, body{width:100%; height: 100%}
</style>

</head>
<body id="payment-info">

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
if(!"member".equals(user)){
	%>
	<script>
	alert("Member only accepted");
	window.location="/fitnessProject/a-homepage/main.jsp";
	</script>
	<%
}

int mem_id = Integer.parseInt(sessionId);

paymentDAO dao = new paymentDAO();
paymentDTO payment_info = dao.getPaymentInfo(mem_id);


%>

<div class="black-banner">
	<h2 class="vertical-center go-to-main">Starry Fitness</h2>
</div>

<div class="body-box">
	<jsp:include page="memberMenuBar.jsp" />

	<div class="body-content">
	
		<form action="editPaymentInfoPro.jsp" method="post" >
			<div class="horz-center-box">
				
				<h2>Home address</h2>
				<div>
					First name: <input type="text" name="fname" value="<%=payment_info.getFname() %>"><br/>
				</div>
				<div>
					Last name: <input type="text" name="lname" value="<%=payment_info.getLname() %>"><br/>
				</div>
				<div>
					Country: <input type="text" name="country" value="<%=payment_info.getCountry() %>" readonly><br/>
				</div>
				<div>
					Street address: <input type="text" name="address" value="<%=payment_info.getAddress() %>" ><br/>
				</div>
				<div>
					Floor, Apt, Suite: <input type="text" name="address2" value="<%=payment_info.getAddress2() %>" ><br/>
				</div>
				<div>
					State: <input type="text" name="state" value="<%=payment_info.getState() %>" ><br/>
				</div>
				<div>
					City: <input type="text" name="city" value="<%=payment_info.getCity() %>" ><br/>
				</div>
				<div>
					Postal Code: <input type="text" name="postal" value="<%=payment_info.getCard_postal() %>" ><br/>
				</div>
				<br/><br/>
				
				<h2>Billing address</h2>
				<div>
					Name on Card: <input type="text" name="name_on_card" value="<%=payment_info.getName_on_card() %>"><br/>
				</div>
				<div>
					Credit or debit card number: <input type="text" name="card_number" value="<%=payment_info.getCard_number() %>"><br/>
				</div>
				<div>
					Expiration ( MM/YY ): <input type="text" name="expiration" value="<%=payment_info.getExpiration() %>"><br/>
				</div>
				<div>
					CVC: <input type="text" name="cvc" value="<%=payment_info.getCvc() %>"><br/>
				</div>
				<div>
					Postal Code: <input type="text" name="card_postal" value="<%=payment_info.getCard_postal() %>"><br/>
				</div>
				
				
				
				<div>
					<input type="hidden" name="id" value="<%=payment_info.getId()%>">
					<input type="submit" class="payment-update-btn" name="update" value="Update">
				</div>
			</div>
		</form>
	
	</div>
</div>







<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/member.board.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>



</body>
</html>
















