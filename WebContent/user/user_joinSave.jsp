<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_joinSave.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");

	String a = request.getParameter("id");
	String b = request.getParameter("pw");
	String c = request.getParameter("name");
	String d = request.getParameter("birth");
	String e = request.getParameter("hobby");
	if(e == null || e == ""){
		e = " ";
	}
	String f = request.getParameter("gender");
	String g = request.getParameter("email");
	if(g == null |g == ""){
		g = " ";
	}
	String h = request.getParameter("phone");
	if(h == null || h == ""){
		h = " ";
	}
	
	sql = "insert into member_user values (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
	
	ps = cn.prepareStatement(sql);
		ps.setString(1, a);
		ps.setString(2, b);
		ps.setString(3, c);
		ps.setString(4, d);
		ps.setString(5, e);
		ps.setString(6, f);
		ps.setString(7, g);
		ps.setString(8, h);

		ps.executeUpdate();
%>
<script type="text/javascript">
	alert("환영합니다~! 회원가입 되셨습니다!")
</script>
<%
		response.sendRedirect("user_join.jsp");
%>
</body>
</html>