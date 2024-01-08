<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include>
 <%
 String subjectName = request.getParameter("subjectName");
 %>
 <table>
            <tbody>
        <thead>
            <tr>
            	
                <td>Subject</td>
                <td>Question</td>
                <td>Option A</td>
                <td>Option B</td>
                <td>Option C</td>
                <td>Option D</td>
                <td>Correct Answer</td>
               <!--  <td>Remove</td> -->
            </tr>
            </thead>
            <%
                
            
            	
                if (subjectName != null) {
                    try {
                        MongoClient mongoClient = new com.mongodb.MongoClient("localhost", 27017);
                        MongoDatabase database = mongoClient.getDatabase("Subjects");
                        MongoCollection<org.bson.Document> collection = database.getCollection(subjectName);
                        MongoCursor<org.bson.Document> cursor = collection.find().iterator();
                        while (cursor.hasNext()) {
                            org.bson.Document doc = cursor.next();
            %>
            <tr>
            	<td><%= subjectName %></td>
                <td><%= doc.getString("question") %></td>
                <td><%= doc.getString("optionA") %></td>
                <td><%= doc.getString("optionB") %></td>
                <td><%= doc.getString("optionC") %></td>
                <td><%= doc.getString("optionD") %></td>
                <td><%= doc.getString("correctAnswer") %></td>
<%-- 				<td><a href="../ManageQuestions?question=<%= doc.getString("question") %>">Remove</a></td> --%>

            </tr>
            <%
                        }
                        cursor.close();
                        mongoClient.close();
                    } catch (Exception ex) {
                        out.println("Failed to fetch questions: " + ex.getMessage());
                    }
                }
            %>
            </tbody>
        </table>


</body>
</html>