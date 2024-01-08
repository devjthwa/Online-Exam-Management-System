<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> subject selection</title>
</head>
<body>

<jsp:include page="navbar_admin.jsp"></jsp:include>
<div class="urstudents">
<form action="../Selectedsubjectsexam" method="post">
        <label>Select Subject: </label>
        <select name="SubjectName" required>
            <option value="" disabled selected>Select a Subject</option>
            
            <% 
                // Java code to fetch and populate collection names
                try {
                    MongoClient mongoClient = new com.mongodb.MongoClient("localhost", 27017);
                    MongoIterable<String> collectionNames = mongoClient.getDatabase("Subjects").listCollectionNames();
                    for (String collectionName : collectionNames) {
            %>
            <option value="<%= collectionName %>" id="subjects"><%= collectionName %></option>
            <%
                    }
                    mongoClient.close();
                } catch (Exception ex) {
                    out.println("Failed to fetch Subject names: " + ex.getMessage());
                }
            %>
        </select>
        <label>Set date</label>
        <input type="date" name= "timer">
        <br><br>
        <input type="submit">
        </form>
        
        
        <div class= "remove">
            <table id="myTable" style="margin-top: 2em;">
    <tbody>
        <tr>
            <th>Subject</th>
            <th>Remove</th>
        </tr>
        <%
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("online_exam");
            MongoCollection<Document> collection = database.getCollection("selectedSubject");

            MongoIterable<Document> documents = collection.find();
            for (Document document : documents) {
        %>
        <tr>
            <td><%= document.get("SubjectName") %></td>
            <td><a href=../RemoveActiveSubject?Subject=<%= document.get("SubjectName")%>><button>Remove</button></a></td>
        </tr>
        <%
            }
            mongoClient.close();
        %>
        </tbody>
    </table>
        </div>
        </div>
<jsp:include page="footer_admin.jsp"></jsp:include>
        
        </body>
</html>