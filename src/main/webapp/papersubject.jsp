<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Subject Names</title>
    <link rel="icon" href="tabimg.png" type="image/icon png">
    <link rel="stylesheet" href="./css/Student04.css">
</head>
<body>
<%@ include file="navbar_stu.jsp" %>
<marquee>Verify All details and then start exam, if Any issue is there in deatils kindly contact your institution</marquee>
<div class="main">
<!--     <div class="container1">
        <h1 class="desc">Captured Images</h1>
        <div class="imgbx">
            <img class="img1" src="./sample.png">
            <img class="img2" src="./sample.png">
        </div>
 -->


    <div class="container2">
        <h1 class="desc">Details</h1>
        <div class="info">

<% String studentname = (String)session.getAttribute("name");
String studentprn = (String)session.getAttribute("prn");
String studentemail = (String)session.getAttribute("email");
String studentpassword = (String)session.getAttribute("password");
String studentbatch = (String)session.getAttribute("batch");
%>
<h3>PRN: <%= studentprn %> </h3>
<h3>Name: <%= studentname %> </h3>
<h3>Email: <%= studentemail %> </h3>
<h3>Batch: <%= studentbatch %> </h3>
<h3>Subject Names</h3>

<form action="ExamQuestions.jsp" method="post">
        <h3>Select Subject: </h3>
        <select class="dpd" name="SubjectName" required>
            <option value="" disabled selected>Select a Subject</option>
            <% 
            
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("online_exam");
            MongoCollection<Document> collection = database.getCollection("selectedSubject");

            FindIterable<Document> documents = collection.find();
            for (Document document : documents) {
             %>
            <option value="<%= document.get("SubjectName") %>" id="subjects"><%= document.get("SubjectName") %></option>
            <%
                    }
                    mongoClient.close();
                    %>
        </select>
</div>
</div>
</div>
    </div>
<div class="sbtn">
    <button class="start" type="submit">Start</button>
    </form>
</div>
    <div class="cpy">
        <p>&copy; Group 41 (Mini Project)</p>
    </div>
<script src="./js/Student04.js"></script>
</body>
</html>
