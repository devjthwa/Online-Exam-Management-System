<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Faculty</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="navbar_admin.jsp"></jsp:include>
<div class="facultymanage">
    <h2>Add Faculty</h2>
    
    <form action="../AddFaculty" method="post">
        Name: <input type="text" name="name" id="fname" required><br>
    	Email: <input type="email" name="email" id="email" required><br>
    	Password: <input type="password" name="password" id="password" required><br>
    	<select name="batch" required>
    	<option value="" disabled selected>Select Batch</option>
    	<option value="1A">1A</option>
    	<option value="1B">1B</option>
    	<option value="2A">2A</option>
    	<option value="2B">2B</option>
    	<option value="3A">3A</option>
    	<option value="3B">3B</option>
    	</select>
<!--     	<select name="faculty" required>
    	<option value="" disabled selected>Select Faculty</option>
    	<option value="Commerce">Commerce</option>
    	<option value="Arts">Arts</option>
    	<option value="Science">Science</option>
    	</select>
 -->    	<br><br><label>Select Department: </label>
    	<select name="department" required>
    	<option value="" disabled selected>Select Department</option>
    	<option value="bca">bca</option>
    	<option value="maths">maths</option>
    	<option value="chemistry">chemistry</option>
    	<option value="physics">physics</option>
    	<option value="botany">botany</option>
    	<option value="environmental_science">environmental_science</option>
    	</select>
        <!-- Include more input fields as needed -->
    <button type="submit">Submit</button>
    </form>
    </div>
    <jsp:include page="footer_admin.jsp"></jsp:include>
</body>
</html>
