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

<div class="row">
<div class="col-md-4 deleteRecordsText">
Select the records to delete and hit Delete button. 
</div>
<div class="col-md-1">
<button id="disableButton" type="button" class="btn btn-primary adminButton disabled" onclick="deleteArticles()">Delete</button>
</div>
</div>

<br/>
 <div class="row">
 		
 		<s:iterator value="nmeList" status="stat">
 		
		 <div class="row col-md-9 adminDetaledNewsRow">
		 	<div class="col-md-1"><input type="checkbox" value="" id="<s:property value="id" />" onclick="enableDelete('articleId1')">
		 	</div>
		 	<div class="col-md-9">
		 		<s:property value="shortNews" />
		 	</div>
		 	<div class="col-md-2">
		 			<button class="btn btn-primary adminButton" type="submit">Edit</button>
		 	</div>
		 	<!-- <div class="col-md-2">
		 			<button type="button" class="btn btn-default adminButton adminDeleteBtn">Delete</button>
		 			
		 	</div> -->
		 </div>
		 </s:iterator>
		 

		 
 		
 </div>
       


<script type="text/javascript">

function enableDelete(id){
	if( $("input:checkbox:checked").length > 0){
		$("#disableButton").removeClass('disabled');
	}else{
		$("#disableButton").addClass('disabled');
	}
}

function deleteArticles(){
	var deletelist = [];
$("input:checkbox:checked").each(function() {
	deletelist.push($(this).attr("id"));
	
});
alert('deletelist'+deletelist);
}

$(document).ready(function(){
	
      

 
	
  
        
});

</script>
</body>
</html>