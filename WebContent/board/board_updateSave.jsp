<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.sql.*" %>   
<%@ include file="../database/connect.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title> [boardWriteSave.jsp]</title>
   <style type="text/css">
	  *{font-size:20pt; font-weight:bold;  font-family: Comic Sans MS ; margin-left: 10px; }
	  a{font-size:20pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
	  a:hover{font-size:24pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
</head>
<body>
    boardWriteSave.jsp문서 <p>
 	<img src="../images/bar.gif"> <br>
 	<img src="../images/bar.gif"> <br>
 	<img src="../images/bar.gif"> <p>
 	
 	<%//이미지게시판 만들어볼것
 	String path=application.getRealPath("storage");//공유폴더 개념
 	System.out.println("경로" + path);
 	int size=1024*1024*7;
// 	MultipartRequest mr = new MultipartRequest(1,2,3,4); 리퀘스트 패스 싸이즈 인코딩
 	DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8",dfr);
 	

	String w_num = mr.getParameter("w_num");
 	String a= mr.getParameter("w_id");
 	String b= mr.getParameter("title");
 	String c= mr.getParameter("content");
 	String d= mr.getFilesystemName("file1");
 	int e = Integer.parseInt(mr.getParameter("w_hit"));
 	int f = Integer.parseInt(mr.getParameter("replynum"));

 	
 	sql="update board_list set user_id=?, w_title=?, wdate=sysdate, w_hit=?, w_file=?, replynum=?, content=? where w_num=?";
 		ps=cn.prepareStatement(sql);
 		ps.setString(1,a);
 		ps.setString(2,b);
 		ps.setInt(3,e);//path+"\\"
 		ps.setString(4,d);
 		ps.setInt(5,f);
 		ps.setString(6,c);
 		ps.setString(7,w_num);
 	ps.executeUpdate();
 	
 	response.sendRedirect("board_list.jsp");
 	%>

  
</body>
</html>