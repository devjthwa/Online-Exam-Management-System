<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="org.bson.Document" %>
<%@ page import="org.bson.types.ObjectId" %>
<%@ page import= "javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
    <meta charset="UTF-8">
    <title>Add Questions</title>
    <script type="text/javascript">
        function confirmRemove(questionId) {
            if (confirm("Are you sure you want to remove this question?")) {
                window.location.href = "ManageQuestions?question" + questionId; // Pass the _id
            }
        }
    </script>
</head>
<body>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
<%
String subjectName = (String)session.getAttribute("subjectname");
%>
<h2>Add Questions</h2>
<div class="urstudents">
<form action="../ManageQuestions" method="post">
    <label>This question will be add in <%= subjectName %> </label><br><br>
    
	
    <label>Question: </label>
    <textarea name="question" rows="4" cols="50" required></textarea><br><br>

    <label>Option A: </label>
    <input type="text" name="optionA" required><br><br>

    <label>Option B: </label>
    <input type="text" name="optionB" required><br><br>

    <label>Option C: </label>
    <input type="text" name="optionC" required><br><br>

    <label>Option D: </label>
    <input type="text" name="optionD" required><br><br>

    <label>Correct Answer: </label>
    <select name="correctAnswer" required>
        <option value="A">Option A</option>
        <option value="B">Option B</option>
        <option value="C">Option C</option>
        <option value="D">Option D</option>
    </select><br><br>

    <button type="submit">Add Question</button>
</form>
    <br>
    <details><summary>See Questions List</summary>
        <table>
        <thead>
            <tr>
            	
                <td>Subject</td>
                <td>Question</td>
                <td>Option A</td>
                <td>Option B</td>
                <td>Option C</td>
                <td>Option D</td>
                <td>Correct Answer</td>
                <td>Remove</td>
            </tr>
            </thead>
            <tbody>
            <%
                
            
            	
                if (subjectName != null) {
                    try {
                        MongoClient mongoClient = new com.mongodb.MongoClient("localhost", 27017);
                        MongoDatabase database = mongoClient.getDatabase("Subjects");
                        MongoCollection<org.bson.Document> collection = database.getCollection(subjectName);
                        MongoCursor<org.bson.Document> cursor = collection.find().iterator();
                        while (cursor.hasNext()) {
                            org.bson.Document doc = cursor.next();
            %>
            <tr>
            	<td><%= subjectName %></td>
                <td><%= doc.getString("question") %></td>
                <td><%= doc.getString("optionA") %></td>
                <td><%= doc.getString("optionB") %></td>
                <td><%= doc.getString("optionC") %></td>
                <td><%= doc.getString("optionD") %></td>
                <td><%= doc.getString("correctAnswer") %></td>
				<td><a href="../ManageQuestions?question=<%= doc.getString("question") %>">Remove</a></td>

            </tr>
            <%
                        }
                        cursor.close();
                        mongoClient.close();
                    } catch (Exception ex) {
                        out.println("Failed to fetch questions: " + ex.getMessage());
                    }
                }
            %>
            </tbody>
        </table>
    </details><br>
</div>
</body>
</html>
