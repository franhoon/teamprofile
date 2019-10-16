<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>user_login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    
    
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
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
	<link rel="stylesheet" href="../css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="../css/flexslider.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="../css/style.css">

	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
    <script src="js/main.js"></script>

</head>

<body>
<%@ include file="../include/header.jsp" %>

<%
	String a=request.getParameter("user_id");
	System.out.println(a);
	sql="select * from member_user where user_id=?";
	ps=cn.prepareStatement(sql);
	ps.setString(1, a);
	rs=ps.executeQuery();
	if(rs.next()==true){
		user_id=rs.getString("user_id");
		user_pw=rs.getString("user_pw");
		user_name=rs.getString("user_name");
		m_birth=rs.getString("birth");
		m_hobby=rs.getString("hobby");
		m_gender=rs.getString("gender");
		m_email=rs.getString("email");
		m_phone=rs.getString("phone");
		System.out.println("user_update 개인 데이터 수정창");
	}
%>

    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container1">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Hi, <%=user_id%></h2>
                        <form method="post" class="register-form" id="kform">
                        	<div class="form-group">
                               <label for="your_id"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id"  value="<%=user_id%>" readonly/>
                            </div>
                            <div class="form-group">
                                <label for="your_pw"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pw" id="pw" placeholder="Password"/>
                                <span id="pw_s" ></span>
                            </div>
                            <div class="form-group">
                                <label for="your_pw_ck"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pw_ck" id="pw_ck" placeholder="Password check"/>
                                <span id="pw_ck_s" ></span>
                            </div>
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-star"></i></label>
                                <input type="text" name="name" id="name" placeholder="your name" value="<%=user_name%>"/>
                                <span id="name_s" ></span>
                            </div>
                            <div class="form-group">
                                <label for="your_gender"><i class="zmdi zmdi-male-female"></i></label>
                                <input type="text" name="gender" id="gender" value="<%=m_gender%>" disabled/>
                            </div>
                            <div class="form-group">
                                <label for="your_birth"><i class="zmdi zmdi-cake"></i></label>
                                <input type="text" name="birth" id="birth" placeholder="ex)20190101" value="<%=m_birth%>"/>
                                <span id="birth_s"></span>
                            </div>
                            <div class="form-group">
                                <label for="your_hobby"><i class="zmdi zmdi-coffee"></i></label>
                                <input type="text" name="hobby" id="hobby" placeholder="hobby" value="<%=m_hobby%>"/>
                            </div>
                            <div class="form-group">
                                <label for="your_email"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="email" id="email" placeholder="ex)asd@gmail.com" value="<%=m_email%>"/>
                            </div>
                            <div class="form-group">
                                <label for="your_phone"><i class="zmdi zmdi-phone"></i></label>
                                <input type="text" name="phone" id="phone" placeholder="ex)065-1614-1658" value="<%=m_phone%>"/>
                            </div>
                            <div class="form-group form-button">
                            &nbsp;&nbsp;
                                <input type="button" name="modify" id="modify" class="form-submit"  value="modify" onclick="upchk();"/>
                            &nbsp;&nbsp;
                                <input type="button" name="cancle" id="cancle" class="form-submit" value="cancle" onclick="ucl();"/>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>

    </div>
<%@ include file="../include/footer.jsp" %>
    <!-- JS -->
    
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>