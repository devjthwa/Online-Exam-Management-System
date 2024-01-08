<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoIterable" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Here You can Schedule time of any subject paper</h1>
<form action="../Storelogintime" action="get">
            

<br><br>
       <label for="openTime">Enter Open Time (YYYY-MM-DD HH:MM):</label><br>
        <input type="time" id="openTime" name= "openTime"required value = "openTIme">
        <br><br>
        <label for="closeTime">Enter close Time (YYYY-MM-DD HH:MM):</label><br>
        <input type="time" id="closeTime" name="closeTime" required value = "closeTIme">        
        <br><br>
        
        <input type="submit">
        </form>
            <table>
            <%                 
                try {
                	MongoClient mongoClient = new MongoClient("localhost", 27017);
                	MongoDatabase database = mongoClient.getDatabase("online_exam");
            		MongoCollection<Document> collection = database.getCollection("schedulePaperTime");

            FindIterable<Document> documents = collection.find();
            for (Document document : documents) {
        %>
        <tr>
        <th>Opentime</th>
        <th>Closetime</th>
        <th>Remove</th>
        </tr>
        <tr>
            <td><%= document.get("openTime") %></td>
            <td><%= document.get("closeTime") %></td>
			<td><a href=../RemoveTime?openTime=<%= document.get("openTime")%>><button>Remove</button></a></td>
        </tr>
            <%
                    }
                    mongoClient.close();
                    
                } catch (Exception e) {
                    out.println("Failed to fetch time: " + e.getMessage());
                }
            %>
            </table>
        </body>
</html>