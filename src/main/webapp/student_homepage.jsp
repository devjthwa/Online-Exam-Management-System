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

    // Now you can use adminName in your HTML content
%>
   <div class="studentinf">
            <h2>Welcome</h2> <p id="sname"><%= studentName %></p>
            <h2>PRN:</h2><p id="sid"><%= studentPRN %></p>
        </div> <!-- Rest of your HTML content -->
 
    </div> 
 <%
HttpSession s = request.getSession();
	session.setAttribute("prn", studentPRN);
	session.setAttribute("name",studentName );
	session.setAttribute("password",studentPassword );
	session.setAttribute("email",studentEmail);
	session.setAttribute("batch",studentBatch);

String studentname = (String)session.getAttribute("name");
String studentprn = (String)session.getAttribute("prn");
String studentemail = (String)session.getAttribute("email");
String studentpassword = (String)session.getAttribute("password");
String studentbatch = (String)session.getAttribute("batch");
%>
   <details>

    <summary>Student Details</summary>
    <br>
<label>Name: </label><%= studentName %><hr>
<label>PRN: </label><%= studentPRN %><hr>
<label>Email: </label><%= studentEmail %><hr>
<label>Batch: </label><%= studentBatch %><hr>
</details>
    <h1 id="desc">Student Identification:</h1>
    <marquee> Capture appropriate photo of yourself, image can't be changed after it has been saved</marquee>
    <div class="container">
        <div class="imgcap">
            <h1 id="imghead1">Capture Photo</h1>
            <video id="displaycam" autoplay></video>
            <button id="captureButton">Capture Photo</button>
        </div>       
        <div class="capturedPhotoContainer">
            <h1 id="imghead2">Image Preview</h1>
            <img id="capturedImage" style="display: none;" src="" alt="Captured Image">
            <button id="saveButton">Save Photo</button> 
        </div> 
    </div>
    <script src="./js/Student01.js"></script>
<div class="cpy">
        <p>&copy; Group 41 (Mini Project)</p>
    </div>    


<br>
<%
} catch (Exception ex) {
    ex.printStackTrace();
}
%>

</body>
</html>