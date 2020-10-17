<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="com.DAO.StudentDAO"%>
<%@page import="com.bean.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="stu"  class="com.bean.Student"/>
	<jsp:setProperty property="*" name="stu" />
	

	<%
		int i=StudentDAO.UpdateData(stu);
		if(i>0)
		{
			response.sendRedirect("view.jsp");
			
		}
		else
		{
			out.println("Data not updated yet");
		}
		
	%>
</body>
</html>