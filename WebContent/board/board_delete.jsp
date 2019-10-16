<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int a = Integer.parseInt(request.getParameter("w_num"));

	sql = "delete from board_list where w_num=?";
	
	ps = cn.prepareStatement(sql);
		ps.setInt(1, a);
	ps.executeUpdate();
	
	response.sendRedirect("board_list.jsp");
%>

</body>
</html>