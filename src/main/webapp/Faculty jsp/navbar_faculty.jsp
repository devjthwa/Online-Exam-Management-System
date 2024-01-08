<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./style.css">
  
</head>
<body>
<header>
  <div class="topbar">
        <h1><a href="faculty_homepage.jsp">Faculty Dashboard</a></h1>
 
  <nav>
    <ul class="navbar">
      <!-- <li><a href="#">Faculty</a> -->
      <li><a href="#">Students</a>
        <ul class="dropdown">
          <li><a href="viewStudents.jsp">Students List</a></li>
          <li><a href="student_list.jsp">Manage Students</a></li>
          
        </ul>
      </li>
      <li><a href="attemptlist.jsp">Attempt List</a>
      </li>
      <li><a href="MakePaper.jsp">Subject Papers</a>
        <ul class="dropdown">
          <!-- <li><a href="subject_list.jsp">Manage Subjects</a></li> -->
          <li><a href="MakePaper.jsp">Make Papers</a></li>
          
        </ul>
      </li>
      <li><a href="#">Faculty</a>
        <ul class="dropdown">
          <li><a href="../admin_login.jsp">Logout</a></li>
        </ul>
      </li>
    </ul>
  </nav>
  </div>
  </header>
</body>
</html>