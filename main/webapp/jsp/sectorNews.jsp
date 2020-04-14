<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "s" uri = "/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div class="headlinesTitle">
		<span> LATEST NEWS</span>
	</div>	
	
<div class="">
	<div class="row">
        <div class="col-md-12">
          <!-- Nav tabs -->
          <div class="card">
   <ul class="nav nav-tabs sector-tabs" role="tablist">
       <li role="presentation" class="active"><a href="#banking" aria-controls="home" role="tab" data-toggle="tab">Banking</a></li>
       <li role="presentation"><a href="#pharma" aria-controls="profile" role="tab" data-toggle="tab">Pharma</a></li>
       <li role="presentation"><a href="#it" aria-controls="messages" role="tab" data-toggle="tab">IT</a></li>
       <li role="presentation"><a href="#automobiles" aria-controls="settings" role="tab" data-toggle="tab">Automobiles</a></li>
       <li role="presentation"><a href="#oilAndGas" aria-controls="settings" role="tab" data-toggle="tab">Oil & Gas</a></li>
       <li role="presentation"><a href="#nbfc" aria-controls="settings" role="tab" data-toggle="tab">NBFC</a></li>
   </ul>

          <!-- Tab panes -->
    <div class="tab-content sectorNewsPanel">
        <div role="tabpanel" class="tab-pane active" id="banking">
     		<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 1rem;border-bottom-width: thin;padding-top: 1rem;">
				
				 <div class="col-md-3">
				 <s:if test="imageUrl == null">
				 <img src="./images/news_default_image.jpg" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				 
				 </s:if>
				 <s:else>
					<img src="<s:property value="imageUrl"/>" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				</s:else>
	
					
				</div>
				<div class="col-md-8" style="padding-left: 1rem;color:black;">
					<div class="row" style="height:5rem;">
					<span>
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/>RBI allows one-time restructuring of MSME loans of up to Rs 25 crore</a> 
					</span>
					</div>
					<div class="row">
					<span style="margin-top:1rem;"><s:property value="displayDate"/>Sat,12 January '19 09:00 AM IST </span>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
					</div>
					
				</div>
			</div> 
			
			<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 1rem;border-bottom-width: thin;padding-top: 1rem;">
				
				 <div class="col-md-3">
				 <s:if test="imageUrl == null">
				 <img src="./images/news_default_image.jpg" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				 
				 </s:if>
				 <s:else>
					<img src="<s:property value="imageUrl"/>" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				</s:else>
	
					
				</div>
				<div class="col-md-8" style="padding-left: 1rem;color:black;">
					<div class="row" style="height:5rem;">
					<span>
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/>RBI allows one-time restructuring of MSME loans of up to Rs 25 crore</a> 
					</span>
					</div>
					<div class="row">
					<span style="margin-top:1rem;"><s:property value="displayDate"/> Sat,12 January '19 09:00 AM IST</span>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
					</div>
					
				</div>
			</div> 
			
			<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 1rem;border-bottom-width: thin;padding-top: 1rem;">
				
				 <div class="col-md-3">
				 <s:if test="imageUrl == null">
				 <img src="./images/news_default_image.jpg" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				 
				 </s:if>
				 <s:else>
					<img src="<s:property value="imageUrl"/>" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				</s:else>
	
					
				</div>
				<div class="col-md-8" style="padding-left: 1rem;color:black;">
					<div class="row" style="height:5rem;">
					<span>
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/>RBI allows one-time restructuring of MSME loans of up to Rs 25 crore</a> 
					</span>
					</div>
					<div class="row">
					<span style="margin-top:1rem;"><s:property value="displayDate"/> Sat,12 January '19 09:00 AM IST</span>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
					</div>
					
				</div>
			</div> 
			
			<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 1rem;border-bottom-width: thin;padding-top: 1rem;">
				
				 <div class="col-md-3">
				 <s:if test="imageUrl == null">
				 <img src="./images/news_default_image.jpg" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				 
				 </s:if>
				 <s:else>
					<img src="<s:property value="imageUrl"/>" class="img-responsive" alt="Cinque Terre" style="width:10rem;min-height: 7rem;max-height: 7rem;">
				</s:else>
	
					
				</div>
				<div class="col-md-8" style="padding-left: 1rem;color:black;">
					<div class="row" style="height:5rem;">
					<span>
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/>RBI allows one-time restructuring of MSME loans of up to Rs 25 crore</a> 
					</span>
					</div>
					<div class="row">
					<span style="margin-top:1rem;"><s:property value="displayDate"/> Sat,12 January '19 09:00 AM IST</span>
						<!--<span style="margin-top:1rem;">8:00 AM | 04 Dec </span>-->
					</div>
					
				</div>
			</div> 
     	
        </div>
        <div role="tabpanel" class="tab-pane" id="pharma">
        			<div class="row">
     			<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" class="headlinesTilesContent">
							PSU banks extend gains; BoB, BoI, PNB hit 3-month highs
					</a> 
			 		
     			
     		</div>
     		<div class="row">
     			<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" class="headlinesTilesContent">
							PSU banks extend gains; BoB, BoI, PNB hit 3-month highs
					</a> 
			 		
     			
     		</div>
     		<div class="row">
     			<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" class="headlinesTilesContent">
							PSU banks extend gains; BoB, BoI, PNB hit 3-month highs
					</a> 
			 		
     			
     		</div>
        
        </div>
        <div role="tabpanel" class="tab-pane" id="it">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</div>
        <div role="tabpanel" class="tab-pane" id="automobiles">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passage..</div>
        <div role="tabpanel" class="tab-pane" id="oilAndGas">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passage..</div>
        <div role="tabpanel" class="tab-pane" id="nbfc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passage..</div>
    </div>
		</div>
      </div>
	</div>
</div>

</body>
</html>