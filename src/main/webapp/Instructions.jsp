
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Examination Portal || Project Group 42</title>
    <link rel="icon" href="tabimg.png" type="image/icon png">
    <link rel="stylesheet" href="./css/Student03.css">
</head>
<body>
<%@ include file="navbar_stu.jsp" %>
    <h1 id="desc">Exam Instructions</h1>
    <marquee> Read All Instructions carefully and check then clik  Start Button </marquee>
    <div class="instructions">
        <h1 id="head"> INSTRUCTIONS TO BE FOLLOWED DURING ONLINE EXAMINATION</h1>
        <div class="innerbx">
            
                <h1 class="indesc"><b>General Instructions:</b></h1>
                <ul class="inst">
                <li>Log in using your student ID and password. Ensure you use the correct login credentials.</li>
                <li>Ensure you have a stable internet connection.</li>
                <li>Use a compatible web browser (e.g., Chrome, Firefox) with JavaScript enabled.</li>
                <li>Disable any browser extensions or add-ons that may interfere with the exam.</li>
                <li>Be aware of the exam date and time. The exam will start and end at the specified times.</li>
                <li>Follow any specific instructions provided by your teacher.</li>
                <li>You can answer one question at once, there is no option to reattempt the question so answer accordingly.</li>
                <li>Allow camera permission, if Camera is blocked it will be counted as unfair means.</li>
                <li>While giving exam random pictures will be taken and will be verified avoid multiple persons in camera. </li>
                <li>Students are advised to login before 30 min of exam.</li>
                <li>Student are advised to Use PC/Laptop for giving exam.</li>
                <li>If any one is found doing Unfair means afterwards his/her exam won't be counted and will be refferd to Unfair means committee.</li>
                </ul>
                <h1 class="indesc"><b>Restricted Actions:</b></h1>
                <ul class="inst">
                <li>Pressing Alt,CTRL,Shift keys.</li>
                <li>Blocking Camera</li>
                <li>Minimizing Window</li>
                <li>Changing Tab</li>
                <li>Pressing Function Keys</li>
                <li>Right Click</li>
                <li>Pressing Print Screen</li>
                <li>Taking Screenshot</li>
            
            </ul>  
    </div>



    </div>
    <div class="checkform">
        <input id="chkbx" type="checkbox" required="required"> I have read the above Instructions and accept them all 
        <br>
        <a href="papersubject.jsp"><button class="button" id="sbtn" value="Start">Start</button></a>
        
     <script src="./js/Student03.js"></script>
    </div> 
    <div class="cpy">
        <p>&copy; Group 41 (Mini Project)</p>
    </div>
    
       <!--  <a href="papersubject.jsp"><button class="button" id="playButton">Attempt</button></a>
        <a href="student_homepage.jsp"><button class="button" id="exitButton">Go Back</button></a> -->
   <!--  </div> -->

    <script>
        document.getElementById("playButton").addEventListener("click", function () {
            // Replace with your play action
            alert("Attempting the paper...");
        });

        document.getElementById("exitButton").addEventListener("click", function () {
            // Replace with your exit action
            alert("It will take to the homepage");
        });
    </script>
    <a href="student_homepage.jsp"><button>Back to homepage</button></a>
</body>
</html>
