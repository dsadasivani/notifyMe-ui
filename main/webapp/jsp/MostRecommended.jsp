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
		<span> Most Recommended</span>
	</div>	
	

<s:iterator value="recommendedNewsList" status="stat">
<s:if test="%{#stat.index < 10}">
		<div class="row" style="">
				
		
				<div class="col-md-12 col-xs-12" style="padding-left: 1rem;color:black;padding-top: 1rem;">
				<div class="col-md-1 col-xs-1">
						<i class="fa fa-caret-right" style="padding: 0px;width: 15px;color: darkorange;font-size: 20px;"></i>
						<%-- <span class="glyphicon glyphicon-triangle-right" style="color:darkorange;padding-top: 0.3rem;"></span> --%>
					</div>
					<div class="col-md-11 col-xs-11 mostRecommendedRow">
					
					<span>
					<s:url action="detailsPage" var="urlTag" escapeAmp="false">
					    <s:param name="id"><s:property value="id"/></s:param>
					    <s:param name="sector"><s:property value="sector"/></s:param> 
					</s:url>
					<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;"><s:property value="shortNews"/>RBI allows one-time restructuring of MSME loans of up to Rs 25 crore</a> 
					</span>
					</div>
					<!--<div class="row">
					<span style="margin-top:1rem;"><s:property value="displayDate"/>Sat,12 January '19 09:00 AM IST </span>
					</div>-->
					
				</div>
			</div> 
</s:if>
</s:iterator>
</body>
</html>