<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseConfiguration"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
  try {
	  Class.forName("com.mysql.cj.jdbc.Driver");  
	  Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
			   "bfeb87d5f03af0","ce5d6745");
	  
	  out.write("Connected!");
	  out.write("<br/>");
	  
	  String environment = System.getenv("Entorno");
	  out.write("The environment is : "  + environment);

	  
	  DatabaseConfiguration dc=new DatabaseConfiguration();
	  out.write(dc.getPropValues());
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
<br/>
<a href="<%= response.encodeURL(request.getContextPath() + "/addGuest.jsp") %>">Add Guest</a>

<br/>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>">Show Guests</a>
</body>
</html>
