<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.FindIterable" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoIterable" %>
<%@ page import="org.bson.types.ObjectId " %>

<%@ page import="java.util.Set" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attempt Report</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
    <h2>Attempt Report</h2>

    <% 
        String selectedCollection = request.getParameter("subjectName");
    %>
    <% 
        try {
            MongoClient mongoClient = new MongoClient("localhost", 27017);
            MongoDatabase database = mongoClient.getDatabase("Answers_Collection");
            MongoCollection<Document> collection = database.getCollection(selectedCollection);
            FindIterable<Document> records = collection.find();

            // Check if there are records in the collection
            if (records.iterator().hasNext()) {
                // Get the first record to determine column names
                Document firstRecord = records.first();
                Set<String> columnNames = firstRecord.keySet();
                
    %>
<div class="urfaculty">
    Subject Name = <%= selectedCollection %>
    <table>
      <tbody <tbody style="   display: flex;    justify-content: center;">

        
        <tr style="    display: grid;    width: 15vw;">
           
            
        </tr>
        
    </tbody>>
      <div>
<tr style="width: 15vw;">
            <%
                // Generate table headers from column names
                for (String columnName : columnNames) {
                    if (!columnName.equals("_id")) {
            %>
            <th><%= columnName %></th>
            <%
                    }
                }
            %>
        </tr>
        </div>
        <%
            for (Document record : records) {
        %>
        <tr style=" width :15vw; ">
            <%
                for (String columnName : columnNames) {
                    if (!columnName.equals("_id")) {
            %>
            <td><%= record.getString(columnName) %></td>
            <%
                    }
                }
            %>
        </tr>
        </div>
        <%
            }
        %>
    <%
            } else {
                out.println("<p>No records found in the selected collection.</p>");
            }
            mongoClient.close();
        } catch (Exception ex) {
            out.println("Failed to fetch and display records: " + ex.getMessage());
        }
    %></tbody>
    </table>
    </div>
<jsp:include page="footer_faculty.jsp"></jsp:include>
</body>
</html>