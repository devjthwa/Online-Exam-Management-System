<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="./style.css">

<title>Insert title here</title>
</head>
<body>
<header>
  <div class="topbar">
       <h1> <a href="admindash.jsp">Admin Dashboard</a></h1>

 <nav>
    <ul class="navbar">
      <li><a href="./faculty_list.jsp">Faculty</a>
        <ul class="dropdown">
          
        </ul>
      </li>
      <li><a href="viewStudents.jsp">Students</a>
        <ul class="dropdown">
          <li><a href="viewStudents.jsp">Students List</a></li>
         <!--  <li><a href="student_list.jsp">Manage Students</a></li> -->
          
        </ul>
      </li>
      <li><a href="attemptlist.jsp">Attempts</a>
        <ul class="dropdown">
          <li><a href="attemptlist.jsp">Attempt Reports</a></li>
        </ul>
      </li>
      <li><a href="#">Subject Papers</a>
        <ul class="dropdown">
          <li><a href="subject_list.jsp">Manage Subjects</a></li>
          <li><a href="selectedsubjects.jsp">Paper Options</a></li>
          <li><a href="MakePaper.jsp">View Papers</a></li>
          
        </ul>
      </li>
      <li><a href="#">Admin</a>
        <ul class="dropdown">
          <li><a href="admin_list.jsp">Manage Admin</a></li>
          <!-- <li><a href="#">Settings</a></li> -->
          <li><a href="../admin_login.jsp">Logout</a></li>
        </ul>
      </li>
    </ul>
  </nav>
 
  </div>
  </header>
  <br><br>
</body>
</html>