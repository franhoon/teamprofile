<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />

	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	
</head>
<body>
<nav class="fh5co-nav" role="navigation">
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div id="fh5co-logo"><a href="/MiniWeb/index.jsp">CJSK.<span>.</span></a></div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li class="active"><a href="/MiniWeb/index.jsp">Home</a></li>
							<li><a href="/MiniWeb/portfolio.jsp">Profile</a></li>
							<li class="has-dropdown">
								<a href="/MiniWeb/board/board_list.jsp">Board</a>
								<ul class="dropdown">
									<li><a href="/MiniWeb/board/boardWrite.jsp">write</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
								</ul>
							</li>
							<li><a href="/MiniWeb/about.jsp">About us</a></li>
							<%if(session.getAttribute("lion") == null){ %>
							<li><a href="/MiniWeb/user/user_join.jsp">Join</a></li>
							<li class="btn-cta"><a href="/MiniWeb/user/user_login.jsp"><span>Login</span></a></li>
							<%}else if(((String)session.getAttribute("lion")).equals("admin114")){ %>
							<li><a href="/MiniWeb/user/logout.jsp">LogOut</a></li>
							<li class="btn-cta"><a href="/MiniWeb/admin/demo1/tables/check.jsp"><span>Manage</span></a></li>
							<li>환영합니다! <%=(String)session.getAttribute("lion") %>님</li>
							<%} else{ %>
							<li><a href="/MiniWeb/user/logout.jsp">LogOut</a></li>
							<li class="btn-cta"><a href="/MiniWeb/user/myPage.jsp"><span>Mypage</span></a></li>
							<li><font size="1pt" >환영합니다~</font> <font size="2pt" color="#8142DB"><%=(String)session.getAttribute("lion") %>님!</font></li>
							<%} %>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</nav>
</body>
</html>