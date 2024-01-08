<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>

<html>
    <head><title>Online Examination Portal || Project Group 42</title>
        <link rel="icon" href="tabimg.png" type="image/icon png">
        <link rel="stylesheet" href=".\css\studentLogin.css">
        
    </head>
    <body>
    <div id="content">
        <div class="topbar">
            <img src="tabimg.png" alt="Logo">
            <h1 class="subtitle"><nobr>Online Exam Portal</nobr></h1>
        </div>
        <div class="container">
             <form action="./student" method="post">
                <h1>login</h1>
                <div class="inputbox">
                    <input type="number" placeholder="Enter PRN" id="prn" name="prn"required>   
                </div>
                <div class="inputbox">
                    <input type="password" placeholder="Enter Password" id="password" name="password"required>   
                </div>
                <div class="forgotpassword">
                  <!--   <a href="#">Forgot password</a> -->
                </div>

                <button type="submit" class="btn">Submit</button>
             </form>
<%if(session.getAttribute("wrong") != null){ %>
	<div class="wrong_pwd">
		Invalid username or password
	</div>
	<%
	session.removeAttribute("wrong");
	} %>
        </div>
        </div>
<% 

MongoClient mongoClient = new MongoClient("localhost", 27017);
MongoDatabase database = mongoClient.getDatabase("online_exam");
MongoCollection<Document> collection = database.getCollection("schedulePaperTime");

FindIterable<Document> documents = collection.find();
for (Document document : documents) {
 %>
 <%-- <input type="text" readonly="readonly" id="opentime" value='<%= document.get("openTime") %>' />
  <input type="text" readonly="readonly" id="closetime" value='<%= document.get("closeTime") %>' /> --%>

 <%
                    }
                    mongoClient.close();
                    %>
<script>
        const opentime = "06:00"; 
        const closetime = "20:00"; 
        
        // Get the current hour
        const currenttime = new Date().toLocaleTimeString('en-US', { hour12: false });

        // Check if the current hour is within the allowed range
        if (currenttime >= opentime && currenttime < closetime) {
            // Page is available, show content
            document.getElementById('content').style.display = 'block';
        } else {
            // Page is not available, display a message
            document.body.innerHTML = '<h1>Sorry, this page is only available from 1:00 PM to 3:00 PM.</h1>';
        }
    </script>
    </body>
</html>