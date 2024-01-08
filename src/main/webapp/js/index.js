let admin = document.querySelector(".admin");
let faculty = document.querySelector(".faculty");
let slider = document.querySelector(".slider");
let formSection = document.querySelector(".form-section");

admin.addEventListener("click", () => {
	slider.classList.add("moveslider");
	formSection.classList.add("form-section-move");
});

faculty.addEventListener("click", () => {
	slider.classList.remove("moveslider");
	formSection.classList.remove("form-section-move");
});
