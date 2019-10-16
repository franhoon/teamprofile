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
<%!
String n_text;
int n_num, r_num;
%>
      
          <%
          
		  n_text=request.getParameter("t_text");//board_reply에서 넘어온 content
		  n_num=Integer.parseInt(request.getParameter("w_num"));//board_reply에서 넘어온 content
		  r_num=Integer.parseInt(request.getParameter("r_num"));//board_reply에서 넘어온 시퀀스

		  sql=" update boardreply set r_content= '"+ n_text + "' where r_num= " + r_num ;
		  st=cn.createStatement();
		  st.executeUpdate(sql);
		  
		  response.sendRedirect("boardDetail.jsp?Gidx="+n_num);
		  %>
		  

       



</body>
</html>