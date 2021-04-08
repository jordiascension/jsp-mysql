<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
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
		DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
	      
	    Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
				  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
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