<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html">

<html lang="en">


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details Page</title>
	<!-- <link rel="stylesheet" href="./css/font-awesome-4.7.0.css"> -->


<style>
div#contentDiv p {
	font-family: sans-serif,serif;
	color: #333;
	font-size:larger;
}

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

.fab{
	background: #fff;
    color: #333;
    padding: 7px 5px 5px 5px;
    border: 1px solid;
    border-radius: 3rem;
        font-size: 16px;
    width: 3rem;
    text-align: center;
    text-decoration: none;
}
</style>
</head>
<body style="background-color:#fff;">

<form name="form2">
<jsp:include page="./NavBar.jsp" />



<div class="row" style="margin-top:5rem;">
	<div id="" class="col-xs-offset-1 col-lg-7 detailsPageResponsiveClass">
	
	<!-- Heading -->
	<div>
	<h1><s:property value="detailsObj.title"/></h1>
	</div>
	
	<!-- Published Date, Share options and Comments -->
	<div class="row" >
		<div class="col-md-4" style="padding-top: 0.75rem;">
			Published on 1/5/19 8:18:09 PM
			<span style="padding-left:2rem;">|</span>
		</div>
		<div class="col-md-4" id="detailsPage">
		 Share on
		 <a href="http://www.facebook.com/sharer.php?u=<a href='www.google.com'>https://www.notifyme.com</a>" style="margin-left:2%;"><i id="social-fb" class="fbcircle fa fa-facebook" style=""></i></a>
			 <a href=""><i id="social-tw" class="fbcircle fa fa-twitter " style="margin-left:2%;"></i></a>
	     <a href=""><i id="social-gp" class="fbcircle fa fa-google" style="margin-left:2%;"></i></a>
	     
	<!--      <a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google"></i></a>
	     <a href="#" class="fa fa-google"></a>  -->      
	      <span style="padding-left:2rem;">|</span>     
		</div>
		<div class="col-md-3" style="padding-top: 0.75rem;">
		 <%-- <span class="glyphicon glyphicon-comment"></span> --%><i class="far fa-comment-alt-lines"></i><span style="padding-left:1rem;">Comments(10)</span>
		</div>
		
	</div>
	
	<div class="row" style="padding-top: 5rem;">
	<div class="col-md-8">
	<img src="<s:property value="detailsObj.leadImageUrl"/>" class="img-responsive" alt="Cinque Terre" style="width:50rem;min-height: 25rem;">
 	</div>
 	<div class="col-md-4">
 	<span style="text-decoration: underline;font-weight: bold;">Key Notes:</span>
 	<ul>
	  <li type="square"><s:property value="detailsObj.excerpt"/></li>
	</ul>
 	</div>
 	</div>
    <!-- Facebook -->
    
    <!-- <a href="" onclick="triggermail();">
        <img src="https://simplesharebuttons.com/images/somacro/email.png" alt="Email" />
    </a>
    <a href="http://www.facebook.com/sharer.php?u=https://www.notifyme.com" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/facebook.png" alt="Facebook" />
    </a> -->
    <div id="contentDiv">
    	<div class="contentCollapse" id="contentCollapse" aria-expanded="false">
    	<s:property value="detailsObj.articleContent"  escape="false"></s:property>
    	</div>
    	
    	<a role="button" class="collapsed" data-toggle="collapse" href="#contentCollapse" aria-expanded="false" aria-controls="contentCollapse">
		</a>
    </div>
	
		
	</div>
	
	<div id="" class="col-lg-4">
	
	<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-md-4 offset-md-3">
			<span class="backtrackTitle"> Backtrack</span>
			<ul class="timeline">
			<s:iterator value="backTrack" status="stat">
			<s:if test="%{#stat.index == 2 }">
					<li style="padding-left: 5rem;" class="timelineLiSelect">
						<!-- <a target="_blank" href="https://www.totoprayogo.com/#">New Web Design</a>-->
						<a href="#" class="timelineAnchor"></a>
						<p class="timelineForSelectP">
						
						<s:iterator value="value" status="itr">
								
								<s:property value="shortNews"/>
								
						</s:iterator>
						
						</p>
					</li>
				</s:if>
				<s:elseif test="%{#stat.index <9 }">
					<li style="padding-left: 5rem;">
						<!-- <a target="_blank" href="https://www.totoprayogo.com/#">New Web Design</a>-->
						<a href="#" class="timelineAnchor"></a>
						<p class="timelineP">
						
						<s:iterator value="value" status="itr">
								
								<s:property value="shortNews"/>
								
						</s:iterator>
						
						</p>
					</li>
				</s:elseif>
			</s:iterator>
			</ul>
		</div>
	</div>
</div>
	
	
	
	
	
	
	
	
		<%-- <div style="font-size: x-large;margin-bottom: 2rem;text-align: center;font-weight: 500;">
		<span style="border-bottom: 5px solid;border-bottom-color: #FF5722;"> Related News</span>
		</div> --%>
		<div class="relatedNewsTitle">
		<span > Related News</span>
	</div>
		
		<div class="row" style="border-left: 1px solid;padding-left: 2rem;border-color:rgba(0,0,0,0.2);">
			
			<div class="col-md-10">
	
		<s:iterator value="relatedList" status="itr">
		
		<s:if test="%{#itr.index < 10 }">
			<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 1rem;border-bottom-width: thin;padding-top: 1rem;">
				
				 <div class="col-md-5 col-xs-4">
				 <s:if test="imageUrl == null">
				 <img src="./images/news_default_image.jpg" class="img-responsive" alt="Cinque Terre" style="min-height: 7rem;max-height: 7rem;">
				 
				 </s:if>
				 <s:else>
					<img src="<s:property value="imageUrl"/>" class="img-responsive" alt="Cinque Terre" style="min-height: 7rem;max-height: 7rem;">
				</s:else>
	
					
				</div>
				<div class="col-md-6 col-xs-7" style="color:black;">
					<div class="row" style="height:5rem;">
					<span>
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color:#333;font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<div class="row">
					<span style="margin-top:1rem;"><s:property value="displayDate"/> </span>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
					</div>
					
				</div>
			</div>
			
			</s:if>
			
		</s:iterator>	
			

			
		</div>	
	</div>
	</div>
	
	



</div>

<script>
function triggermail() {
	  //window.location.href = 'mailto:address@dmail.com?subject=Hello there&body=This is the body';

  var mailto_link = 'mailto:' + email + '?subject=' + subject + '&body=' + body_message;

  win = window.open(mailto_link, 'emailWindow');
  if (win && win.open && !win.closed) win.close();
}

</script>
<script type="text/javascript">




var $ = jQuery.noConflict();

$(document).ready(function() {
	
	
	
	

ajaxNewsFunctionCall();
var xmlHttp1;
  function ajaxNewsFunctionCall() {
	
    var URL = "homeLoad";
    try {
      xmlHttp1 = new XMLHttpRequest();	
    } catch (e) {
      try {
    	  xmlHttp1 = new ActiveXObject("Msxml2.XMLHTTP");
      } catch (e) {
        try {
        	xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
          alert("Your browser does not support AJAX!");
          return false;
        }
      }
    }
    xmlHttp1.onreadystatechange = showMessage;

    xmlHttp1.open("GET", URL, true);
    xmlHttp1.send(null);
  }
  
  function showMessage() {
	    if (xmlHttp1.readyState == 4) {
	      //alert(xmlHttp.responseText);
	    }
	  }
  
  
  
});  

</script>
</form>
</body>
</html>