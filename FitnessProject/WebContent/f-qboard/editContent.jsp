<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.qboard.*" %>    
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Read post</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/qboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

.narrow-body-box{
	background: #d4d4d4;
	width: 1000px;
	margin: auto;
	margin-top:10px;
	border-radius: 15px;
	color: black;
	padding: 20px;
	padding-bottom:40px;
	margin-bottom:20px;
}

</style>

</head>
<body>

<%

request.setCharacterEncoding("UTF-8");

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
String email = (String)session.getAttribute("email");
String user = (String)session.getAttribute("user");


String post_sid = request.getParameter("post_id");
int post_id=0;
if(post_sid != null){
	post_id = Integer.parseInt(post_sid);
} else{
	response.sendRedirect("qBoard.jsp");
	return;
}

BoardDAO dao = new BoardDAO();
dao.upView(post_id);

BoardDTO post = dao.getPost(post_id);

CommentDAO cdao = new CommentDAO();
ArrayList<CommentDTO> comments = cdao.getComment(post_id);

%>

<%
if(email!=null){
	%><jsp:include page="/a-homepage/userTopMenuBar.jsp" /><%
} else{
	%><jsp:include page="/a-homepage/topMenuBar.jsp" /><%
}
%>

<div class="main-body" >
	<div class="narrow-body-box align-center">

		<div class="post-content-box">
			<button class="go-to-qboard">Main Q & A board</button>
			<div class="row-align">
				<div class="post-title">
					<p>Post Title:</p>
					<p>Writer: </p>
					<p>Content:</p>
				</div>
				
				<div class="post-contents">
				<%
				if(post.getEmail().equals(email)){%>
					<form action="updatePostPro.jsp" method="post">
						<input name="title" type="text" value="<%=post.getTitle() %>"> <br/><br/>
						<input name="email" type="text" value="<%=post.getEmail() %>" readonly><br/><br/>
						<textarea name="content"><%=post.getContent() %></textarea><br/><br/>
						<div class="btn-box">
							<input class="post-btn" type="submit" value="Update" >
							<input class="post-btn post-delete-btn" id="<%=post.getId() %>" type="button" value="Delete">
						</div>
						<input name="id" type="hidden" value="<%=post.getId() %>">
					</form>
					
					<%
				} else if("admin".equals(user)){%>
					<input type="text" value="<%=post.getTitle() %>" readonly> <br/><br/>
					<input type="text" value="<%=post.getEmail() %>" readonly><br/><br/>
					<textarea class="content lock" ><%=post.getContent() %></textarea><br/>
					<div class="btn-box-some-padding">
						<input class="post-btn post-delete-btn" id="<%=post.getId() %>" type="button" value="Delete">
					</div>
				<%} else{%>
					<input type="text" value="<%=post.getTitle() %>" readonly> <br/><br/>
					<input type="text" value="<%=post.getEmail() %>" readonly><br/><br/>
					<textarea class="post-content-box lock" ><%=post.getContent() %></textarea><br/>
				<%}%>
				</div>
			</div>
		</div>
			
			
		<!-- writing comment area -->
		<div class="comment-box">
			<div class="row-align write-comment">
				<div class="left-box1">
					<h4><i class="fa fa-comment fa-flip-horizontal" aria-hidden="true"></i> Comment &nbsp; &nbsp;</h4>
					<%
					if(email!=null){%>
					<span class="length"><%=email %> | &nbsp;</span> 
					<%}%>
				</div>
				<div class="right-box1 relative">
					<div class="absolute bottom">
					<%
					if(email!=null){%>
						<form class="comment-length-check" action="commentPro.jsp?action=comment" method="post" >
							<input class="comment-content" name="post_comment"  type="text" placeholder="Comment..."> 
							<input name="post_id" type="hidden" value="<%=post_id %>">
							<input name="email" type="hidden" value="<%=email %>">
							<input name="original_comment_id" type="hidden" value="0">
							<input type="submit" value="Send">
						</form>
						<%}%>
					</div>
				</div>
			</div>
			
			<%
			for(CommentDTO comment: comments){
				if(comment.getReply()==0){
			//===== read comment
			%>
			<div class="comment-history-box">
				<div class="comment-box2">
					<div class="left-box">
						<span class="bold"><%=comment.getEmail() %></span> <span>| <%=comment.getComment_date() %></span>
					</div>
					
					<div class="right-box">
						<div class="comment-disiplay-box">
							<div class="comment-display-length"><%=comment.getPost_comment() %> </div>
							<div>
								<%
								if(email!=null){%>
								<button class="reply-btn" id="<%=comment.getId() %>">Reply</button>&nbsp;
								<%}
								if(comment.getEmail().equals(email) || "admin".equals(user)){
								%>
								<button class="delete-comment" id="<%=comment.getId() %>" name="<%=comment.getPost_id() %>">Delete</button>
								<%}%>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- writing reply -->
			<div class="reply-box <%=comment.getId() %>">
				<div class="row-align-center">
					<div class="reply-left-box1 ">
						<p class="row-align-center">
							<i class="fa fa-reply-all fa-rotate-180" aria-hidden="true"></i>
							<span class="bold"> &nbsp; <%=email %></span> &nbsp; | &nbsp;
						</p>
						
						
					</div>
					
					<div>
						<div>
							<form class="comment-length-check" action="commentPro.jsp?action=reply" method="post" >
								<input class="comment-content" name="post_comment"  type="text" placeholder="Reply..."> 
								<input name="post_id" type="hidden" value="<%=post_id %>">
								<input name="email" type="hidden" value="<%=email %>">
								<input name="original_comment_id" type="hidden" value="<%=comment.getId() %>">
								<input type="submit" value="Send">
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
				} else if(comment.getReply()==1){
			//====== read reply
					%>
			<div class="reply-history-box">
				<div class="comment-box2">
					<div class="reply-left-box">
						<i class="fa fa-reply fa-rotate-180" aria-hidden="true"></i>
						<span class="bold"><%=comment.getEmail() %></span> <span>| <%=comment.getComment_date() %></span>
					</div>
					
					<div class="reply-right-box relative row-align">
						<div class="comment-display-length"><%=comment.getPost_comment() %> &nbsp; </div>
						<div>
							<% 
							if(comment.getEmail().equals(email) || "admin".equals(user)){%>
							<button class="delete-comment" id="<%=comment.getId() %>" name="<%=comment.getPost_id() %>">Delete</button>
							<%}%>
						</div>
					</div>
				</div>
			</div>
					<% }} %>
		</div>
		
	</div>
</div>




<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/qboard.js"></script>


</body>
</html>


