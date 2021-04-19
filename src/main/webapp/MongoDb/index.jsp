<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseProperties"%>
<%@ page import="com.mongodb.ConnectionString"%>
<%@ page import="com.mongodb.client.MongoClients"%>
<%@ page import="com.mongodb.client.MongoClient"%>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import="com.mongodb.MongoClientSettings"%>
<html>
<head>
<title>JDBC Connection example</title>
</head>

<body>
<h1>JDBC Connection example</h1>

<%
/*
Documentación del driver para la versión 4 de MongoDb
https://docs.atlas.mongodb.com/driver-connection/
https://docs.mongodb.com/drivers/java/
*/
  try {
	  DatabaseProperties databaseProperties = DatabaseProperties.getInstancia();    
	  
	  ConnectionString connString = new ConnectionString(
			  databaseProperties.getMongoDbConnectionString()
			);
			MongoClientSettings settings = MongoClientSettings.builder()
			    .applyConnectionString(connString)
			    .retryWrites(true)
			    .build();
			MongoClient mongoClient = MongoClients.create(settings);
			MongoDatabase database = mongoClient.getDatabase("netmind");
	  out.write("Conectado a MongoDb Cluster de Atlas");
	
  }
  catch(Exception e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
<br/>
</body>
</html>
