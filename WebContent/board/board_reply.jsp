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
<script type="text/javascript">

function re_edit(content,rr_num){
	reply_form.t_text.value=content;
	reply_form.btn.value="edit";
	reply_form.r_num.value=rr_num;
}

function re_save(){
	var bt=reply_form.btn.value;
	var con=reply_form.t_text.value;

	if(bt=="save"){
		document.reply_form.method="post";
		document.reply_form.action="board_reply_insert.jsp"
		document.reply_form.submit();
		
	}else if(bt=="edit"){
		reply_form.btn.value="save";
		document.reply_form.method="post";
		document.reply_form.action="board_reply_edit.jsp";
		document.reply_form.submit();
		}
	}
</script>
 
 
</head>
<body>
<%!
String r_user_id;
String rv_user, rv_con;
int rv_num, r_replynum, data, d_replynum, rv_r_num; 
%>




 <!-- Single Comment   댓글출력-->
 
 
 
 
       
  <%
  data=Integer.parseInt(request.getParameter("Gidx"));//boardDetail에서 넘어온 아이디//w_num
  r_replynum=Integer.parseInt(request.getParameter("Rnum"));//boardDetail에서 넘어온 아이디//리플라이넘버
  System.out.println("댓글 Gidx= "+ data);
  %>
		  
		  <!-- Comments Form -->
	        <div class="card my-4">
	          <h5 class="card-header">Leave a Comment: <%=r_replynum %></h5>
	          <div class="card-body">
	            <form method="get" name="reply_form" action="board_reply_insert.jsp">
	              <div class="form-group" >
	                <input type="hidden" name="w_num"  value="<%=data%>" >
	                <input type="hidden" name="r_num"  id="r_num" value="" >
	                	                <textarea class="form-control" name="t_text"  rows=3 value="" ></textarea>
	              <input type="button" name="btn" onClick="re_save();" class="btn btn-primary" value="save">
	               </div>
	            </form>
	          </div>
	        </div>
	        
	<%
	     st=cn.createStatement();
		 String msg="select r.w_num, r.r_num, r.user_id, r.r_content, r.rdate, l.w_num from boardreply r inner join board_list l on l.w_num = r.w_num and l.w_num = "+data;
		 rs=st.executeQuery(msg);
		    
		 while(rs.next()==true){
		      rv_num=rs.getInt("w_num");
			  rv_user=rs.getString("user_id");
		      rv_con=rs.getString("r_content");
		      rs.getDate("rdate");
		      rv_r_num = rs.getInt("r_num");
		      
		    %>
		    
			<div class="media mb-4">
			
          	<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          	<div class="media-body">
            <h5 class="mt-0"><%=rv_user%></h5> 
            <%=rv_con%>
<%
	if(((String)session.getAttribute("lion")).equals(rv_user)){
%>
            <a href="#" onClick="re_edit(<%=rv_con%>,<%=rv_r_num %>);">[수정]</a>
            <a href="board_reply_delete.jsp?r_num=<%=rv_r_num %>&w_num=<%=rv_num %>" onClick="del();">[삭제]</a>
<%}else if(((String)session.getAttribute("lion")).equals("admin114")){ %>            
            <a href="#" onClick="re_edit(<%=rv_con%>,<%=rv_r_num %>);">[수정]</a>
            <a href="board_reply_delete.jsp?r_num=<%=rv_r_num %>&w_num=<%=rv_num %>" onClick="del();">[삭제]</a>
<%} %>
            </div>
        </div>
           <%
           
	  }
	System.out.println("확인!!");
	  %>
	  

     
 

       



</body>
</html>