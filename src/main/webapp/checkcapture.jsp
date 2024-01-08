<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <title>Webcam Capture</title>
</head>
<body>
    <video id="webcam" autoplay></video>
    <button id="capture">Capture</button>
    <canvas id="canvas" style="display:none;"></canvas>
    
    <script>
        const video = document.getElementById('webcam');
        const canvas = document.getElementById('canvas');
        const captureButton = document.getElementById('capture');
        
        // Get user media and display the webcam feed
        navigator.mediaDevices.getUserMedia({ video: true })
            .then(stream => {
                video.srcObject = stream;
            })
            .catch(error => {
                console.error('Error accessing webcam:', error);
            });

        // Capture an image from the webcam
        captureButton.addEventListener('click', () => {
            const context = canvas.getContext('2d');
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            // Convert the captured image to base64 data
            const imageData = canvas.toDataURL('image/jpeg');

            // Send the image data to the servlet using XMLHttpRequest or Fetch API
            // Implement this part according to your needs
        });
    </script>
</body>
</html>