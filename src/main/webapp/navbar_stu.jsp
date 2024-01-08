<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException, javax.servlet.ServletException, javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Examination Portal || Project Group 42</title>
    <link rel="icon" href="tabimg.png" type="img/icon png">
    <link rel="stylesheet" href=".\css\Student01.css">
	</head>
<body>
<div class="topbar">
        <div class="leftbar">
            <img src="tabimg.png" alt="Logo">
            <h1 class="subtitle"><nobr>Online Exam Portal</nobr></h1>
        </div>
<%
try {
    MongoClient mongoClient = new MongoClient("localhost", 27017);
    MongoDatabase database = mongoClient.getDatabase("online_exam");
    MongoCollection<Document> collection = database.getCollection("students");

    
    String userprn = request.getParameter("prn"); // Replace with the actual email used in login

    // Create a query to find the admin by email
    Document query = new Document("prn", userprn);
    FindIterable<Document> result = collection.find(query);

    String studentName = ""; // Initialize the adminName variable
    String studentPRN = ""; // Initialize the adminName variable
    String studentEmail = ""; // Initialize the adminName variable
    String studentBatch = ""; // Initialize the adminName variable
	String studentPassword = "";
    for (Document document : result) {
        studentName = document.getString("name");
        studentPRN = document.getString("prn");
        studentEmail = document.getString("email");
        studentBatch = document.getString("batch");
        studentPassword = document.getString("password");
    }

    mongoClient.close();
%>
 <%
HttpSession s = request.getSession();

String studentname = (String)session.getAttribute("name");
String studentprn = (String)session.getAttribute("prn");
String studentemail = (String)session.getAttribute("email");
String studentpassword = (String)session.getAttribute("password");
String studentbatch = (String)session.getAttribute("batch");
%>

   <div class="studentinf">
            <h2>Welcome</h2> <p id="sname"><%= studentname %></p>
            <h2>PRN:</h2><p id="sid"><%= studentprn %></p> 
        </div> <!-- Rest of your HTML content -->
 
    </div>
<%
} catch (Exception ex) {
    ex.printStackTrace();
}
%>    
</body>
</html>