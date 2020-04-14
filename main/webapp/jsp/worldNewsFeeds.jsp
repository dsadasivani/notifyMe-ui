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
		
	 <div class="row" style="padding-left: 2rem;padding-right: 2rem;font-weight:600;">
	 <div style="font-size: x-large;text-align: left;font-weight: 500;padding-top: 2%;">
		<span style="color: #337ab7;font-size: large;font-weight: bold;"> WORLD NEWS</span>
	</div>
		<div class="col-md-12" style="border-bottom: 5px solid;border-bottom-color: #0c518c;">
			
	<s:property value="worldnewsfeedData" escape="false"/>
    
			
			
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