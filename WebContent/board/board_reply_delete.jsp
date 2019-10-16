<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_reply_delete.jsp</title>
</head>
<body>
<%
	int r_num = Integer.parseInt(request.getParameter("r_num"));
	int w_num = Integer.parseInt(request.getParameter("w_num"));

	sql="delete from boardreply where r_num=?";
	ps = cn.prepareStatement(sql);
		ps.setInt(1, r_num);
		
	ps.executeUpdate();
	
	response.sendRedirect("boardDetail.jsp?Gidx="+w_num);
%>
</body>
</html>