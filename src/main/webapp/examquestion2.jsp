<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8">
    <title>Subject Questions</title>
    <script>
        var questionNumber = 1;
        
        function showNextQuestion() {
            document.getElementById("question" + questionNumber).style.display = "none";
            questionNumber++;
            var nextQuestion = document.getElementById("question" + questionNumber);
            if (nextQuestion) {
                nextQuestion.style.display = "block";
            } else {
                document.getElementById("submitButton").style.display = "block";
                document.getElementById("nextButton").style.display = "none";
            }
        }
    </script>
</head>
<body>
<%@ include file="navbar_stu.jsp" %>

    <h1 style="text-align: center; margin: 1em;">Subject Questions</h1>

    <form action="GetAnswers" method="post" style="margin: 9em;">
        <%
            String subjectName = request.getParameter("SubjectName");
        	session.setAttribute("subjectname", subjectName);
            if (subjectName != null) {
                try {
                    MongoClient mongoClient = new com.mongodb.MongoClient("localhost", 27017);
                    MongoDatabase database = mongoClient.getDatabase("Subjects");
                    MongoCollection<org.bson.Document> collection = database.getCollection(subjectName);
                    MongoCursor<org.bson.Document> cursor = collection.find().iterator();
                    int questionNumber = 1;

                    while (cursor.hasNext()) {
                        org.bson.Document doc = cursor.next();
        %>
        <div id="question<%= questionNumber %>" style="<%= (questionNumber > 1) ? "display: none;" : "" %>">
            <br><p style="font: bold;">Question <%= questionNumber %>:
            <%= doc.getString("question") %></p><br>
            <input type="hidden" name="question<%= questionNumber %>" value="<%= doc.getString("question") %>">
            <input type="radio" value="A" name="answer<%= questionNumber %>"><%= doc.getString("optionA") %>
            <input type="radio" value="B" name="answer<%= questionNumber %>"><%= doc.getString("optionB") %>
            <input type="radio" value="C" name="answer<%= questionNumber %>"><%= doc.getString("optionC") %>
            <input type="radio" value="D" name="answer<%= questionNumber %>"><%= doc.getString("optionD") %>
            &nbsp;&nbsp;&nbsp;<br><br><button type="submit" name="submitQuestion" value="<%= questionNumber %>">Submit</button><br><br>
        </div>
        <%
                        questionNumber++;
                    }
                    cursor.close();
                    mongoClient.close();
                } catch (Exception ex) {
                    out.println("Failed to fetch questions: " + ex.getMessage());
                }
            }
        %>
        <button id="nextButton" type="button" onclick="showNextQuestion()">Next</button>
        <br><br><input id="submitButton" type="submit" value="Submit Answers" style="display: none;">
    </form>
</body>
</html>
