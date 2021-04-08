<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<html>
<body>
<% 
    try {
        String id = request.getParameter("id");
        DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();
	      
	    Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
				  databaseProperties.getDatabaseUser(),databaseProperties.getDatabasePwd());
        Statement st = conn.createStatement();
        out.write("DELETE FROM myguests WHERE id="+id);
        st.executeUpdate("DELETE FROM myguests WHERE id="+id);
        conn.close();
        response.sendRedirect(request.getContextPath() + "/showGuests.jsp");
    }catch(SQLException e){
        e.printStackTrace();
    }
%>
</body>
</html>