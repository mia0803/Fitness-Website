<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login process</title>
</head>
<body>

<%

String email = request.getParameter("email");
String pw = request.getParameter("pw");

String remember = request.getParameter("remember");


MembersDAO dao = new MembersDAO();
MembersDTO dto = dao.checkLogin(email, pw);

int mem_id = dto.getId();

if(mem_id != 0){
	if(remember != null){
		// make cookies!
		Cookie cid = new Cookie("c_email", email);
		Cookie cpw = new Cookie("c_pw", pw);
		Cookie cremember = new Cookie("c_remember", remember);
		
		cid.setMaxAge(60*60*24);
		cpw.setMaxAge(60*60*24);
		cremember.setMaxAge(60*60*24);
		
		response.addCookie(cid);
		response.addCookie(cpw);
		response.addCookie(cremember);
	}
	
	// make sessions!
	String mem_sid = Integer.toString(mem_id);
	session.setAttribute("mem_id", mem_sid);
	
	session.setAttribute("email", email); // used in qboard
	
	String user = dao.whoIsUser(mem_id);
	session.setAttribute("user", user);
	
	boolean paid = dao.checkPayment(mem_id);
	int active = dao.checkActive(mem_id);
	
	if(user.equals("member") && paid){
		if(active==0){
			%>
			<script>
			window.location="main.jsp";
			</script>
			<%
		} else{
			dao.activateMember(mem_id);
			
			%>
			<script>
			alert('Account has activated! Welcome back!');
			window.location="main.jsp";
			</script>
			<%
		}
	} else if(user.equals("admin")){
		%>
		<script>
		alert('Admin mode');
		window.location="main.jsp";
		</script>
		<%
	} else if(user.equals("teacher")){
		%>
		<script>
		alert('Welcome teacher!');
		window.location="main.jsp";
		</script>
		<%
	}else{
		%>
		<script>
		alert('Please finish the payment first');
		window.location="registration4.jsp";
		</script>
		<%
	} 
	
	
} else {
	%>
	<script>
		alert("Wrong email or password!");
		window.history.back();
	</script>
	<%
}

%>



</body>
</html>