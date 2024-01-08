const videoElement = document.getElementById("displaycam");
const startButton = document.getElementById("startButton");
const captureButton = document.getElementById("captureButton");
const saveButton = document.getElementById("saveButton");
const capturedImage = document.getElementById("capturedImage");

let mediaStream = null;


async function startCamera() {
    try {
        mediaStream = await navigator.mediaDevices.getUserMedia({ video: true });
        videoElement.srcObject = mediaStream;
    } catch (error) {
        console.error("Error accessing the camera:", error);
    }
}

window.onload = function () {
    startCamera();
};

// Function to capture an image
function captureImage() {
    if (mediaStream) {
        const canvas = document.createElement("canvas");
        const context = canvas.getContext("2d");
        canvas.width = videoElement.videoWidth;
        canvas.height = videoElement.videoHeight;
        context.drawImage(videoElement, 0, 0, canvas.width, canvas.height);
    }
}



//right click disable

document.addEventListener("contextmenu", (event) => {
    event.preventDefault();
 });




 let alertCount = 0;

 // defined max alerts.
 const maxAlerts = 5;

 // event listner
 document.addEventListener('keydown', function (event) {
     const key = event.key.toLowerCase();
     
     // keys to monitor.
     const keysToMonitor = ['alt', 'control', 'delete', 'printscreen', 'tab', 'shift', 'escape', 'meta'];

    
     if (keysToMonitor.includes(key)) {
         // Show an alert.
         alert("Restricted key pressed !!");

         alertCount++;

         if (alertCount >= maxAlerts) {
             exampaper.submit();               
             alert('You have been logged out due to excessive alerts.'); 
         }
     }
 });

 const timerElement = document.getElementById('timer');

//countdown timer
let timer = 10 * 60; // 30 minutes in seconds
let interval;


 function updateTimer() {
    const minutes = Math.floor(timer / 60);
    const seconds = timer % 60;
    timerElement.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;

    if (timer === 0) {
        clearInterval(interval);
         exampaper.submit(); // Auto-submit the form
    } else {
        timer--;
    }
}

interval = setInterval(updateTimer, 1000);