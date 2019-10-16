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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 	String a = (String)session.getAttribute("lion");
    int i_num =Integer.parseInt(request.getParameter("w_num")); // String i_num = request.getParameter("d_num");
   
    String i_text = request.getParameter("t_text");

 	sql="insert into boardreply values(boardreply_seq.nextval, ?, ?, ?, sysdate)";
 	
 	ps=cn.prepareStatement(sql);
 		ps.setInt(1,i_num);
 		ps.setString(2, a);
 		ps.setString(3,i_text);
 	ps.executeUpdate();
 	 
 	sql="Update board_list set replynum = replynum+1 where w_num=?"; 
 	
 	ps=cn.prepareStatement(sql);
		ps.setInt(1,i_num);
		
	ps.executeUpdate();
 	
 	
 	response.sendRedirect("boardDetail.jsp?Gidx="+i_num);
 
 %>


</body>
</html>