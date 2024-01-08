const videoElement = document.getElementById("displaycam");
const startButton = document.getElementById("startButton");
const captureButton = document.getElementById("captureButton");
const saveButton = document.getElementById("saveButton");
const capturedImage = document.getElementById("capturedImage");


let mediaStream = null;
let isCaptured = false;

let startCamera = async ()=>{
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

        // Display the captured image
        capturedImage.style.display = "block";
        capturedImage.src = canvas.toDataURL("image/jpeg");
        isCaptured = true;
    }
}

// Function to save the captured image to a database (simulated)
function saveToDatabase() {
    if (isCaptured) {
        // Simulate saving to a database (you should implement your server-side logic here)
        //alert("Image saved to the database!");
        // Hide the captured image and reset the flag
        capturedImage.style.display = "none";
        capturedImage.src = "";
        isCaptured = false;
		window.location.href = "./Instructions.jsp"
    } else {
        alert("Capture an image first before saving.");
    }
}

captureButton.addEventListener("click", captureImage);
saveButton.addEventListener("click", saveToDatabase);

       document.addEventListener("contextmenu", (event) => {
         event.preventDefault();
      });
