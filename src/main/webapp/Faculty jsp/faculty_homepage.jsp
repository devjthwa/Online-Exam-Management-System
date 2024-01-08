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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="./style.css">
  <title>Faculty Dashboard</title>
</head>
<body>

<%-- <%
try {
    MongoClient mongoClient = new MongoClient("localhost", 27017);
    MongoDatabase database = mongoClient.getDatabase("online_exam");
    MongoCollection<Document> collection = database.getCollection("facultylogin");

    String userEmail = request.getParameter("email"); // Replace with the actual email used in login

    // Create a query to find the admin by email
    Document query = new Document("email", userEmail);
    FindIterable<Document> result = collection.find(query);

    String facultyName = ""; // Initialize the adminName variable

    for (Document document : result) {
        facultyName = document.getString("name");
    }

    mongoClient.close();

    // Now you can use adminName in your HTML content
%>
    <h1>Welcome <%= facultyName %></h1>
    <!-- Rest of your HTML content -->
<%
} catch (Exception ex) {
    ex.printStackTrace();
}
%> --%>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
 <main>
    
         <div class="content">
          <section id="overview" class="content-section">
            <h1 class="desc">Welcome to the Faculty Dashboard !</h1>
          </section>
         <div class="imgcontainer"> 
         <img class="mySlides" src="./01.jpg" alt="">
         <img class="mySlides" src="./02.jpg" alt="">
         <img class="mySlides" src="./03.jpg" alt="">
         <img class="mySlides" src="./04.jpg" alt=""> 
          <img class="mySlides" src="./05.jpg" alt="">
          <img class="mySlides" src="./06.jpg" alt="">
          <img class="mySlides" src="./07.jpg" alt="">
          <img class="mySlides" src="./08.jpg" alt="">
          <img class="mySlides" src="./09.jpg" alt="">
          <img class="mySlides" src="./10.jpg" alt="">
          <img class="mySlides" src="./11.jpg" alt="">
          <img class="mySlides" src="./12.jpg" alt="">
         
         <script src="./changeimage.js"></script>
         
          
      </div>
  </div>

           

</main>
 
 <jsp:include page="footer_faculty.jsp"></jsp:include>
  
</body>
</html>
