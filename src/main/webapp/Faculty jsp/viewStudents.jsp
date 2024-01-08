<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
<meta charset="UTF-8">
<!-- <script>
    function confirmRemove(prn) {
        if (confirm("Are you sure you want to remove this Student?")) {
            window.location.href = "RemoveStudent?prn=" + prn; // Replace with your servlet URL
        }
    }
</script> -->
<title>Student List</title>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</head>
<body>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
    <div class="urstudents">
<h3>Student List</h3>
<%-- <a href="StudentList?batch=1A"><button>View Batch 1A Students</button></a>
<a href="StudentList?batch=1B"><button>View Batch 1B Students</button></a>
<a href="StudentList?batch=2A"><button>View Batch 2A Students</button></a>
<a href="StudentList?batch=2B"><button>View Batch 2B Students</button></a>
<a href="StudentList?batch=3A"><button>View Batch 3A Students</button></a>
<a href="StudentList?batch=3B"><button>View Batch 3B Students</button></a>


<%
    String batchFilter = request.getParameter("batch");
    if (batchFilter != null && !batchFilter.isEmpty()) {
%> --%>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for PRN.." title="Type in a name">
    
    <div id="searchResults"></div>
    <table id="myTable">
        <tr>
            <th>name</th>
            <th>PRN</th>
            <th>Email</th>
            <th>Password</th>
            <th>Batch</th>
            <th>Department</th>
            <!-- <th>edit</th>
            <th>remove</th> -->
        </tr>
        <%
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("online_exam");
            MongoCollection<Document> collection = database.getCollection("students");

            FindIterable<Document> documents = collection.find();
            for (Document document : documents) {
        %>
        <tr>
            <td><%= document.get("name") %></td>
            <td><%= document.get("prn") %></td>
            <td><%= document.get("email") %></td>
            <td><%= document.get("password") %></td>
            <td><%= document.get("batch") %></td>
            <td><%= document.get("department") %></td>
            <%-- <td><a href="#">Edit</a></td>
            <td><a href="javascript:void(0);" onclick="confirmRemove('<%= document.get("prn") %>')">Remove</a></td> --%>
        </tr>
        <%
            }
            mongoClient.close();
        %>
    </table>
    </div>
<%-- <%
    }
%> --%>
<br>
<jsp:include page="footer_faculty.jsp"></jsp:include>

</body>
</html>