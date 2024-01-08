<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoIterable" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>

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
    input {
    margin-bottom: 0.6rem;
    }
</style>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
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

<title>Attempt List</title>

</head>
<body>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
<br><br>
<div class="urstudents">
<form action="attemptReport.jsp">
<h2>You Have to Select a particular subject that you want to See the report on the page</h2><br>
<h3>So Select the subject First and then click on the submit button.</h3><br>
<label>Select Subject: </label>
        <select name="subjectName" required>
            
            <% 
                // Java code to fetch and populate collection names
                String subjectName = (String)session.getAttribute("subjectname");
                try {
                	MongoClient mongoClient = new MongoClient("localhost", 27017);
                	MongoIterable<String> collectionNames = mongoClient.getDatabase("Answers_Collection").listCollectionNames();
                    for (String collectionName : collectionNames) {
            %>
            <option value="<%= collectionName %>"><%= collectionName %></option>
            <%
                    }
                    mongoClient.close();
                    
                } catch (Exception ex) {
                    out.println("Failed to fetch Subject names: " + ex.getMessage());
                }
            %>
        </select>
        <br>
        <button type="submit">Get Report</button>
</form>
</div>
<jsp:include page="footer_faculty.jsp"></jsp:include>
</body>
</html>
