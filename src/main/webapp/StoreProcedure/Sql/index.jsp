<%@ page language='java' contentType='text/html;charset=iso-8859-1'%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>id</td>
<td>first name</td>
<td>last name</td>
<td>Email</td>

</tr>
<% 
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
				   "bfeb87d5f03af0","ce5d6745");
		out.write("Connected!");
		
		CallableStatement cStmt = conn.prepareCall("{call obtenerProductosPorEstado(?)}");  
		cStmt.setString(1, "disponible");
	      // execute the query, and get a java resultset
	    
        cStmt.execute();    
        final ResultSet resultSet = cStmt.getResultSet(); 
	      
	      // iterate through the java resultset
	    while (resultSet.next())
	    {
%>
			<tr>
			<td><%= resultSet.getInt("id") %></td>
			<td><%= resultSet.getString("nombre") %></td>
			<td><%= resultSet.getString("estado") %></td>
			<td><%= resultSet.getDouble("precio") %></td>
			</tr>
<% 
	     }
	    resultSet.close();
	    cStmt.close();
	    conn.close();
	    }
	    catch (Exception e)
	    {
	      System.err.println("Got an exception! ");
	      System.err.println(e.getMessage());
	    }
	    
%>
</table>
</body>
</html>