<% String user1 = (String)session.getAttribute("user"); %>
<div class="banner">
	<div class="title">
		<b class="go-to-main">Starry Fitness</b>
	</div>
	<div class="banner-box">
		<a class="go-to-location">Clubs</a> | 
		<a class="go-to-classpage">Classes</a> | 
		<a class="go-to-pt">Personal Training</a> | 
		<a class="go-to-pilates">Pilates</a> | 
		<a class="go-to-qboard">Q & A</a> | 
		<i class="fa fa-user-circle-o" aria-hidden="true"></i>
		<a class="to-my-account" id="<%=user1%>">My Account</a>
	</div>
</div>