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



</head>
<body style="background-color:#fff;">


<jsp:include page="./NavBar.jsp" />
<s:hidden  value="%{sectornewsList}" name="sectornewsList"  id="sectornewsList"/>

<div class="row ">
<div id="" class="col-xs-offset-1 col-lg-5" >
	<div class="sectorNewsListTitle" id="secttitle">
			Sectors
	</div>
	
	<!--  <div class="row sectorNewsFilterRow	">
		
		<div class="col-md-10 col-lg-10">	
		
		<s:iterator value="sectornewsList" status="stat">
		
			<s:if test="sectorSelected == key ">
			<span class=" sectorNewsFilterItems sectorFilterSelected">
				<s:property value="key" />
			</span>
			</s:if>
			<s:else>
				<span class=" sectorNewsFilterItems">
				<s:property value="key" />
			</span>
			</s:else>
			
		</s:iterator>
		
		
			
		</div>
		
	</div> -->

</div>

	
	
</div>



<div class="container">
  <br>
  <div class="col-md-8" style="width:68%;">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
  <s:iterator value="sectornewsList" status="stat">
  <s:if test="%{#stat.index <10 }">
  
  <s:if test="sectorSelected == key ">
	  <li class="nav-item active">
	      <a class="nav-link " data-toggle="tab" href='#<s:property value="key" />'   onclick='changeSector("<s:property value="key" />")' ><s:property value="key" /></a>
	    </li>
  </s:if>
  <s:else>
  		<li class="nav-item">
      <a class="nav-link " data-toggle="tab" href='#<s:property value="key" />'  onclick='changeSector("<s:property value="key" />")' ><s:property value="key"/></a>
    </li>
  </s:else>
    
    </s:if>
    <!-- <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1"><s:property value="key" /></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">Menu 2</a>
    </li> -->
    </s:iterator>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content sectorPageContent">
  
  
   <!-- <div id="home" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div> -->
   
   
  <s:iterator value="sectornewsList" status="stat">
  
  <s:if test="sectorSelected == key ">
	  <div id='#<s:property value="key" />' class="container tab-pane active"><br>
       <s:iterator value="value" status="itr">
		   <s:if test="%{#itr.index <10 }">
  			<div class="row col-md-8 sectorNewsListRow" >
				
				<div class="col-md-12 sectorNewsListInnerRow">
					<div class="row sectorNewsContent">
					
					 <div class=" col-md-2 ">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsListImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsListImg" alt="Cinque Terre" >
							</s:else>
					</div>
				
				
					<!-- <div class="col-md-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>-->
					<div class="col-md-9 sectorNewsInnerDiv">
					
						<div class="row sectorNewsListInnerRow">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" class="sectorNewsListAnchorText"><s:property value="shortNews"/></a> 
					</div>
					
						<div class="row" style="height: 3rem;">
						
						<div class="col-md-6">
							<s:property value="displayDate"/> 
						</div>
							
							<div class="col-md-3" style="font-size: 14px;width: 20%;">
							    <i class="fa fa-commenting-o facomments" style="margin-left: 10px;font-size: 19px;height: 30px;vertical-align: middle;margin-right: -10px;"></i>
							    20
							</div>
							
							<div class="col-md-3" style="font-size: 14px;width: 20%;padding-left: 0;">
							    <i class="fa fa-thumbs-o-up" style="font-size: 19px;margin-right: -10px;padding-top: 7px;
							    "></i>
							    20
							</div>
			
						</div>					
					
					
					
					
					</div>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
	
    </div>
  </s:if>
  <s:else>
  		<div id='#<s:property value="key" />' class="container tab-pane"><br>
       <s:iterator value="value" status="itr">
		
		   <s:if test="%{#itr.index <10 }">
  			<div class="row col-md-8 sectorNewsListRow" >
				
				<div class="col-md-12 sectorNewsListInnerRow">
					<div class="row sectorNewsContent">
					
					 <div class=" col-md-2 ">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsListImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsListImg" alt="Cinque Terre" >
							</s:else>
					</div>
				
				
					<!-- <div class="col-md-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>-->
					
					<div class="col-md-9 sectorNewsInnerDiv">
					
						<div class="row sectorNewsListInnerRow">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" class="sectorNewsListAnchorText"><s:property value="shortNews"/></a> 
					</div>
					
						<div class="row" style="height: 3rem;">
						
						<div class="col-md-6">
							<s:property value="displayDate"/> 
						</div>
							
							<div class="col-md-3" style="font-size: 14px;width: 20%;">
							    <i class="fa fa-commenting-o facomments" style="margin-left: 10px;font-size: 19px;height: 30px;vertical-align: middle;margin-right: -10px;"></i>
							    20
							</div>
							
							<div class="col-md-3" style="font-size: 14px;width: 20%;padding-left: 0;">
							    <i class="fa fa-thumbs-o-up" style="font-size: 19px;margin-right: -10px;padding-top: 7px;
							    "></i>
							    20
							</div>
			
						</div>					
					
					
					
					
					</div>
					
					
					
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
				
			</div> 
			</s:if>
	</s:iterator>
	
    </div>
  </s:else>
  
  
  	
    
    
    </s:iterator>
   
   		
   
   
  </div>
  
  </div>
</div>



<script type="text/javascript">

$(document).ready(function(){
	
	
});

function changeSector( sectorname){
	var sector = sectorname;
	$( ".active" ).removeClass( "active" );
	$(".tab-pane").each(function(a){
		console.log(a);
		var divid = $(this).attr("id");
		divid = divid.replace("#","");
		if(sector == divid){
			$(this).addClass("active");
			$("#secttitle").click();
		}
	});
	
/*	$(".nav-link").each(function(a){
		console.log(a);
		var divid = $(this).attr("href");
		divid = divid.replace("#","");
		if(sector == divid){
			$(this).addClass("selectedNavLink");
			//$("#secttitle").click();
		}else{
			$(this).removeClass("selectedNavLink");
		}
	});*/
}

</script>
</body>
</html>