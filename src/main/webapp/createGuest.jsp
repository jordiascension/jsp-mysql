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
  try {
	  Class.forName("com.mysql.cj.jdbc.Driver");  
	  Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
			   "bfeb87d5f03af0","ce5d6745");
			  out.write("Connected!");
	  Statement st = conn.createStatement();

	  // note that i'm leaving "date_created" out of this insert statement
	  st.executeUpdate("INSERT INTO myguests (firstname, lastname, email) "
		          +"VALUES ('Juan', 'Soto', 'juansoto@gmail.com')");

	  out.write("guest Juan inserted!");
	  conn.close();
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
</body>
</html>