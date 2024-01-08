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
    <link rel="stylesheet" href="./css/Student05.css">
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
	<marquee>!!!  Keep camera on while Exam is Going on otherwise your exam won't be accepted !!! </marquee>
    <div class="main">
        <div class="infotab">
            <h3 class="ihead">Inforamtion</h3>
        <div class="videocam">
        <video id="displaycam" autoplay></video>
    </div>
    <div id="timer" class="timer">
        30:00
    </div>
    </div>
    
	<div class="questionstab">
        <h2 class="qhead"style="text-align: center;">Subject Questions</h2>

    <form class="qpaper"action="GetAnswers" method="post" style="margin: 1em;" id="exampaper">
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
            <br><p style="font: 25px bold;">Question <%= questionNumber %>:
            <%= doc.getString("question") %></p><br>
            <input type="hidden" name="question<%= questionNumber %>" value="<%= doc.getString("question") %>">
            <input type="radio" value="A" name="answer<%= questionNumber %>"><%= doc.getString("optionA") %>
            <input type="radio" value="B" name="answer<%= questionNumber %>"><%= doc.getString("optionB") %>
            <input type="radio" value="C" name="answer<%= questionNumber %>"><%= doc.getString("optionC") %>
            <input type="radio" value="D" name="answer<%= questionNumber %>"><%= doc.getString("optionD") %>
            <%-- &nbsp;&nbsp;&nbsp;<br><br><button type="submit" name="submitQuestion" class="sbtn" value="<%= questionNumber %>">Submit</button><br><br> --%>
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
        <button class="nxtbtn" id="nextButton" type="button" onclick="showNextQuestion()" class="sbtn">Next</button>
        <br><br><input id="submitButton" type="submit" value="Submit Answers" style="display: none;" class="sbtn">
    </form>
    </div>
    </div>
    <div class="cpy">
        <p style="font: 25px">&copy; Group 41 (Mini Project)</p>
    </div>
<script src="./js/Student05.js"></script>
</body>
</html>
