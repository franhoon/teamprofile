

function check(kform) {
	
	a = kform.id.value;
	b = kform.pw.value;
	c = kform.name.value;
	d = kform.birth.value;
	e = kform.gender.value;
	
	if(a==""  || a==null){
 		document.getElementById("id_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";
 		kform.id.focus(); 
 		return false;
      }else{
    	document.getElementById("id_s").innerHTML="";
    	kform.pw.focus();
      }
	
	if(b==""  || b==null){
 		document.getElementById("pw_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
 		kform.pw.focus(); 
 		return false;
      }else{
    	document.getElementById("pw_s").innerHTML="";
    	kform.name.focus();
      }
	
	if(c==""  || c==null){
 		document.getElementById("name_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
 		kform.name.focus(); 
 		return false;
      }else{
    	document.getElementById("name_s").innerHTML="";
    	kform.birth.focus();
      }
	
	if(d==""  || d==null){
 		document.getElementById("birth_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
 		kform.birth.focus(); 
 		return false;
      }else{
    	document.getElementById("birth_s").innerHTML="";
    	kform.gender.focus();
      }
	
	if(e==""  || e==null){
 		document.getElementById("gender_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
 		kform.gender.focus(); 
 		return false;
      }else{
    	document.getElementById("gender_s").innerHTML="";
    	kform.genderw.focus();
      }
	
	kform.action='user_joinSave.jsp';
	kform.submit();
	
}

