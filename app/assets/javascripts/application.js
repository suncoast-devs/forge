document.addEventListener("DOMContentLoaded", () => {
  const burg = document.querySelector(".navbar-burger");
  const menu = document.querySelector(".navbar-menu");
  burg.addEventListener("click", () => {
    burg.classList.toggle("is-active");
    menu.classList.toggle("is-active");
  });

  const fileInputs = document.querySelectorAll(".file-input");
  for (const input of fileInputs) {
    const label = document.querySelector(".file-name", input.parentNode);
    input.addEventListener("change", event => {
      if (event.target.files.length > 0) {
        label.textContent = event.target.files[0].name;
      }
    });
  }
});
