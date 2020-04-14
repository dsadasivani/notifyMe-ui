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


<jsp:include page="./NavBar.jsp" />

<div style="background-color: #607d8b26;">
<div class="container">
  <h2>Prime News</h2>  
  <div id="myCarousel" class="carousel slide primeNewsMoreContent row" data-ride="carousel" data-interval="false">
    <!-- Indicators -->
  

    <!-- Wrapper for slides -->
    <div class="carousel-inner ">
    
    <s:iterator value="newsList" status="stat">
    
    
    <s:if test="%{#stat.count == 1 }">
    		<div class="item active row primeNewsItem">
    
    </s:if>
    <s:elseif test="%{  #stat.count % 12 == 1}">
    	<div class="item row primeNewsItem">
    </s:elseif>
    
    <div class="col-md-3 primeNewsListDiv">
    
      <div >
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
				<span class="col-md-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
				
		</div>	
      
      <s:if test="%{ #stat.count > 0 &&  #stat.count % 12 ==  0}">
      
      	</div>
      </s:if>
      
      </s:iterator>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control primeNewsArrows" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control primeNewsArrows" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	

       


<script type="text/javascript">



$(document).ready(function(){
	

        //YOUR CODE

 
	
   $('.carousel').carousel();
        
});

</script>
</body>
</html>