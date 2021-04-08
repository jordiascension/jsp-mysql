<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
  try {
	  	  
      DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
      
      Class.forName("com.mysql.cj.jdbc.Driver");  
	  Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
			  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
	  
	  out.write(databaseProperties.getPropiedad("server") + " Connected!");
	  out.write("<br/>");
	 
	  //Reiniciar el puto eclipse
	  String environment = System.getenv("Entorno");
	  out.write("The environment is : "  + environment);
	  
	  out.write("<br/>");
	
  }
  catch(Exception e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
<br/>
<a href="<%= response.encodeURL(request.getContextPath() + "/addGuest.jsp") %>">Add Guest</a>

<br/>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>">Show Guests</a>
</body>
</html>
