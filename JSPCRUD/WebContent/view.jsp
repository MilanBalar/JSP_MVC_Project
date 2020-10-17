<%@page import="com.DAO.StudentDAO"%>
<%@page import="com.bean.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	List<Student> list= StudentDAO.getallData();
	request.setAttribute("studata", list);
%>

<table border="1">
	<tr>
		
			<th>Id</th>
			<th>Name</th>
			<th>Contact</th>
			<th>Email</th>
			<th>City</th>
			<th>Delete</th>
			<th>Edit</th>
			
	</tr>
	
	<c:forEach items="${studata}" var="s">
		<tr>
			<td>${s.getId()}</td>
			<td>${s.getSname()}</td>
			<td>${s.getScontact()}</td>
			<td>${s.getSemail()}</td>
			<td>${s.getScity()}</td>
			<td><a href="Delete.jsp?id=${s.getId()}">Delete</a></td>
			<td><a href="Edit.jsp?id=${s.getId()}">Edit</a></td>
			
		</tr>
	</c:forEach>
	
</table>
</body>
</html>





