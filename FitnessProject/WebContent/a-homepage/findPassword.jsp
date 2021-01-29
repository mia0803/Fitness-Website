<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Reset password</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">

<style>
html,body{
background: #e0e0e0;
color: black;
}
</style>

</head>

<body>

<form action="findPasswordPro.jsp" method="post">
	<div class="horz-center-box">
		<div>
			<h1>Reset Password</h1>
		</div>
		<div>
			Email: <input type="text" name="email" required><br/>
		</div>
		<div>
			Phone: <input type="text" name="phone" required><br/>
		</div>
		<div>
			<input type="submit" name="Submit">
		</div>
	</div>
</form>
</body>
</html>