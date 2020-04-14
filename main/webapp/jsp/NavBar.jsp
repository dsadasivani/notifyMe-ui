<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NotifyMe</title>
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <link  rel="stylesheet" href="./css/bootstrap-3.3.7.min.css"> 
 <link type="text/css" rel="stylesheet" href="./css/bootstrap-social.css"></link>
<link type="text/css" rel="stylesheet" href="./css/style.css">
<link type="text/css" rel="stylesheet" href="./css/notifyMeStyle.css"></link>


	
 <link rel="stylesheet" href="./css/font-awesome-4.7.0.css"> 
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./js/jquery1.10.datatables.min.js"></script>

<script type="text/javascript" src="./js/bootstrap-3.3.7.min.js"></script>

<link type="text/css" rel="stylesheet" href="./css/jquery1.10.datatables.css"></link>

   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	



<style>

.sticky {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 100;
}
.stickynvbar{
position: fixed;
  top: 0;
  width: 100%;
  z-index: 100;
}
.navbarshadow{
box-shadow: 0 5px 30px rgba(0, 0, 0, 0.15) !important;	
}
</style>
</head>
<body>
<!-- <nav class="navbar navbar-default">-->
 <div class="mainHeader" style="text-align: center;">
  	<div>
  		<div class="row-fluid text-white">
  		<div class="appHeader" id="appHeader" >
		<div class="row homeheaderrow">
		
				<div class="mobileHamburgerIcon">		
				<div class="hambgHeader "></div>
				  <input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
				  <label for="openSidebarMenu" class="hbmgIconShift">
				   <!--  <div class="hambgspinner hmbgdiagonal div-1"></div>
				    <div class="hambgspinner hmbghorizontal"></div>
				    <div class="hambgspinner hmbgdiagonal div-2"></div> -->
				    <div class="spinner diagonal part-1"></div>
						<div class="spinner horizontal"></div>
						<div class="spinner diagonal part-2"></div>
				  </label>
				  <div id="hbmgbarMenu">
				    <ul class="hmbgMenuInn">
				      <li> Saikumar Kolluru <span>sai.kolluru17@gmail.com</span></li>
				      <li><a href="" target="_blank">360 Trade News</a></li>
				    </ul>
				  </div>
				</div>		
		
		  		  <header class="text-white col-md-8 col-xs-6 logoText" >Notify<span style="color:green;">Me</span></header>
		          <!--<span>Tell us your preference and we will notify you</span>-->
		          <s:if test="logingSuccessfull == Y">
		          
		          </s:if>
		           <s:else>
		           	Login Unsuccessful. 
		           </s:else>
		          <%-- Welcome <span id="showusername" style="margin-top:1rem;color:#fff;">!!!</span> --%>
				  <div id="loginsignupdiv" class="loginsignupdiv" class="col-md-1" style="padding-top: 3rem;">
					<a href="#" onclick="toggleSignupModal()" style="color: #fff;"><span class="glyphicon glyphicon-user"></span> Login/Signup</a>
					<%-- <a href="#" onclick="toggleLoginModal()" style="color: #fff;"><span class="glyphicon glyphicon-log-in" style="padding-left:2rem;"></span> Login</a> --%>
				  
				  </div>
				  <div class="col-md-3 col-xs-6 loginname">
				    <ul class="nav navbar-nav navbar-right" style="background-color: #fff;">
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffffffcf;background-color: #122225;">
		                        <span class="glyphicon glyphicon-user"></span> 
		                        <strong id="showusername">Nombre</strong>
		                        <span class="glyphicon glyphicon-chevron-down"></span>
		                    </a>
		                     <div class="dropdown dropdown-menu list-group" style="color: #122225;text-align: center;">
		                        <a href="#" class="list-group-item list-group-item-action" style="border-color: #fff;">My Profile</a>
		  						<a href="#" class="list-group-item list-group-item-action" style="border-color: #fff;border-top-color: rgba(0,0,0,.175);">Logout</a>
		                    </div> 
		        
		                </li>
		            </ul>
		           </div> 
            
		</div> 
		
		       
		</div>
		
		<div class="row globalTabs">
			<div class="col-md-1 globalTabsDiv">
				Home	
			</div>
			<div class="col-md-1 globalTabsDiv">
				Contact	
			</div>
		 
		
		</div>
        </div>
  	</div>
  	<div>
  		
        
  	</div>
</div> 





 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <div class="modal fade" id="myModal1">
  <div class="modal-dialog">
	<div class="modal-content">
        <div class="modal-header" style="background:#f6b33d -moz-linear-gradient(center top , #f6b33d 5%, #d29105 100%) repeat scroll 0 0;">
          <a class="close" data-dismiss="modal">×</a>
          <h3 style="color:#ffffff;">Please Note:</h3>
        </div>
        <div class="modal-body">
          <p>You can put whatever text you want in here... or form or whatever you want..</p>
        </div>
      </div>
    </div>
</div>

