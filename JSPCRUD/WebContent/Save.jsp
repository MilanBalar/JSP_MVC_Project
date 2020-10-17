<%@page import="com.DAO.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- index.html na page par thi je data madse tene studnet.java ma save karse -->
	<!-- dont requrid request.get(parameter....) etc.. -->
	
	
	<jsp:useBean id="u" class="com.bean.Student"></jsp:useBean>
	<jsp:setProperty property="*" name="u"/>
	<%
		int i= StudentDAO.save(u);
		if(i>0)
		{
			out.println("Record inserted.......");
			response.sendRedirect("view.jsp");
		}
		else
		{
			out.println("Record Not inserted.......");
			response.sendRedirect("index.jsp");
		}
	%>
	
	
</body>
</html>