<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.sql.*" %>
<html>
<body>
<h1>JDBC Connection Update</h1>

<form method="GET" action="updateGuest.jsp">
<input type="text" value="<%=request.getParameter("firstname") %>" name="firstnameUpdated">
<input type="text" value="<%=request.getParameter("lastname") %>" name="lastnameUpdated">
<input type="text" value="<%=request.getParameter("email") %>" name="emailUpdated">
<input type="hidden" value="UPDATE" name="update">
<input type="hidden" value="<%=request.getParameter("id") %>" name="id">
<button type="submit">Update</button>
</form>

<% 
    if(request.getParameter("update") != null){
        try {
            String id = request.getParameter("id");
            String firstnameUpdated = request.getParameter("firstnameUpdated");
            String lastnameUpdated = request.getParameter("lastnameUpdated");
            String emailUpdated = request.getParameter("emailUpdated");
            Class.forName("com.mysql.cj.jdbc.Driver");
    
            Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
 				   "bfeb87d5f03af0","ce5d6745");
            Statement st = conn.createStatement();
            out.write("UPDATE myguests SET firstname='"+firstnameUpdated+"', lastname='"+lastnameUpdated+"', email='"+emailUpdated+"' WHERE id="+id);
            st.executeUpdate("UPDATE myguests SET firstname='"+firstnameUpdated+"', lastname='"+lastnameUpdated+"', email='"+emailUpdated+"' WHERE id="+id);
            conn.close();
            response.sendRedirect(request.getContextPath() + "/showGuests.jsp");
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
%>


<br>
<a href="<%= response.encodeURL(request.getContextPath() + "/showGuests.jsp") %>"> Show Guests </a>
<a href="<%= response.encodeURL(request.getContextPath() + "/index.jsp") %>"> Go to insert Guests </a>
</body>
</html>