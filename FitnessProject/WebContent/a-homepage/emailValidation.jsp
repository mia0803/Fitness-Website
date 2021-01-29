<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.members.*" %>    


<%

String email = request.getParameter("email");

MembersDAO dao = new MembersDAO();
boolean result = dao.emailValidation(email);

String comment = null;
String s_result = String.valueOf(result);

if(result){
	// when same email exist
	comment = "! Invalid email. Please use other one.";	
} else{
	// when it's unique
	comment = "This email is available to use.";
}

%>

<%=comment %>
-
<%=s_result %>


