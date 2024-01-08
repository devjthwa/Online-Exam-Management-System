<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Make Paper</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include>
<div class= "makepapers">
    <h2>Subject Names</h2>

    <form action="ViewQuePaper.jsp" method="post">
        <label>Select Subject: </label>
        <select name="subjectName" required>
            
            <% 
                // Java code to fetch and populate collection names
                
                try {
                	MongoClient mongoClient = new MongoClient("localhost", 27017);
                	MongoIterable<String> collectionNames = mongoClient.getDatabase("Subjects").listCollectionNames();
                    for (String collectionName : collectionNames) {
            %>
            <option value="<%= collectionName %>"><%= collectionName %></option>
            <%
                    }
                    mongoClient.close();
                    
                } catch (Exception ex) {
                    out.println("Failed to fetch Subject names: " + ex.getMessage());
                }
            %>
        </select>
        <br>
        <br>
        <button type="submit">View Paper</button>
    </form>
    </div>
    <jsp:include page="footer_admin.jsp"></jsp:include>
</body>
</html>
