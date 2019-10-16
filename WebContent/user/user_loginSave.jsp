<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_loginSave.jsp</title>
</head>
<body>

<%

  String a = request.getParameter("your_id");
  String b = request.getParameter("your_pw"); 
  String c = request.getParameter("remember-me");
  if(c == "" || c == null){
  	c = " ";
  }
  
  
  try{
  sql="select count(*) as cnt from member_user where user_id=? and user_pw=?";
  ps=cn.prepareStatement(sql);
		ps.setString(1, a);
		ps.setString(2, b);
  rs=ps.executeQuery();
  }catch(Exception ex){System.out.println("로그인 에러:"+ex);}
  if(rs.next()){
  	total=rs.getInt("cnt");
  	System.out.println("확인중");
  	}
  if( total>0){	 
		 session.setAttribute("lion", a); //userid값을 가짜변수 lions에 넘김
		 System.out.println(a);
		 System.out.println("user_loginSave로그인 성공");
		Cookie idcoo = new Cookie("userid", a);			// id쿠키 만들어주는곳
		
		idcoo.setMaxAge(3600);
		response.addCookie(idcoo);
		Cookie check;
 	 if(c.equals("yes")){							//아이디 기억하기 쿠키 만들어주는곳
		check = new Cookie("check", c);
 	 	check.setMaxAge(3600);
 	 }else{
 		check = new Cookie("check", c);
 	 	check.setMaxAge(0);
 	 	idcoo.setMaxAge(0);
 	 	check.setValue("");
 	 	idcoo.setValue("");
 	 }
 	 	response.addCookie(check);
 	 	response.addCookie(idcoo);
		response.sendRedirect("/MiniWeb/index.jsp");
	 }else{
	%>	 
	  <script type="text/javascript">
	     alert("잘못된 ID 혹은 password 입니다.");
	     location.href="/MiniWeb/index.jsp";
	  </script>	 
	<%}	%>	
	

</body>
</html>