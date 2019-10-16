<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
    
<%!
	Connection cn; //  cn필드  db서버정보, 명령어생성할떄 참조
	Statement st; // st =cn.createstatement();
	PreparedStatement ps; //미리  sql해석하고 준비하는 명령어 pst = cn.prepareStatement("쿼리문");
	ResultSet rs; // rs = st.executeQuery("select~"); 조회한 결과를 rs에 기억

	String sql;
	int total;
	
	String user_id, user_pw, user_name, m_birth, m_hobby, m_gender, m_email, m_phone; 
	String w_title, w_content, w_file, w_num;
	int w_hit, replynum;
	boolean remember_me;
	String remember_id;
	
	boolean flag;

%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
   <meta name="description" content="html5">
   <meta name="author" content="author">
   <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>ssi</title>

</head>	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Air &mdash; Free Website Template, Free HTML5 Template by freehtml5.co</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
<body>

<%
try{
	//순서1 . 오라클드라이브 라이브러리 로드, database마다 기술하는 방법 달라요
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//순서2. Database서버정보, 계정 id, 비밀번호를 cn에게 기억시켜, 나중에 명령어 생성
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String dbuser = "system";
	String dbpwd = "oracle";
	cn =  DriverManager.getConnection(url, dbuser, dbpwd);
	
}catch(Exception e){
	e.getMessage();
}
%>

</body>
</html>