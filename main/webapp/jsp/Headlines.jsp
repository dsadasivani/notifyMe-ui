<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
   pageEncoding = "ISO-8859-1"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body >
<!-- <p><font color="red"><s:property value = "sensexlastprice" /></font></p>-->
	<!-- <div style="font-size: x-large;margin-bottom: 2rem;text-align: center;font-weight: 500;margin-top: 2rem;">
		<span style="border-bottom: 5px solid;
    border-bottom-color: #FF5722;"> Trending</span>
	</div> -->
	<div class="headlinesTitle desktopHeaderNav">
		<span>Prime News <s:url action="primeNewsMore" var="primeMoreTag" escapeAmp="false">
					</s:url>
		<a href="<s:property value="#primeMoreTag" />" class="primeNewsViewMoreLink">View More</a>
		
		</span>
	</div>	
	 <div class="row headlinesContentRow" >
	  
		<div class="col-md-11 headlinesMb">
		<div class="row headinesRow">	
		<s:iterator value="newsList" status="stat">
		<s:if test="%{#stat.index < 3}">
		
		<div class="col-lg-4 headlinesCell">
			<div class="row headlinesCellRow">
				<div class="col-lg-4 col-xs-6 xsheadlinesdiv">
					<s:if test="imageUrl == null">
						 <img src="./images/news_default_image.jpg" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
						 </s:if>
					 <s:else>
							<img src="<s:property value="imageUrl"/>" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
					</s:else>
				</div>
			
				<div class="col-lg-7 col-xs-6 xsheadlinescontent">
					<div class="row headlinesArticle">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" class="headlinesTilesContent"><s:property value="shortNews"/></a> 
			 		
					
					</div>
					<div class="row paddingTopOneRem">
						<span class="col-md-6"><s:property value="displayDate"/></span>
						<span class="col-md-6">
						<span class="headlinesStockText">BHEL</span>  
						<span class="textBold color-green">1.27%</span>
						<span id="caret" class="fa fa-caret-up headlinesCaretUP" style="color:green;"></span>
					</span>
			 			<%-- <span><s:property value="displayDate"/> </span> --%>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
			 		</div>
			 	</div>
				
			</div>
	
		</div>
		</s:if>
		</s:iterator>
		</div>
		
		<div class="row headinesRow">	
		<s:iterator value="newsList" status="stat">
		<s:if test="%{#stat.index > 2 && #stat.index <6}">
		
					<div class="col-lg-4 headlinesCell">
			<div class="row headlinesCellRow">
				<div class="col-lg-4 col-xs-6 xsheadlinesdiv">
					<s:if test="imageUrl == null">
						 <img src="./images/news_default_image.jpg" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
						 </s:if>
					 <s:else>
							<img src="<s:property value="imageUrl"/>" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
					</s:else>
				</div>
			
				<div class="col-lg-7 col-xs-6 xsheadlinescontent">
					<div class="row headlinesArticle">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" class="headlinesTilesContent"><s:property value="shortNews"/></a> 
			 		
					
					</div>
					<div class="row paddingTopOneRem">
						<span class="col-md-6"><s:property value="displayDate"/></span>
						<span class="col-md-6">
						<span class="headlinesStockText">BHEL</span>  
						<span class="textBold color-green">1.27%</span>
						<span id="caret" class="fa fa-caret-up headlinesCaretUP" style="color:green;"></span>
					</span>
			 			<%-- <span><s:property value="displayDate"/> </span> --%>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
			 		</div>
			 	</div>
				
			</div>
	
		</div>
		</s:if>
		</s:iterator>
		</div>
		
			<div class="row headinesRow">	
		<s:iterator value="newsList" status="stat">
		<s:if test="%{#stat.index > 5 && #stat.index <9}">
		
					<div class="col-lg-4 headlinesCell">
			<div class="row headlinesCellRow">
				<div class="col-lg-4 col-xs-6 xsheadlinesdiv">
					<s:if test="imageUrl == null">
						 <img src="./images/news_default_image.jpg" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
						 </s:if>
					 <s:else>
							<img src="<s:property value="imageUrl"/>" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
					</s:else>
				</div>
			
				<div class="col-lg-7 col-xs-6 xsheadlinescontent">
					<div class="row headlinesArticle">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" class="headlinesTilesContent"><s:property value="shortNews"/></a> 
			 		
					
					</div>
					<div class="row paddingTopOneRem">
						<span class="col-md-6"><s:property value="displayDate"/></span>
						<span class="col-md-6">
						<span class="headlinesStockText">BHEL</span>  
						<span class="textBold color-green">1.27%</span>
						<span id="caret" class="fa fa-caret-up headlinesCaretUP" style="color:green;"></span>
					</span>
			 			<%-- <span><s:property value="displayDate"/> </span> --%>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
			 		</div>
			 	</div>
				
			</div>
	
		</div>
		</s:if>
		</s:iterator>
		</div>
	
			
		</div>
	</div>


<script>
function highlightIndex(){
	//alert('called');
}

$(document).ready(function(){
	//alert('called');
});
</script>
</body>
</html>