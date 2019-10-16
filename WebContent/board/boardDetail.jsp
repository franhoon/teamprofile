<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ include file="../database/connect.jsp" %>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
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

	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
  <title>Blog Post - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-post.css" rel="stylesheet">

<style type="text/css">
   #a{boder:1px solid red; width:100%; text-align:"right"}

</style>
</head>

<body>
<%!
String d_title, d_file;
int d_hit, data,  d_replynum, d_num;
String  d_user_id, wdate, d_content, d_date;

%>


<%

  data=Integer.parseInt(request.getParameter("Gidx")); // 리스트 선택된 w_num (number)

  

  
  
  
  sql="select * from board_list where w_num = ?";
  ps=cn.prepareStatement(sql);
  ps.setInt(1, data);
  rs=ps.executeQuery();
  if(rs.next()==true){
	  d_num=rs.getInt("w_num");
	  d_user_id=rs.getString("user_id");
	  d_title=rs.getString("w_title");
	  d_date=rs.getString("wdate");
	  d_hit=rs.getInt("w_hit");
	  d_file=rs.getString("w_file");
	  d_replynum=rs.getInt("replynum");
	  d_content=rs.getString("w_content");
	  d_hit++; // 조회수
  }
  
  sql="Update board_list set w_hit=? where w_num=?";
  ps=cn.prepareStatement(sql);
  ps.setInt(1,d_hit);
  ps.setInt(2,d_num);
  ps.executeUpdate();

%>

<%@include file="../include/header.jsp" %>
  <!-- Page Content -->
  <div class="container mt-5">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4"><%=d_title%></h1>

        <!-- Author -->
        <p class="lead">
          by
          <a href="#"><%=d_user_id%></a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p></p><!-- Posted on January 1, 2019 at 12:00 PM -->
<% if(((String)session.getAttribute("lion")).equals(d_user_id)){ %>
        <table style="width:100%; margin-right:0px;">
        <tr>
        	<td>Posted on &nbsp;<%=d_date%></td>
        	<td style="text-align:right;" ><a href="board_update.jsp?w_num=<%=d_num%>">[수정]</a>&nbsp;&nbsp;
        	<a href="board_delete.jsp?w_num=<%=d_num%>">[삭제]</a></td>
        </tr>     	
        </table>
<%}else if(((String)session.getAttribute("lion")).equals("admin114")){ %>
		<table style="width:100%; margin-right:0px;">
        <tr>
        	<td>Posted on &nbsp;<%=d_date%></td>
        	<td style="text-align:right;" ><a href="board_update.jsp?w_num=<%=d_num%>">[수정]</a>&nbsp;&nbsp;
        	<a href="board_delete.jsp?w_num=<%=d_num%>">[삭제]</a></td>
        </tr>     	
        </table>
<%} %>		
        <hr>
		<table style="width:100%; margin-right:0px;">
        <tr>
        	<td style="text-align:right;" ><a href="boardDetailDownload.jsp?Gidx=<%=d_file%>">file save</a></td>
		</tr>
        </table>
        <!-- Preview Image -->
        <img class="img-fluid rounded" src="../storage/<%=d_file%>" alt="">

        <hr>

        <!-- Post Content -->
        <p><%=d_content%></p>

        <hr>
        

     <jsp:include page="board_reply.jsp">
     <jsp:param value="<%=d_replynum%>" name="Rnum"/>
     <jsp:param value="<%=d_num%>" name="Gidx"/>
     </jsp:include>
    
     
	
      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Search</h5>
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
            </div>
          </div>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">Web Design</a>
                  </li>
                  <li>
                    <a href="#">HTML</a>
                  </li>
                  <li>
                    <a href="#">Freebies</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="#">JavaScript</a>
                  </li>
                  <li>
                    <a href="#">CSS</a>
                  </li>
                  <li>
                    <a href="#">Tutorials</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Side Widget</h5>
          <div class="card-body">
            You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
          </div>
        </div>

      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <%@include file="../include/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
