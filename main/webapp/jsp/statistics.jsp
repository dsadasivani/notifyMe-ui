<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1"
   pageEncoding = "ISO-8859-1"%>
<%@ taglib prefix = "s" uri = "/struts-tags"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.notifyme.actions.NseUtil" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%  
String n=(String)(request.getParameter("val"));  
java.util.Map dataMap=new HashMap();
dataMap=com.notifyme.actions.NseUtil.getData(n);



for(int i=0;i<=dataMap.size();i++)  
{
out.print(dataMap.get(i)+"<br>");  
}
%>