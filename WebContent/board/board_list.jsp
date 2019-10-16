<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../database/connect.jsp" %>

<!DOCTYPE html>
<html> 


<head>
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

<script type="text/javascript">
   	 function changeclear() {
	  	document.myform.keyword.value="";
	  	document.myform.keyword.focus();
	 }//end
   </script>



	</head>
<body>

<%!
  String pnum;
  int pageNUM, pagecount; 
  int start, end; 
  int startpage, endpage; 
  int temp;  
  int Rnumber; 
  int Stotal;
  int Gtotal;
  String a;
  String b;
  
  //검색할때
  String sqry; 
  String skey, sval ;  
  String returnpage ;  
%> 





<div class="fh5co-loader"></div>
	
	<div id="page">
	
<%


 skey=request.getParameter("keyfield"); //선택한 필드명
 sval=request.getParameter("keyword"); //입력한 검색조건값 
 
  if(skey==null || skey==""  || sval==null || sval==""){
  	 sqry=" where  w_title  like '%%' ";
  	 skey=""; sval="";
  }else{
    sqry=" where " + skey +" like '%" + sval +"%' ";
  }
  
  returnpage="&keyfield="+skey+"&keyword="+sval;
 
  st=cn.createStatement();
  sql="select count(*) as cnt from board_list ";
  st=cn.createStatement();
  rs=st.executeQuery(sql);
  rs.next(); 
  Gtotal=rs.getInt("cnt");  
  
  sql="select count(*) as cnt from board_list " + sqry;
  st=cn.createStatement();
  rs=st.executeQuery(sql);
  rs.next(); 
  Stotal=rs.getInt("cnt"); 

  pnum=request.getParameter("Gnum"); 
  if(pnum==null || pnum=="")pnum="1"; 
  pageNUM=Integer.parseInt(pnum); 
  start=(pageNUM-1)*6+1 ;
  end=(pageNUM*6) ; 
 
  if(Stotal%6==0){ pagecount=Stotal/6;}
  else{pagecount=(Stotal/6)+1; }
  

  temp=(pageNUM-1)%10;
  startpage=pageNUM-temp;		 
  endpage=startpage+9;  

  if(endpage > pagecount){ endpage=pagecount; }
  //select  rownum, user_id, w_num, w_title, wdate, w_hit, w_file, replynum, w_content from board_list;
 
 	 
%>




			<jsp:include page="../include/header.jsp"/>

	<div id="fh5co-blog">
		<div class="container">
		
		
			
			
			<div class="row" >
<%
			//select count (*) as cnt from boardreply where w_num
			 
			
			 st=cn.createStatement();
			 String a=" select * from ( ";
			 String b=" select rownum rn, user_id, w_num, w_title, wdate, w_hit, w_file, replynum, w_content from  ";
			 String c=" (select * from board_list " + sqry + " order by w_num asc )";
			 String d=") where rn between " + start + " and " + end ;
			 sql=a+b+c+d;
			 rs=st.executeQuery(sql);
			while(rs.next()==true){
						String w_num = rs.getString("w_num");// 사람이
						String w_id = rs.getString("user_id");// 사람이
						String w_title=rs.getString("w_title");
						//if(w_title.length()>=20){a=w_title.substring(0, 2);}
						
						String w_date = rs.getString("wdate");
						int w_hit = rs.getInt("w_hit");
						int w_replynum = rs.getInt("replynum");
						String w_file = rs.getString("w_file");
						String w_con = rs.getString("w_content");
						//if(w_con.length()>30){b=w_con.substring(0, 50);}
						%>		
						
			<div class="col-md-4">
				<div class="fh5co-blog animate-box">
						<a href="boardDetail.jsp?Gidx=<%=w_num%>" class="blog-bg" style="max-width:auto; max-width: auto; max-height: auto; background-image: url(../storage/<%=rs.getString("w_file")%>);"></a>
						<div class="blog-text">
							<span class="posted_on"><%=w_date%></span>
							<h3><a style="font-size:20pt; color:black;" href="boardDetail.jsp?Gidx=<%=w_num%>"><%=w_title%></a></h3>
							<p ><a style="font-size:15pt; color:black;" href="boardDetail.jsp?Gidx=<%=w_num%>"><%=w_con%>...</a></p>
							<ul class="stuff">
						
								<li><i class="icon-eye2"></i> <%=w_hit%></li>
								<li><i class="icon-eye2"></i> <%=w_replynum%></li>
								<li><a href="boardDetail.jsp?Gidx=<%=w_num%>">Read More<i class="icon-arrow-right22"></i></a></li>
							</ul>
					
						</div> 
					</div>
				</div>
			   <%}%>
			</div>
			<table >
			<tr >
			<td align="center">
			<div  class="row"> 
				<form name="myform" action="board_list.jsp ">
				<div style="margin: 0 auto; align-content: center;">
				  	<div style="width:180px; float:left; text-align:center; margin-right:20px;">
				    <select class="form-control" name="keyfield"  onchange="changeclear();" >
			        	<option value="">&nbsp;&nbsp;전체검색</option>
			        	<option value="w_title"  <% if(skey.equals("w_title")){out.print("selected");} %>>&nbsp;&nbsp;제목검색</option>
			        	<option value="w_content"  <% if(skey.equals("w_content")){out.print("selected");} %>>&nbsp;&nbsp;내용검색</option>
				    </select>
					</div>
				
					<div style="width:300px; float:left; text-align:center; ">
						<input class="form-control" id="exampleFormControlSelect1" type="text" name="keyword" value="<%=sval%>" placeholder="검색:" size=10>
					</div>
				
					<div style="float:left; margin-left:10px; margin-top:3px" > 
			        	<input class="btn btn-primary" type="submit" value="검 색 ">   
						<input class="btn btn-primary" type="button" value="글쓰기"   onclick="location.href='boardWrite.jsp'">  
				    </div>
			    
			    </div>
				</form>
			
      			</div>
      			</td>
			</tr>
			<tr >
			<td align="center">
			<div  class="row"> 
			<p>
				<%
			  	  if(startpage>6){
			  	  	out.println("<a href=board_list.jsp?Gnum="+(startpage-6)+">[prev]</a>");
			  	  }
			  	
			  
			  	  for(int i=startpage; i<=endpage; i++){
			  	  	if(i==pageNUM){
			  	  	 out.println("<font style='font-size:12pt; color:orange;'>["+i+"]</font>");
			  	  	}else{
			  	  	 out.println("<a href=board_list.jsp?Gnum="+i+returnpage+">["+i+"]</a>");
			  	  	}
			  	  }
			     if(endpage<pagecount){
			       out.println("<a href=board_list.jsp?Gnum="+(startpage+10)+">[next]</a>");
			     }
			  	%> 	
			  	</p>
			</div>
			</td>
			</tr>
			</table>
		</div>
	</div>
	
	
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up22"></i></a>
	</div>
	
	<jsp:include page="../include/footer.jsp"/>
	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="../js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="../js/main.js"></script>
</body>
</html>



