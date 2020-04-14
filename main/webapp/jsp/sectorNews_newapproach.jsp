<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "s" uri = "/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div class="row sectorsScrollOuter">
<div class="row sectorsDiv">
	<s:iterator value="sectornewsList" status="stat">
	<s:if test="%{#stat.index == 0}">
			<div class="col-xs-2 xssectorTabs currentSctHL <s:property value="key" />" onclick="renderCurrentSct('<s:property value="key" />')"><s:property value="key" /></div>
	</s:if>
	<s:else>
			<div class="col-xs-2 xssectorTabs <s:property value="key" />" onclick="renderCurrentSct('<s:property value="key" />')"><s:property value="key" /></div>
	</s:else>
		
	</s:iterator>
</div>
</div>

<div class="row sectorMbView">
<s:iterator value="sectornewsList" status="stat">
	<s:if test="%{#stat.index == 0}">
			<div class="col-lg-4 sectorNewsDiv " id="<s:property value="key"/>" style="display:block;">
	<%-- <div class="row sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div> --%>
  
	  <s:iterator value="value" status="itr">
		
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsHeadlinesCellRow">
				<div class="col-lg-4 col-xs-4 sctNwsxsheadlinesdiv">
					<s:if test="imageUrl == null">
						 <img src="./images/news_default_image.jpg" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
						 </s:if>
					 <s:else>
							<img src="<s:property value="imageUrl"/>" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
					</s:else>
				</div>
			
				<div class="col-lg-7 col-xs-8 sctnwsxsheadlinescontent">
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
			</s:if>
	</s:iterator>
	
	<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">Read More</span>
	</div>
	</s:if>
	
	</div>
	
	</s:if>
	<s:else>
			<div class="col-lg-4 sectorNewsDiv " id="<s:property value="key"/>" style="display:none;">
	<%-- <div class="row sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div> --%>
  
	  <s:iterator value="value" status="itr">
	
		   <s:if test="%{#itr.index <4 }">
  					<div class="row sectorNewsHeadlinesCellRow">
				<div class="col-lg-4 col-xs-4 sctNwsxsheadlinesdiv">
					<s:if test="imageUrl == null">
						 <img src="./images/news_default_image.jpg" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
						 </s:if>
					 <s:else>
							<img src="<s:property value="imageUrl"/>" class="img-responsive headlinesTilesImage" alt="Cinque Terre" >
					</s:else>
				</div>
			
				<div class="col-lg-7 col-xs-8 sctnwsxsheadlinescontent">
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
			</s:if>
	</s:iterator>
	
	<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">Read More</span>
	</div>
	</s:if>
	
	</div>
	
	</s:else>


	
</s:iterator>
</div>

<div class="sectorDesktopView">
<div class="row" >
<s:iterator value="sectornewsList" status="stat">

<s:if test="%{#stat.index == 0}">
<div class="col-lg-4 sectorNewsDiv">
	<div class="sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div>
  
	  <s:iterator value="value" status="itr">
		  <s:if test="%{#itr.index == 0}">
			  <div class="sectorNewsImgDiv">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
		  </s:if>
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsRow" >
				
				<div class="col-md-12 sectorNewsInnerRow col-xs-11">
					<div class="row sectorNewsContent">
					<div class="col-md-1 col-xs-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>
					
					<span class="col-md-11 col-xs-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param>
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
	
	<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">Read More</span>
	</div>
	</s:if>
	
	</div>
</s:if>

<s:if test="%{#stat.index == 1}">
<div class="col-lg-4 sectorNewsDiv">
	<div class="sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div>
  
	  <s:iterator value="value" status="itr">
		  <s:if test="%{#itr.index == 0}">
		  		<div class="sectorNewsImgDiv">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
		  </s:if>
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsRow" >
			
				<div class="col-md-12 col-xs-11 sectorNewsInnerRow">
					<div class="row sectorNewsContent">
					<div class="col-md-1 col-xs-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>
					
					<span class="col-md-11 col-xs-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
		
		<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">Read More</span>
	</div>
	</s:if>
	
	</div>
</s:if>

<s:if test="%{#stat.index == 2}">
<div class="col-lg-4 sectorNewsDiv">
	<div class="sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div>
  
	  <s:iterator value="value" status="itr">
		  <s:if test="%{#itr.index == 0}">
		  		<div class="sectorNewsImgDiv">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
		  </s:if>
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsRow" >
				<div class="col-md-12 col-xs-11 sectorNewsInnerRow">
					<div class="row sectorNewsContent">
					<div class="col-md-1 col-xs-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>
					
					<span class="col-md-11 col-xs-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
	
	<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">Read More</span>
	</div>
	</s:if>
	
	</div>
