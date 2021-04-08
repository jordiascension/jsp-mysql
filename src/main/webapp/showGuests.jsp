<%@ page language='java' contentType='text/html;charset=iso-8859-1'%>
<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
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
		DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
	      
	    Class.forName(databaseProperties.getDatabaseDriver());  
		Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
				  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
		out.write("Connected!");
		
		String query = "SELECT * FROM myguests";

	      // create the java statement
	    Statement st = conn.createStatement();
	      
	      // execute the query, and get a java resultset
	    ResultSet resultSet = st.executeQuery(query);
	      
	      // iterate through the java resultset
	    while (resultSet.next())
	    {
%>
			<tr>
			<td><%= resultSet.getInt("id") %></td>
			<td><%= resultSet.getString("firstname") %></td>
			<td><%= resultSet.getString("lastname") %></td>
			<td><%= resultSet.getString("email") %></td>
				<td><a href="<%= response.encodeURL(request.getContextPath() + "/updateGuest.jsp?id="+ resultSet.getInt("id")+"&firstname="+ 
        resultSet.getString("firstname")+"&lastname="+ resultSet.getString("lastname")+"&email="+ resultSet.getString("email")) %>">Update</a></td>
    	<td><a href="<%= response.encodeURL(request.getContextPath() + "/deleteGuests.jsp?id="+ resultSet.getInt("id"))%>">Delete</a></td>
			</tr>
<% 
	     }
	    resultSet.close();
	    st.close();
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