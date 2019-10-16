<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ include file="../database/connect.jsp" %>

<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Air &mdash; Free Website Template, Free HTML5 Template by
	freehtml5.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by freehtml5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
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
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700"
	rel="stylesheet">

<link rel="stylesheet" href="./css/bootstrap-grid.css">
<link rel="stylesheet" href="./css/bootstrap-reboot.css">
<link rel="stylesheet" href="./css/bootstrap.css">

<!-- Theme style  -->
<link rel="stylesheet" href="../css/style.css">

<!-- Modernizr JS -->
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/bootstrap.min.js"></script>

<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<style type="text/css">
   #a{boder:1px solid red; width:100%; text-align:"right"}
</style>
<body>

<%
	int a = Integer.parseInt(request.getParameter("w_num"));
	
	sql = "select * from board_list where w_num=?";
	ps = cn.prepareStatement(sql);
		ps.setInt(1, a);
	rs = ps.executeQuery();	
	if(rs.next()){
		user_id = rs.getString("user_id");
		w_title = rs.getString("w_title");
		w_content = rs.getString("w_content");
		w_file = rs.getString("w_content");
		w_hit = rs.getInt("w_hit");
		replynum = rs.getInt("replynum");
	}
%>

	<div id="fh5co-blog">
		<div class="container">

			<form class="was-validated" method="post" action="boardWriteSave.jsp"
					enctype="multipart/form-data">

				<div class="form-row" style="font-size:18pt; color:#DD356E;">
					<div class="col-md-12 mb-3">
						<label for="validationServer03">Author</label> 
						<input type="text"
							class="form-control is-invalid"  name="w_id" id="validationServer03"
							placeholder="author" value="<%=user_id %>" required>
						<div class="invalid-feedback"></div>
					</div>
					<div class="col-md-12 mb-3">
						<label for="validationServer04">Title</label> 
						<input type="text"
							class="form-control is-invalid" name="title" id="validationServer04"
							placeholder="title" value="<%=w_title %>" required>
						<div class="invalid-feedback"></div>
					</div>

					<div class="col-md-12 mb-3" style="height:100%;">
						<label for="validationTextarea">Context</label>
						<textarea  class="form-control is-invalid" style="min-height:700px;";
							name="content" id="validationTextarea" placeholder="your STORIES" required><%=w_content %></textarea>
						<div class="invalid-feedback"></div>
					</div>

					<div class="custom-file col-md-12 mb-5">
					<input type="file" name="file1" class="custom-file-input"
							id="validatedCustomFile" placeholder="Choose File...." value="<%=w_file %>" required>
							<label class="custom-file-label" for="validatedCustomFile">
							
							</label> 
					<input type="hidden" name="w_num" id="w_num" value="<%=a%>">		 
					<input type="hidden" name="w_hit" id="w_hit" value="<%=w_hit%>">		 
					<input type="hidden" name="replynum" id="replynum" value="<%=replynum%>">		 
							<table style="margin-left: 950px;">
							<tr>
								<td><input class="btn btn-primary mt-5" type="submit" value="Update" onclick="location.href='board_updateSave.jsp?w_num'<%=w_num%>"></td>
								<td><input class="btn btn-primary mt-5" type="reset" value="Reset" onclick="location.href='board_update.jsp?w_num='<%=w_num%>"></td>
							</tr>
							</table>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>