</s:if>



</s:iterator>

</div>


<div class="row" style="margin-top:2rem;">
<s:iterator value="sectornewsList" status="stat">

<s:if test="%{#stat.index == 3}">
<div class="col-lg-4 sectorNewsDiv">
	<div class="sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div>
  
	  <s:iterator value="value" status="itr">
		  <s:if test="%{#itr.index == 0}">
		  		 <div class="sectorNewsImgDiv">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
		  </s:if>
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsRow" >
				<div class="col-md-12 col-xs-11 sectorNewsInnerRow">
					<div class="row sectorNewsContent">
					<div class="col-md-1 col-xs-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>
					
					<span class="col-md-11 col-xs-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
		
	<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">Read More</span>
	</div>
	</s:if>
	
	</div>
</s:if>

<s:if test="%{#stat.index == 4}">
<div class="col-lg-4 sectorNewsDiv">
	<div class="sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div>
  
	  <s:iterator value="value" status="itr">
		  <s:if test="%{#itr.index == 0}">
		  		 <div class="sectorNewsImgDiv">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
		  </s:if>
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsRow" >
				<div class="col-md-12 col-xs-11 sectorNewsInnerRow">
					<div class="row sectorNewsContent">
					<div class="col-md-1 col-xs-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>
					
					<span class="col-md-11 col-xs-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
		<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">
		<s:url action="sectorNewsListView" var="readMoreTag" escapeAmp="false">
					    <s:param name="sector"><s:property value="key" /></s:param> 
					</s:url>
		<a href="<s:property value="#readMoreTag" />" style="color: rgb(118, 118, 118);font-weight: 600;">Read More</a>
		</span>
	</div>
	</s:if>
	
	</div>
</s:if>

<s:if test="%{#stat.index == 5}">
<div class="col-lg-4 sectorNewsDiv">
	<div class="sectorNewsHeading">
	<span class="headlinesTitle"><s:property value="key" /> </span>
	<span class="sectorNewsTitle glyphicon glyphicon-forward"></span>
	</div>
	  <s:iterator value="value" status="itr">
		  <s:if test="%{#itr.index == 0}">
		  		 <div class="sectorNewsImgDiv">
			  		 <s:if test="imageUrl == null">
							 <img src="./images/news_default_image.jpg" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							 </s:if>
							 <s:else>
								<img src="<s:property value="imageUrl"/>" class="img-responsive sectorNewsImg" alt="Cinque Terre" >
							</s:else>
				</div>
		  </s:if>
		   <s:if test="%{#itr.index <4 }">
  			<div class="row sectorNewsRow" >
				<div class="col-md-12 col-xs-11 sectorNewsInnerRow">
					<div class="row sectorNewsContent">
					<div class="col-md-1 col-xs-1 nwesDotDiv">
						<span class="newsdot "></span>
					</div>
					
					<span class="col-md-11 col-xs-11">
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					    <s:param name="newsKey"><s:property value="newsKey"/></s:param>
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/></a> 
					</span>
					</div>
					<%-- <div class="row">
					<span style="margin-top:1rem;"> <s:property value="displayDate"/>  </span>
					</div> --%>
					
				</div>
			</div> 
			</s:if>
	</s:iterator>
	<s:if test="#stat.count >4">
	<div class="">
		<span class="moreIcon">
		<s:url action="sectorNewsListView" var="readMoreTag" escapeAmp="false">
					    <s:param name="sector"><s:property value="key" /></s:param> 
					</s:url>
		<a href="<s:property value="#readMoreTag" />" style="color: rgb(118, 118, 118);font-weight: 600;">Read More</a>
		</span>
	</div>
	</s:if>
	</div>
</s:if>



</s:iterator>

</div>

</div>
<script type="text/javascript">




var $ = jQuery.noConflict();

$(document).ready(function() {
	var sectorlen = $('.xssectorTabs').length;
	 var container_width =140 * sectorlen;
	   $(".sectorsDiv").css("width", container_width);
	
});
	
	
	function renderCurrentSct(scid){
		$(".currentSctHL").removeClass('currentSctHL');
		$("."+scid).addClass('currentSctHL');
		$('.sectorNewsDiv').css("display","none");
		$("#"+scid).css("display","block");
	}
	
	</script>


</body>
</html>