<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<jsp:include page="navbar_faculty.jsp"></jsp:include>
<div class= "managestudents">
    <h2>Add Student</h2>
    
    <form action="../AddStudent" method="post">
        <label>Name: </label><input type="text" name="name" id="name" required>
    	<label>PRN: </label><input type="number" name="prn" id="prn" style="height: 30px; border-color:#ccc;" required >
    	<label>Email: </label><input type="email" name="email" id="email" required>
    	<label>Password: </label><input type="password" name="pwd" id="pwd" required>
    	<label>Select Batch: </label>
    	<select name="batch" required>
    	<option value="" disabled selected>Select Batch</option>
    	<option value="1A">1A</option>
    	<option value="1B">1B</option>
    	<option value="2A">2A</option>
    	<option value="2B">2B</option>
    	<option value="3A">3A</option>
    	<option value="3B">3B</option>
    	</select>
    	<label>Select Department: </label>
    	<select name="department" required>
    	<option value="" disabled selected>Select Batch</option>
    	<option value="bca">bca</option>
    	<option value="maths">maths</option>
    	<option value="chemistry">chemistry</option>
    	<option value="physics">physics</option>
    	<option value="botany">botany</option>
    	<option value="environmental_science">environmental_science</option>
    	</select>
        <!-- <label>Select Faculty: </label>
    	<select name="faculty" required>
    	<option value="" disabled selected>Select Faculty</option>
    	<option value="Commerce">Commerce</option>
    	<option value="Arts">Arts</option>
    	<option value="Science">Science</option>
    	</select>
         --><!-- Include more input fields as needed -->
    <button type="submit">Add Student</button>
    </form>
    </div>
</body>
</html>
