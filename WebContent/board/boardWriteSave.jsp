<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ include file="../database/connect.jsp" %>
<%@ page import = "java.sql.*" %>   

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
 	


 	String a= mr.getParameter("w_id");
 	String b= mr.getParameter("title");
 	String c= mr.getParameter("content");
 	String d= mr.getFilesystemName("file1");
 	out.println("넘어온 아이디=" + a +"<br>");
 	out.println("넘어온 제목=" + b +"<br>");
 	out.println("넘어온 내용=" + c +"<br>");
 	out.println("넘어온 파일=" + d +"<br>");
 	
 	sql="insert into board_list values( board_list_seq.nextval, ?, ?, sysdate, 0, ?, 0, ?)";
 	ps=cn.prepareStatement(sql);
 	ps.setString(1,a);
 	ps.setString(2,b);
 	ps.setString(3,d);//path+"\\"+
 	ps.setString(4,c);
 	ps.executeQuery();
 	System.out.println("디비입력된 값:"+a+b+c+d);
 	
 	response.sendRedirect("board_list.jsp");
 	%>
 	
 	
 	
 	
 	</table>
 	
 	
 	
 	 <p>
  <a href="boardWrite.jsp">[AAA.jsp]</a>  
  <a href="index.jsp">[index]</a>
  <a href="boardList.jsp">[전체출력]</a>
  
 	<hr>
  <!-- <a href="facebook_download.jsp?fname=<%=d%>"><img src="./storage/<%=d%>"  width="70" height="70"></a> <!-- 프로젝트에 경로뽑아내는 함수 request.getContextpath() 많이 사용할것 -->
 
</body>
</html>