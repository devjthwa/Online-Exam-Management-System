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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<%
try {
    MongoClient mongoClient = new MongoClient("localhost", 27017);
    MongoDatabase database = mongoClient.getDatabase("online_exam");
    MongoCollection<Document> collection = database.getCollection("adminlogin");

    String userEmail = request.getParameter("email"); // Replace with the actual email used in login

    // Create a query to find the admin by email
    Document query = new Document("email", userEmail);
    FindIterable<Document> result = collection.find(query);

    String adminName = ""; // Initialize the adminName variable
	String adminEmail = "";
	String adminPassword = "";
    
    for (Document document : result) {
        adminName = document.getString("name");
        adminEmail = document.getString("email");
        adminPassword = document.getString("password");
    }

    mongoClient.close();

    // Now you can use adminName in your HTML content
%>
    <h1>Welcome <%= adminName %></h1>
     <%
HttpSession s = request.getSession();
    session.setAttribute("name",adminName );
	session.setAttribute("password",adminPassword );
	session.setAttribute("email",adminEmail);
	//session.setAttribute("batch",studentBatch);

String adminname = (String)session.getAttribute("name");
String adminemail = (String)session.getAttribute("email");
String adminpassword = (String)session.getAttribute("password");
String adminbatch = (String)session.getAttribute("batch");
%>
  <h2>Your name is <%= adminname %></h2>
  <h2>Your Email is <%= adminemail %></h2>
    
<%
} catch (Exception ex) {
    ex.printStackTrace();
}
%>
  
 
  


<br>

<br><h1>Manage</h1>
<div>
<a href="faculty_list.jsp"><button>Faculty</button></a>
&nbsp;&nbsp;
<a href="attemptlist.jsp"><button>Students Attempts</button></a>
&nbsp;&nbsp;
<a href="student_list.jsp"><button>Students</button></a>
&nbsp;&nbsp;
<a href="subject_list.jsp"><button>Subjects</button></a>
&nbsp;&nbsp;
<a href="MakePaper.jsp"><button>Papers</button></a>
&nbsp;&nbsp;
<a href="admin_list.jsp"><button>Admin</button></a>
&nbsp;&nbsp;
<br>
</div>
</body>
</html>