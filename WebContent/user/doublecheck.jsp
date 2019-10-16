<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>doublecheck.jsp</title>
</head>
<body>

<%
  String a=request.getParameter("idx");  
  if(a.equals(null)||a==""){ %>
	  <script type="text/javascript">
	     alert("아이디를 입력해주세요");
	     self.close();	    
	  </script>	<%
  }
  
  try{
  sql="select count(*) as cnt from member_user where user_id=? ";
  ps=cn.prepareStatement(sql);
		ps.setString(1, a);
  rs=ps.executeQuery();
  }catch(Exception ex){System.out.println("중복체크 에러:"+ex);}
  if(rs.next()==true){ total=rs.getInt("cnt"); }
  if( total>0){	%> 
	  <script type="text/javascript">
	     alert("데이터는 이미 사용 중인 아이디 입니다");
	     opener.register-form.id.focus();	    
	  </script>	
<% }else{
		 flag=true;
		 System.out.println("aaaa"+flag);
	%>	 
	    <script type="text/javascript">
     alert("사용가능한 아이디 입니다");  
     opener.getReturnValue("Y");
     opener.register-form.pw.focus();
  </script>	
	<%}	%>
	<script type="text/javascript">self.close();</script>	
	

</body>
</html>