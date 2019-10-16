<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("lion");
%>
<script>
	alert("로그아웃이 정상처리 되었습니다.");
	location.href='/MiniWeb';
</script>
