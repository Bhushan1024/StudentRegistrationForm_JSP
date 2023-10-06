<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Registration</title>
</head>
<body>
	<%!String name, email, address,query;
	
	int result;
	long contact;
	Connection connection ;
	PreparedStatement preparedStatement;
	
	
	%>
	
	<%

	Class.forName("com.mysql.jdbc.Driver");
	connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/weja2?user=root&password=root");
	query="Insert into registration values (?,?,?,?)";
	preparedStatement=connection.prepareStatement(query);
	
	preparedStatement.setString(1,request.getParameter("name") );
	preparedStatement.setString(2, request.getParameter("email"));
	preparedStatement.setLong(3,Long.parseLong(request.getParameter("contact")));
	preparedStatement.setString(4, request.getParameter("address"));
	result=preparedStatement.executeUpdate();
	
  
	%>
	

	
	
	
	<jsp:include page="index.html"></jsp:include>
	
	<h1 align="center">Student Registration Successful!</h1>
	
	
	
	
	
	
</body>
</html>