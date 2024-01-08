<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Display Timer</title>
</head>
<body>
    <h1>Display Timer</h1>
    <div id="timerDisplay">Timer: Not started</div>

    <script>
        // Assume you retrieve the timer data from somewhere (e.g., query parameter, local storage, server, etc.)
        // For this example, we'll simulate passing the timer value from the previous page.
        const timerValue = parseInt(prompt('Enter the timer value:'));
        
        if (!isNaN(timerValue) && timerValue > 0) {
            let timer = timerValue;
            const timerDisplay = document.getElementById('timerDisplay');
            const timerInterval = setInterval(() => {
                if (timer <= 0) {
                    clearInterval(timerInterval);
                }
                timerDisplay.textContent = `Timer: ${timer} seconds`;
                timer--;
            }, 1000);
        } else {
            alert('Invalid timer value.');
        }
    </script>
</body>
</html>