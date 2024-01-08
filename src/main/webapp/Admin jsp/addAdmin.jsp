<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Admin</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include>
    <h2>Add Admin</h2>
    <div class="managesubjects">
    <form action="../AddAdmin" method="post">
        Name: <input type="text" name="name" id="name" required><br>
    	Email: <input type="email" name="email" id="email" required><br>
    	Password: <input type="password" name="password" id="password" required><br>
    	<!-- Include more input fields as needed -->
    <button type="submit">Add Admin</button>
    </form>
    </div>
<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
</html>
