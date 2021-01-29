<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.fitness.members.*" %> 
<%@ page import="java.io.File" %>

 	    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Update On Process...</title>
</head>
<body>

<%

request.setCharacterEncoding("UTF-8");

int size = 1024*1024*10;  // 10mb, to set maximum size
// MultipartRequest(request, src, size, enc, dp);


String src = request.getSession().getServletContext().getRealPath("z-member-profile");

MultipartRequest mr = new MultipartRequest(request, src, size, "UTF-8", new DefaultFileRenamePolicy());  // it takes all input data.




MembersDTO dto = new MembersDTO();

dto.setId(Integer.parseInt(mr.getParameter("id")));
dto.setPw(mr.getParameter("pw"));
dto.setFname(mr.getParameter("fname"));
dto.setLname(mr.getParameter("lname"));
dto.setPhone(mr.getParameter("phone"));

String profile = mr.getFilesystemName("img");


File f = null;
String sysname = null;

if(profile != null){
	f = mr.getFile("img");
	sysname = mr.getFilesystemName("img");
}

dto.setProfile(sysname);

MembersDAO dao = new MembersDAO();
dao.updateMember(dto);


%>

<script>
alert("Updated");
window.location = "editMember.jsp";
</script>



</body>
</html>