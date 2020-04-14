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


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body style="background-color:#fff;">


<jsp:include page="/jsp/NavBar.jsp" />
Welcome Devil
 <div class="row">
 	<div class="col-md-2 adminTilesRow">
 	<div>
 		<div class="row adminTiles adminTilesActive" id="tab1" onclick="changeAdminTab('tab1');changeContent('tab1')">
 			  Detailed News Upadate
 		</div>
 		<div class="row adminTiles" id="tab2" onclick="changeAdminTab('tab2')">
 			 Prime News Indicators
 		</div>
 		
 		<div class="row adminTiles" id="tab3" onclick="changeAdminTab('tab3')">
 			 Most Recommended Indicators 
 		</div>
 		
 		<div class="row adminTiles" id="tab4" onclick="changeAdminTab('tab4')">
 			 Section 4
 		</div>
 	
 	</div>
 	
 	</div>
 	
 	<div class="col-md-9 adminMainContentDiv" >
 		<h2 id="contentHeader"></h2>
 		<div id="adminCOntent">
 		
 		</div>
 	</div>
 		
 		
 </div>
       


<script type="text/javascript">

function changeAdminTab(tabnum){
	$('.adminTiles').removeClass('adminTilesActive');
	$("#"+tabnum).addClass('adminTilesActive')
	$("#contentHeader").text($("#"+tabnum).text());
}

function changeContent(tabnum){
	 $.ajax({
			type : "GET",
			url : "detailedNewsUpdate",
			success : function(data) {
				var html = "" + data.msg;
				//alert(data);
				//$("#info").html(html);
				$("#adminCOntent").html(data);
			},
			error : function(data) {
				//alert("Some error occured.");
			}
		});
}

$(document).ready(function(){
	
	$("#contentHeader").text($("#tab1").text());
      

 
	
  
        
});

</script>
</body>
</html>