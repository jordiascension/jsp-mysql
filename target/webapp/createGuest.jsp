<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	
	String first_name=request.getParameter("first_name");
	String last_name=request.getParameter("last_name");
	String email=request.getParameter("email");
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
				   "bfeb87d5f03af0","ce5d6745");
		out.write("Connected!");
		
		Statement st=conn.createStatement();
		
		int i=st.executeUpdate("INSERT INTO myguests(firstname, lastname, email) values('"+first_name+"','"+last_name+"','"+email+"')");
		out.println("Data is successfully inserted!");
		
	}
	catch(SQLException e){
		out.println("SQL Exception caught: " + e.getMessage());
	}
	
	
%>
</body>
</html>