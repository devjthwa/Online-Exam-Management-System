<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<html>

<head>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
<!-- <div class="managesubjects">
        <h2>Add Subject</h2>
    <form action="../ManageSubject" method="post">
        <label>Subject Name: </label>
        <input type="text" name="collectionName" required>
        <label>Subject Code: </label>
        <input type="text" name="collectionCode" >
<p style="color: red;">Note : Add Subject Name Properly. You can't Modify It</p>
        <button type="submit">Add</button>
        </form> 
        </div> -->
        <div class="ursubjects"> 
<form action="../ManageSubject" method="get">
<h2>Subject List</h2>
    <table>
        <thead>
            <tr>
                <th>Subject</th>
                <!-- <th>Remove</th> --> <!-- Add a Remove column -->
            </tr>
        </thead>
        <tbody>
            <%
            // Java code to fetch and populate collection names
            
            try {
                MongoClient mongoClient = new com.mongodb.MongoClient("localhost", 27017);
                MongoIterable<String> collectionNames = mongoClient.getDatabase("Subjects").listCollectionNames();
                for (String collectionName : collectionNames) {
            %>
            <tr>
                <td><%= collectionName %></td>

                <%-- <td>
                    <a href="../ManageSubject?action=remove&collectionName=<%=collectionName%>">Remove</a>
                </td> --%>
            </tr>
            <%
                }
                mongoClient.close();
            } catch (Exception ex) {
                out.println("Failed to fetch Subject names: " + ex.getMessage());
            }
            %>
        </tbody>
    </table>
</form>

        </div>
    <jsp:include page="footer_faculty.jsp"></jsp:include>
    
</body>
</html>