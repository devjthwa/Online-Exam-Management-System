<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%--   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
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
<link rel="stylesheet" type="text/css" href="styles.css">
 <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<script>
    function confirmRemove(email) {
        if (confirm("Are you sure you want to remove this admin?")) {
            window.location.href = "../RemoveAdmin?email=" + email; // Replace with your servlet URL
        }
    }
</script>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include>
<div class="ursubjects">
<h3>Admin List</h3>
  <table>
        <tr><th>name</th><th>Email</th><th>Password</th><th>edit</th><th>remove</th>
 <% 
            //Java code to fetch and display data from MongoDB
            
            MongoClient mongoClient = new MongoClient("localhost", 27017);
 			MongoDatabase database = mongoClient.getDatabase("online_exam"); 
            MongoCollection<Document> collection = database.getCollection("adminlogin"); 
            
            FindIterable<Document> documents = collection.find();
            
            for (Document document : documents) {
        %>
        <tr>
            <td><%= document.get("name") %></td>
            <td><%= document.get("email") %></td>
            <td><%= document.get("password") %></td>
            <td><a href=../UpdateAdmin?_id=<%= document.get("_id") %>><button>Edit</button></a></td>
            <td><a href="javascript:void(0);" onclick="confirmRemove('<%= document.get("email") %>')"><button>Remove</button></a></td>

            
        </tr>
        <% 
        mongoClient.close();  }
        %>
    </table>
<a href="addAdmin.jsp"><button>Add New Admin</button></a>
</div>
<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
</html>