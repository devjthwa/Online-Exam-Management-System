var btn = document.getElementById("sbtn");
var cbox = document.getElementById("chkbx");

btn.addEventListener("click",function(){
    if(!cbox.checked){
        alert("Accecpt All instruction First !")
    }
});

//right click disable

document.addEventListener("contextmenu", (event) => {
    event.preventDefault();
 });