<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html">

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	
	<!-- Add icon library -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- NotifyMe CSS -->
	<link type="text/css" rel="stylesheet" href="./css/style.css">
	
	<link rel="shortcut icon" href="./images/Capture.ico">
	
	<!--JavaScript -->    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css" />

<!--<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
<link type="text/css" rel="stylesheet" href="notifyMeStyle.css"></link>
<link type="text/css" rel="stylesheet" href="bootstrap-social.css"></link>
<link type="text/css" rel="stylesheet" href="font-awesome-4.7.0.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.5.0/css/all.css' integrity='sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU' crossorigin='anonymous'>
	
	
	<%-- <script>  
	
		var request;
		function sendInfo() {
			var v = document.form1.widgetDataField.value;
			var url = "./jsp/statistics.jsp?val=" + v;

			if (window.XMLHttpRequest) {
				request = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			}

			try {
				request.onreadystatechange = getInfo;
				request.open("GET", url, true);
				request.send();
			} catch (e) {
				alert("Unable to connect to server");
			}
		}

		function getInfo() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('statisticData').innerHTML = val;
			}
		}
	</script> --%> 
<title>NotifyMe</title>


</head>

<body>
<form name="form1">
<div class="nme-container top">
  
  <a class="nme-logo" href="#">NotifyMe<span class="dotcom">.com</span></a>
  
  <div class="nme-right w3-hide-small w3-wide toptext" style="font-family:'Segoe UI',Arial,sans-serif">
		<a href="#" class="fa fa-facebook"></a>
		<a href="#" class="fa fa-twitter"></a>
		<a href="#" class="fa fa-google"></a>
		<a href="#" class="fa fa-linkedin"></a>
  </div>
  
  <!-- <div class="nme-right w3-hide-small w3-wide toptext" style="font-family:'Segoe UI',Arial,sans-serif">PREFRENCE BASED NEWS TO LEARN AND EARN</div> -->

</div>

<div class="nme-bar nme-theme nme-card-2 nme-wide">
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">HOME</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">MARKETS</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">MOVIES</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">LIFESTYLE</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">GADGETS</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">SHOPPING</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">SUBSCRIPTIONS</a>
<!--  <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">WEALTH</a> -->
 <!-- <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">BLOG</a> -->
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">ABOUT US</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">CONTACT US</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">MY ACCOUNT</a>
 <a class="nme-bar-item nme-button barex nme-hover-white nme-padding-16" href="#">LOGOUT</a>
</div>

<div class="row">
<!-- <div class="col-md-1 homepageLeft"></div> -->
<div class="col-md-3 center-sidebar">
<div class="center-bar-news">
<!-- <h3><a href="#">Stock Widgets</a></h3>
	<input type="text" name="widgetDataField">  
	<input type="button" value="Get Info" onClick="sendInfo()">   -->
	
</div>

</div>
<div class="col-md-6 right-sidebar">
<div class="right-bar-news">
<h3><a href="#">Latest News</a></h3>
<ul>
<s:iterator value="newsList">
<li><div class="row">
<div class="col-md-3"><img width="200px" height="100px" alt="Image" src="<s:property value="localImageUrl"/>" class="img-responsive"/></div>
<div class="col-md-9"><h2 class="text-light"><a href="<s:property value="newsLink"/>"><s:property value="shortNews"/></a></h2></div></div></li>
</s:iterator>
</ul>
</div>
</div>
</div>
</form> 
</body>

</html>