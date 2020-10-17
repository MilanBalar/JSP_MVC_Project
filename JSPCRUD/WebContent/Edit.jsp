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
		<%
		//id fatch from view.jsp page and all data store in id;
		int id= Integer.parseInt(request.getParameter("id"));
		//id tansfer to studentDAO method
		Student s= StudentDAO.getDatabyId(id);

		%>
		
		
	<form action="Edit2.jsp" method="get">
		<h1 align="center">edit STudent details</h1>
		<table border="1" align="center">
			<tr>
				<td>ID</td>
				<td><input type="text" name="id" value="<%=s.getId()%>"></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="sname" value="<%= s.getSname()%>"></td>
			</tr>
			<tr>
				<td>contact</td>
				<td><input type="text" name="scontact"  value="<%= s.getScontact()%>"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="semail"  value="<%= s.getSemail()%>"></td>
			</tr>
			<tr>			
				<td>City</td>	
					<td>
					<select name="scity">
						<option>baroda</option>
						<option>s urat</option>
						<option>ahemdabad</option>
						<option>bharuch</option>
						<option>bhavnagar</option>
						</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center" ><input type="submit" value ="Update"></td>
			</tr>
		</table>
	</form>
		

</body>
</html>