<%@page import="com.bean.Student"%>
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

	<jsp:useBean id="stu"  class="com.bean.Student"></jsp:useBean>
	<jsp:setProperty property="id" name="stu"/>
	
	<%
		int i= StudentDAO.Delete(stu);
	
		if(i>0)
		{
			//out.println("delete done......");
			response.sendRedirect("view.jsp");
		}
		else{
			out.println("delete is not yet done......");
		}
	%>

</body>
</html>