<div class="modal fade" id="signupModal">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
	         <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Choose your Sign up or Create an account with us</h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
            
            <div class="row">
            	
            	<div class="col-md-6">
            		
            					 <a class="btn btn-block btn-social btn-twitter" >
								    <span class="fa fa-twitter"></span> Sign in with Twitter
								  </a>
            				<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button>
            					 <a class="btn btn-block btn-social btn-facebook" onclick="checkLoginState();">
								    <span class="fa fa-facebook"></span> Sign in with Facebook
								  </a>
								  <a class="btn btn-block btn-social btn-google">
								    <span class="fa fa-google"></span> Sign in with Google
								  </a> 
            				
            	</div>
            	<div class="vertical-divider">or</div>
            
            	<div class="col-md-6">
            			 <p class="statusMsg"></p>
		                <form name="signupform" id="signupform"  role="form" class="row" method="post">
		                	 <div class="form-group col-xs-offset-2 col-md-8">
		                    <label>User name</label>
		                        <input type="text" class="form-control" id="userName" name="userName" placeholder="Enter your email"/>
		                    </div>
		                    <div class="form-group col-xs-offset-2 col-md-8">
		                    <label>Email</label>
		                        <input type="email" class="form-control" id="userId" name="userId" placeholder="Enter your email"/>
		                    </div>
		                    <div class="form-group col-xs-offset-2 col-md-8">
		                    <label>Password</label>
		                    	<input type="password" class="form-control"  name="password" id="password" placeholder="Enter your password"/>
		                    </div>
		                     <div class="form-group col-xs-offset-2 col-md-8">
		                    <label>Re-enter Password</label>
		                    	<input type="password" class="form-control" name="rpassword" id="confirmPassword" placeholder="Enter your password"/>
		                    </div>
		                    <button type="submit" class="btn btn-primary" onclick="formSubmit()">Submit</button>
		                </form>
            	</div>
            </div>
               
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer textAlignCenter">
                <button type="button" onclick="formSubmit()" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary submitBtn" onclick="formSubmit()">Continue</button>
            </div>
    </div>
  </div>
</div>

</body>

<script>

//Hide Header on on scroll down
$(document).ready(function(){
	
});


function toggleSignupModal(){
	$("#signupModal").modal('toggle');
}

function formSubmit(){
	event.preventDefault();
	 $.ajax({
		 type : "GET",
		 url : "signupAction",
	     data: $("#signupform").serialize(),
	     dataType: 'json',
	     success: function (data) {
	    	 var username = data.userDetails.userName;
	            $('#showusername').text(username);
	            $("#signupModal").modal('hide');
	            $("#loginsignupdiv").hide();
	    }
	 
	});
	}
	


//below code for FB integration

 // This is called with the results from from FB.getLoginStatus().
 function statusChangeCallback(response) {
 console.log('statusChangeCallback');
 console.log(response);
 // The response object is returned with a status field that lets the
 // app know the current login status of the person.
 // Full docs on the response object can be found in the documentation
 // for FB.getLoginStatus().
 if (response.status === 'connected') {
 // Logged into your app and Facebook.
 FB.api('/me?fields=name,email,picture', function(response) {
	 console.log('Successful login for: ' + response.name); 
	 var userName = response.name;
	 var userId = response.email;
	 $.ajax({
			type : "GET",
			url : "socialLogin",
			data: { userName: userName, userId : userId, "source":"Facebook"} ,
			success : function(data) {
				var html = "" + data.msg;
				var username = data.userDetails.userName;
	            $('#showusername').text(username);
	            $("#loginsignupdiv").hide();
				//alert(data);
				//$("#info").html(html);
				//$("#worldNewsFeedsDiv").html(data);
			},
			error : function(data) {
				//alert("Some error occured.");
			}
		});
	 });
 } else if (response.status === 'not_authorized') {
 // The person is logged into Facebook, but not your app.
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 } else {
 // The person is not logged into Facebook, so we're not sure if
 // they are logged into this app or not.
 document.getElementById('status').innerHTML = 'Login with Facebook ';
 }
 }
 // This function is called when someone finishes with the Login
 // Button. See the onlogin handler attached to it in the sample
 // code below.
 function checkLoginState() {
 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 }
 window.fbAsyncInit = function() {
 FB.init({ 
 appId : '781855168834808',
 cookie : true, // enable cookies to allow the server to access 
 // the session
 xfbml : true, // parse social plugins on this page
 version : 'v2.2' // use version 2.2
 });
 // Now that we've initialized the JavaScript SDK, we call 
 // FB.getLoginStatus(). This function gets the state of the
 // person visiting this page and can return one of three states to
 // the callback you provide. They can be:
 //
 // 1. Logged into your app ('connected')
 // 2. Logged into Facebook, but not your app ('not_authorized')
 // 3. Not logged into Facebook and can't tell if they are logged into
 // your app or not.
 //
 // These three cases are handled in the callback function.

 FB.getLoginStatus(function(response) {
 statusChangeCallback(response);
 });
 };
 // Load the SDK asynchronously
 (function(d, s, id) {
 var js, fjs = d.getElementsByTagName(s)[0];
 if (d.getElementById(id)) return;
 js = d.createElement(s); js.id = id;
 js.src = "//connect.facebook.net/en_US/sdk.js";
 fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk')); 

 // Here we run a very simple test of the Graph API after login is
 // successful. See statusChangeCallback() for when this call is made.
  
</script>
</html>