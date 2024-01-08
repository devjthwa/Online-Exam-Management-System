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
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="styles.css">

<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
</style>
<script>
     function confirmRemove(prn) {
        if (confirm("Are you sure you want to remove this Student?")) {
            window.location.href = "../RemoveStudent?prn=" + prn; // Replace with your servlet URL
        }
    }
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
<title>Student List</title>
</head>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include>
<br><br>
<div>
<!-- <a href="../StudentList?department=bca"><button>bca Students</button></a>
<a href="./StudentList?department=maths"><button>maths Students</button></a>
<a href="./StudentList?department=chemistry"><button> chemistry Students</button></a>
<a href="./StudentList?department=physics"><button> physics Students</button></a>
<a href="./StudentList?department=botany"><button>botany Students</button></a>
<a href="./StudentList?department=environmental_science"><button>environmental_science Students</button></a>
<a href="./Admin jsp/viewStudents.jsp"><button>All Students</button></a>
 -->

 <br>
 <br>
    
    </div>
    <div class="urstudents">
<h2>Student List</h2>
<div style="margin: 0%;">
 
<div id="searchResults" style="margin: 0%;">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for PRN.." title="Type in a name">
    <table id="myTable">
    <tbody>
        <tr>
            <th>Name</th>
            <th>PRN</th>
            <th>Email</th>
            <th>Password</th>
            <th>Batch</th>
            <th>Department</th>
<!--             <th>Faculty</th> -->
            <th>Edit</th>
            <th>Remove</th>
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
<%--             <td><%= document.get("faculty") %> </td> --%>
             <td><a href=../UpdateStudent?prn=<%= document.get("prn") %>><button>Edit</button></a></td>
            <td><a href="javascript:void(0);" onclick="confirmRemove('<%= document.get("prn") %>')"><button>Remove</button></a></td>
        </tr>
        <%
            }
            mongoClient.close();
        %>
        </tbody>
    </table>
    <p style="color: red;">Note: While adding any student, add prn carefully you can't change it then.</p>
</div>
<br>
</div>
<a href="addStudent.jsp"><button>Add Student</button></a>
</div>
<br><br>
<jsp:include page="footer_admin.jsp"></jsp:include>

</body>
</html>
