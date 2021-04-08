<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<html>
<body>
<% 
    try {
        String id = request.getParameter("id");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
 			   "bfeb87d5f03af0","ce5d6745");
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