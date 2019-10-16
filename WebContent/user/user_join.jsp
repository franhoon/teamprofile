<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../database/connect.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>user_login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
    
    
	<meta name="description" content="Free HTML5 Website Template by freehtml5.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="freehtml5.co" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,500,700,800" rel="stylesheet">	 -->
	<link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="../css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="../css/flexslider.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="../css/style.css">

	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
 <!-- <script src="../js/user.js"></script> -->
    <script type="text/javascript">


    function chkAll() {
    	
    	a =document.getElementById('id').value;
    	b = document.getElementById('pw').value;
    	c = document.getElementById('name').value;
    	d = document.getElementById('birth').value;
    	
    	if(a == ""  || a == null){
     		document.getElementById("id_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";
     		document.getElementById('id').focus(); 
     		return false;
          }else{     
        	document.getElementById("id_s").innerHTML="";
        	document.getElementById('pw').focus();        	
          }
    	
    	if(b == "" || b == null){
     		document.getElementById("pw_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
     		document.getElementById('pw').focus(); 
     		return false;
          }else{
        	document.getElementById("pw_s").innerHTML="";
        	document.getElementById('name').focus();
          }
    	
    	if(c == "" || c == null){
     		document.getElementById("name_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
     		document.getElementById('name').focus(); 
     		return false;
          }else{
        	document.getElementById("name_s").innerHTML="";
        	document.getElementById('birth').focus();
          }
    	
    	if(d == ""  || d == null){
     		document.getElementById("birth_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";         
     		document.getElementById('birth').focus(); 
     		return false;
          }else{
        	document.getElementById("birth_s").innerHTML="";
        	
          }
    	return true;
    	
    }//end


    function chk() {
    	   var chkm=document.getElementById("genderw").checked;
    	   var chkw=document.getElementById("genderm").checked;
    	   if(chkAll()==false){ return false;}
    	   if(chkm==false && chkw==false){
    	       document.getElementById("gender_s").innerHTML="<font style='font-size:8pt; color:red'>*필수항목*</font>";     
    	       return false; 
    	       
    	      }
    	  return true;
    	 	   
	}//chk end
    
    function ckRadio(a){
        var obj = document.getElementsByName("gender");
          
         for(var i=0; i<obj.length; i++){
          if(obj[i].value!=a){
         obj[i].checked=false;
         
             //체크해제시키기
             }
         }
      }//ckRadio end
    
    function doublecheck(){
    	var id=document.getElementById('id').value;
		
    	open("doublecheck.jsp?idx="+id,"double","width=500,height=300,left=500,top=300");
    	
	}
    
    
    function getReturnValue(returnValue) {    	     	  
    	 if(returnValue=="Y"){
    	  	document.getElementById('signin').disabled=false;
    	 }
    }
    function akak() {
		return false;
	}
    
    </script>
</head>
<body>


<%@ include file="../include/header.jsp" %>

    <div class="main">
        <section class="signup">
            <div class="container1">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">regist</h2>
                        <form method="post" class="register-form" id="register-form" name="register-form" action="user_joinSave.jsp" onsubmit="return chk();">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id" placeholder="ID" autocomplete="off"/>
                                <label for="id" style="margin-left:250px;"><a onclick="doublecheck()"><i class="zmdi zmdi-check-all"></i></a></label>
                                <span id="id_s"></span>                                
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pw" id="pw" placeholder="Password" autocomplete="off"/>
                                <span id="pw_s" ></span>
                            </div>
                            <div class="form-group">
                            	<label for="your_pass"><i class="zmdi zmdi-face"></i></label>
                                <input type="text" name="name" id="name" placeholder="your name" autocomplete="off"/>
                                <span id="name_s" ></span>
                            </div>
                            <div class="form-group">
                            	<label for="your_birth"><i class="zmdi zmdi-cake"></i></label>
                                <input type="text" name="birth" id="birth" placeholder="ex)20190101" autocomplete="off"/>
                                <span id="birth_s"></span>
                            </div>
                            <div class="form-group">
                            	<label for="your_hobby"><i class="zmdi zmdi-coffee"></i></label>
                                <input type="text" name="hobby" id="hobby" placeholder="hobby" autocomplete="off"/>
                            </div>
                            <div class="form-group">
                            	<label for="your_email"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="email" id="email" placeholder="ex)asd@gmail.com" autocomplete="off"/>
                            </div>
                            <div class="form-group">
                            	<label for="your_phone"><i class="zmdi zmdi-phone"></i></label>
                                <input type="text" name="phone" id="phone" placeholder="ex)065-1614-1658" autocomplete="off"/>
                            </div>
                            <div class="form-group">
                           		<label for="your_gender"><i class="zmdi zmdi-male-female"></i></label>
                            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	<input type="checkbox" name="gender" id="genderw"  value="w" onclick="ckRadio(this.value)"/>
                                <label for="genderw" class="label-agree-term"><span><span></span></span>Woman</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="gender" id="genderm" value="m" onclick="ckRadio(this.value)"/>
                                <label for="genderm" class="label-agree-term"><span><span></span></span>Man</label>
                                <span id="gender_s"></span>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit"  value="regist" disabled="disabled"  />
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                    </div>
                </div>
            </div>
        </section>

    </div>

<%@ include file="../include/footer.jsp" %>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>