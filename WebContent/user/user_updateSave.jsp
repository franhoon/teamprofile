<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_updateSave.jsp</title>
</head>
<body>

<%
System.out.println("user_updateSave로그인 아이디, 비번 갱신중....");
  String idx = request.getParameter("id");
  
  String a = request.getParameter("pw"); 
  String b = request.getParameter("name");
  String c = request.getParameter("birth"); 
  String d = request.getParameter("hobby"); 
  String e = request.getParameter("email"); 
  String f = request.getParameter("phone");


  try{
  sql="update member_user set user_pw=?, user_name=?, birth=?, hobby=?, email=?, phone=? where user_id=?";
  ps=cn.prepareStatement(sql);
		ps.setString(1, a);
		ps.setString(2, b);
		ps.setString(3, c);
		ps.setString(4, d);
		ps.setString(5, e);
		ps.setString(6, f);
		ps.setString(7, idx);
		ps.executeUpdate();	
  //rs=ps.executeQuery();
  }catch(Exception ex){System.out.println("수정 에러:"+ex);}
  try{ System.out.println("데이터 수정합니다..."); 	 
		 System.out.println("user_updateSave데이터 갱신 성공");
		 response.sendRedirect("myPage.jsp");
		 
		 //Cookie ck=new Cookie("google", a); //쿠키내장클래스 객체화 
		 //response.addCookie(ck); //쿠키추가등록
		 //response.sendRedirect("main.jsp");
	 }catch(Exception ex){
	%>	 
	  <script type="text/javascript">
	     alert("수정에 실패했습니다.");
	     location.href="user_update.jsp?user_id="+idx;
	  </script>	 
	<%}%>	
%>



</body>
</html>