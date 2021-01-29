<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%

session.invalidate();


Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(Cookie c: cookies){
		String name = c.getName();
		if(name.equals("c_email")){
			c.setMaxAge(0);
			response.addCookie(c);  // cookie expires
		}
		if(name.equals("c_pw")){
			c.setMaxAge(0);
			response.addCookie(c);  // cookie expires
		}
		if(name.equals("c_remember")){
			c.setMaxAge(0);
			response.addCookie(c);  // cookie expires
		}
	}
}


%>

<script>
alert('Logged out!');
window.location="/fitnessProject/a-homepage/main.jsp";
</script>

</body>
</html>