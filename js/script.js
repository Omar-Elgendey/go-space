document.addEventListener("DOMContentLoaded", function () {
  const buttons = document.querySelectorAll(".toggle-btn");

  buttons.forEach(button => {
    button.addEventListener("click", function () {
      const details = this.nextElementSibling;

      // close all other details
      document.querySelectorAll(".details").forEach(item => {
        if (item !== details) {
          item.style.maxHeight = null;
        }
      });

      // toggle current details
      if (details.style.maxHeight) {
        details.style.maxHeight = null;
      } else {
        details.style.maxHeight = details.scrollHeight + "px";
      }
    });
  });
});