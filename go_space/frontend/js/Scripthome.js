const spaces = {
  privateOffice: ["Mqr Spaces", "KROO Space"],
  meetingRoom: ["Mqr Spaces", "Zodiac Coworking Space", "KROO Space"],
  coworking: ["Barah", "Shaghaf", "CozyHive", "Mqr Spaces", "KROO Space"],
  dedicatedDesk: ["CozyHive", "Mqr Spaces", "KROO Space"]
};
 
function showCard(type) {
  const containerMap = {
    privateOffice: "resultPO",
    coworking: "resultCW",
    dedicatedDesk: "resultDD",
    meetingRoom: "resultMR"
  };
 
  const containerId = containerMap[type];
  if (!containerId) return; 
 
  const container = document.getElementById(containerId);
  container.innerHTML = "";
 
  spaces[type].forEach(space => {
    const p = document.createElement("p");
    p.textContent = space;
    container.appendChild(p);
  });
}
//Footer//
document.addEventListener('DOMContentLoaded', () => {
 
    // ===== Social Buttons =====
    const socialLinks = {
        "F": "https://facebook.com",
        "X": "https://x.com",
        "Y": "https://youtube.com",
        "I": "https://instagram.com"
    };
 
    document.querySelectorAll('.social-icons a').forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            const letter = btn.textContent.trim();
            const url = socialLinks[letter];
            if(url) window.open(url, '_blank');
        });
    });
 
    const subscribeForm = document.querySelector('.subscribe-form');
    const emailInput = subscribeForm.querySelector('input[type="email"]');
    const subscribeBtn = subscribeForm.querySelector('button');
 
    subscribeForm.addEventListener('submit', (e) => {
        e.preventDefault();
        const email = emailInput.value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
 
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email!");
            return;
        }
 
        subscribeBtn.textContent = "Subscribed";
        subscribeBtn.style.backgroundColor = "#555";
        subscribeBtn.style.cursor = "default";
 
        subscribeBtn.disabled = true;
 
        alert(`Thank you for subscribing with ${email}!`);
        emailInput.value = '';
    });
 
});

//---------Btn find workspaces----------//
document.getElementById("findBtn").onclick = function () {
  window.location.href = "place.html";
};

