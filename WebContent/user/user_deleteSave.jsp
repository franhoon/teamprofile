<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_deleteSave.jsp</title>
</head>
<body>
<script>
	var mss=confirm("정말로 삭제하시겠습니까?");
	if(mss){
		return true;
	}else{
		history.go(-1);
	}

</script>


<%
  System.out.println("user_deleteSave 계정삭제중....");
  String a=request.getParameter("idx");
  if(a.equals("admin114")){
%>
<script>
	alert("관리자는 지울 수 없습니다.");
	history.go(-1);
</script>
<%

  }
  try{
  sql="delete from member_user where user_id=?";
  ps=cn.prepareStatement(sql);
	ps.setString(1, a);
	ps.executeUpdate();
  
  if(!((String)session.getAttribute("lion")).equals(a)){
  	session.invalidate();
  }
  System.out.println("user_deleteSave 삭제 완료.");
  response.sendRedirect("../index.jsp");
  
  }catch(Exception ex){System.out.println("삭제 에러:"+ex);
%>
 <script type="text/javascript">
 	 history.go(-1);
 </script>
<%	}	%>	
	

</body>
</html>