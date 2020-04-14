<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
   pageEncoding = "ISO-8859-1"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body onload="highlightIndex();">
<!-- <p><font color="red"><s:property value = "sensexlastprice" /></font></p>-->

<s:iterator value="marketindicators" status="status">


<div class="row" style="border-bottom: 1px solid;border-bottom-color: rgba(0,0,0,0.2);padding-bottom: 2%;padding-top: 2%;">
  
  
  <s:if test="direction == 1">
		<div class="col-sm-3" style="border-left: 1px solid;border-left-color: green;border-left-width: thick;padding-left: 5px;font-weight: bold;">
			<s:property value="indicatorName"/>
		</div>
	</s:if>
	<s:else>
		<div class="col-sm-3" style="border-left: 1px solid;border-left-color: red;border-left-width: thick;padding-left: 5px;font-weight: bold;">
		<s:property value="indicatorName"/>
		</div>
	</s:else>
				
  <div class="col-sm-3" style="color: black;"><s:property value="lastPrice"/></div>
  <div class="col-sm-2" style="text-align: right;">   <s:if test="direction == 1">
					<b style="padding-top: 0.25rem;color: green;" > <s:property value="change"/></b>
				</s:if>
				<s:else>
					<b style="padding-top: 0.25rem;color: red;" > <s:property value="change"/></b>
				</s:else></div>
  	<div class="col-sm-3">
  		<s:if test="direction == 1">
					<b style="padding-top: 0.25rem;color: green;"> <s:property value="percentchange"/>% </b> 
		</s:if>
		<s:else>
					<b style="padding-top: 0.25rem;color: red;"> <s:property value="percentchange"/>% </b> 
	    </s:else>
      </div>
      
      <s:if test="direction == 1">
					<div id="caret" class="col-sm-1 fa fa-caret-up" style="color:green;"></div> 
		</s:if>
		<s:else>
					<div id="caret" class="col-sm-1 fa fa-caret-down" style="color:red;"></div> 
	    </s:else>
	    
	    
      
</div>
		
</s:iterator>




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