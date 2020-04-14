<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
   pageEncoding = "ISO-8859-1"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body >
<!-- <p><font color="red"><s:property value = "sensexlastprice" /></font></p>-->
<div style="font-size: x-large;text-align: left;font-weight: 500;padding-top: 2%;">
		<span style="color: #337ab7;font-size: large;font-weight: bold;"> International News</span>
	</div>
	<div class="row" style="padding-left: 2rem;">
			
			<div class="col-md-10" style="border-bottom: 5px solid;border-bottom-color: #0c518c;padding-top:1rem;">
		
			
			<s:iterator value="internationalNewsList">
		
		
			<div class="row" style="border-bottom: 1px solid;border-color: rgba(0,0,0,0.2);padding-bottom: 0.5rem;border-bottom-width: thin;padding-top: 0.5rem;">
				
				 <div class="row" style="padding-left: 1rem;color:black;">
					<div class="row" >
					<div class="col-md-1">
						<i class="fa fa-caret-right" style="padding: 0px;width: 15px;color: darkorange;"></i>
						<%-- <span class="glyphicon glyphicon-triangle-right" style="color:darkorange;padding-top: 0.3rem;"></span> --%>
					</div>
					<div class="col-md-10">
					<span>
					<s:url action="detailsPage" var="urlTag" >
					    <s:param name="id"><s:property value="id"/></s:param>
					</s:url>
						<a href="<s:property value="#urlTag" />" style="color: rgb(118, 118, 118);font-weight: 600;" ><s:property value="shortNews"/></a>
					</span>
					</div>
					
					</div>
					
					
				</div>
			</div>
			
			
			
		</s:iterator>
			

			
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