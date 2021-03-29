<%@ page import="java.sql.*"%>
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
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>

</body>
</html>
