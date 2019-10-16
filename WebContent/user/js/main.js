function ucl() {
	alert("ooko");
	location.href="myPage.jsp";
}//cancle end


function upchk() {
	
	a = document.getElementById("pw").value;
	b = document.getElementById("pw_ck").value;
	c = document.getElementById("name").value;
	
	
	if(a==""  || a==null){
		document.getElementById("pw_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";
		document.getElementById("pw").focus();
		return false;
	}else{
		document.getElementById("pw_s").innerHTML="";
		document.getElementById("pw_ck").focus(); 
		if(a!=b){
			document.getElementById("pw_ck_s").innerHTML="<font style='font-size:8pt; color:red'>*비밀번호가 일치하지 않습니다.*</font>";
			document.getElementById("pw_ck").value="";
			document.getElementById("pw_ck").focus(); 
			return false;
		}else{
			document.getElementById("pw_ck_s").innerHTML="";
			document.getElementById("pw_ck").blur();
		}   
	}
	
	if(c==""  || c==null){
		
 		document.getElementById("name_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
 		document.getElementById("name").focus(); 
 		return false;
      }else{
    	document.getElementById("name_s").innerHTML="";
    	document.getElementById("kform").action="user_updateSave.jsp";
    	document.getElementById("kform").submit();
      }
}


function del() {
	var id = document.getgetElementById("user_id");
	var mss=confirm("정말로 삭제하시겠습니까?");;
	if(mss){
		location.href="user_deleteSave.jsp?idx="+id.value;
		return true;
	}else{
		return false;
	}
}//delete end
