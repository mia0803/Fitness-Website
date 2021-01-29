<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fitness.qboard.*" %>
<%@ page import="java.util.ArrayList" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Q & A Board</title>
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/main.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/table.css">
<link rel="stylesheet" type="text/css" href="/fitnessProject/z-css/qboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="/fitnessProject/z-images/starry_logo.png"/>
<style>

.narrow-body-box{
	text-align: center;
	background: #d4d4d4;
	width: 1200px;
	margin: auto;
	border-radius: 15px;
	color: black;
	padding-top: 20px;
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
String content = request.getParameter("search");

//======== developer customizable ========

int buttons_on_page = 5;
int posts_on_page = 5;

//========================================

BoardDAO dao = new BoardDAO();

String s_currunt_page = request.getParameter("currunt_page");
int currunt_page = 1;
if(s_currunt_page != null){
	currunt_page = Integer.parseUnsignedInt(s_currunt_page);
}

int start = (currunt_page-1)*posts_on_page+1;
int end = currunt_page*posts_on_page;
int total_posts = 0;

if(content != null){
	total_posts = dao.getCount(content);
} else{
	total_posts = dao.getCount();
}

int total_page = 1;
if(total_posts>posts_on_page){
	if(total_posts%posts_on_page==0){
		total_page = total_posts/posts_on_page;
	}else{
		total_page = total_posts/posts_on_page+1;
	}
}

int totalBtnBox = 1;
if(total_page>buttons_on_page){
	if(total_page%buttons_on_page==0){
		totalBtnBox = total_page/buttons_on_page;
	} else{
		totalBtnBox = total_page/buttons_on_page+1;
	}
}

int currentBtnBox = 1;
if(currunt_page>buttons_on_page){
	if(currunt_page%buttons_on_page==0){
		currentBtnBox = currunt_page/buttons_on_page;
	} else{
		currentBtnBox = currunt_page/buttons_on_page+1;
	}
}



ArrayList<BoardDTO> posts = null;
if(content!=null){
	posts = dao.getPosts(start, end, content);
} else{
	posts = dao.getPosts(start, end);
}

CommentDAO cdao = new CommentDAO();

%>

<div class="main-body" >

<%
if(email!=null){
	%><jsp:include page="/a-homepage/userTopMenuBar.jsp" /><%
} else{
	%><jsp:include page="/a-homepage/topMenuBar.jsp" /><%
}
%>


	<div class="narrow-body-box">
	
		<h1>Q&A Board</h1>
		<%
		if("admin".equals(user)){%>
		<button class="go-to-write-post" id="<%=email %>">Write Announcement</button> <br/>
		<%}%>
		
		<table class="qboard-table">
			<tr>
				<th class="number">No.</th>
				<th class="title">Title</th>
				<th class="writer">Writer</th>
				<th class="date">Date</th>
				<th class="view">View</th>
			</tr>
			<%
			for(BoardDTO post:posts){
				int post_comment = cdao.getCommentCount(post.getId());
				if(post.getAnnouncement()==1){
			%>
			<tr class="post_detail" id="<%=post.getId() %>">
				<td><%=post.getId() %></td>
				<td><i class="fa fa-bullhorn" aria-hidden="true"></i> <%=post.getTitle() %> [<%=post_comment %>]</td>
				<td><%=post.getEmail() %></td>
				<td><%=post.getPost_date() %></td>
				<td><%=post.getPost_view() %></td>
			</tr> 
			<%
			} else{
			%>
			<tr class="post_detail" id="<%=post.getId() %>">
				<td><%=post.getId() %></td>
				<td><%=post.getTitle() %> [<%=post_comment %>]</td>
				<td><%=post.getEmail() %></td>
				<td><%=post.getPost_date() %></td>
				<td><%=post.getPost_view() %></td>
			</tr>
			<%}}%>
		</table> <br/>
		<%
		if("member".equals(user)){%>
			<button class="go-to-write-post" id="<%=email %>">Write Post</button>  <br/><br/><%
		}
		
		
		if(currentBtnBox==1){
			%><a class="not-clickable">← prev</a><%
		} else{
			%><a class="pagination" id="<%=(currentBtnBox-1)*buttons_on_page %>" data-content="<%=content %>">← prev</a><%
		}
		
		if(currentBtnBox==totalBtnBox){
			for(int i = (currentBtnBox-1)*buttons_on_page+1; i < total_page+1; i++ ){
				if(i==currunt_page){
					%><a class="pagination selected" id="<%=i %>" data-content="<%=content %>"><%=i %></a><%
				} else{
					%><a class="pagination" id="<%=i %>" data-content="<%=content %>"><%=i %></a><%
				}
			}
		} else if(currentBtnBox<totalBtnBox){
			for(int i = (currentBtnBox-1)*buttons_on_page+1; i < (currentBtnBox-1)*buttons_on_page+1+buttons_on_page; i++ ){
				if(i==currunt_page){
					%><a class="pagination selected" id="<%=i %>" data-content="<%=content %>"><%=i %></a><%
				} else{
					%><a class="pagination" id="<%=i %>" data-content="<%=content %>"><%=i %></a><%
				}
			}
		}
		
		
		if(currentBtnBox==totalBtnBox){
			%><a class="not-clickable">next →</a><%
		} else{
			%><a class="pagination" id="<%=currentBtnBox*buttons_on_page+1 %>" data-content="<%=content %>">next →</a><%
		}
		
		
		
		%>
		
		
		<br/><br/>
		<i class="fa fa-search"></i>&nbsp;&nbsp;
		<%
		if(content!=null){
			%>
			<input type="text" class="search-box" id="boardInput" value="<%=content%>">
			<%
		} else{
			%>
			<input type="text" class="search-box" id="boardInput" placeholder="Search relative topics..">
			<%
		}%>
		<button class="search-btn">Search</button>
	</div>
</div>






<script src="/fitnessProject/z-js/jquery-3.2.1.min.js"></script>
<script src="/fitnessProject/z-js/main.js"></script>
<script src="/fitnessProject/z-js/qboard.js"></script>

</body>
</html>