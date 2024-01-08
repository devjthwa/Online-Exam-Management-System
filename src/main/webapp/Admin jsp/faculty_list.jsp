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
    <title>Faculty-List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="styles.css">
    <script>
    function confirmRemove(email) {
        if (confirm("Are you sure you want to remove this Faculty?")) {
            window.location.href = "../RemoveFaculty?email=" + email; // Replace with your servlet URL
        }
    }
	</script>
  
    </head>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include> 
    <h2>Faculty List</h2>
    <div class="content-container" style="align-items: center;">
               <!-- Faculty Details Box -->
        <div class="content-box">
        </div>
        </div>

  <br></br>
  
    
    <div class="urfaculty">
    
            
            <div class="box-title">Faculty List</div>
  <table>
  <tbody>
        <tr><th>Name</th><th>Email</th><th>Password</th><th>Batch</th><th>Department<th>edit</th><th>remove</th>
 <% 
            //Java code to fetch and display student data from MongoDB
            MongoClient mongoClient = new MongoClient("localhost", 27017);
 			MongoDatabase database = mongoClient.getDatabase("online_exam"); 
            MongoCollection<Document> collection = database.getCollection("facultylogin"); 
            
            FindIterable<Document> documents = collection.find();
            
            for (Document document : documents) {
        %>
        <tr>
            <td><%= document.get("name") %></td>
            <td><%= document.get("email") %></td>
            <td><%= document.get("password") %></td>
            <td><%= document.get("batch") %></td>
            <td><%= document.get("department") %></td>
            <td><a href=../UpdateFaculty?email=<%= document.get("email") %>><button>Edit</button></a></td>
            <td><a href="javascript:void(0);" onclick="confirmRemove('<%= document.get("email") %>')"><button>Remove</button></a></td>
            
        </tr>
        <% 
        mongoClient.close();  }
        %>
        </tbody>
    </table>
<a href="addFaculty.jsp"><button>Add Faculty</button></a>
</div>
<br></br>
<jsp:include page="footer_admin.jsp"></jsp:include>

</body>
</html>
