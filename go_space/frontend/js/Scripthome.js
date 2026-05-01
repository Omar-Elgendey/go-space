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

        // تغيير الزر بعد الاشتراك
        subscribeBtn.textContent = "Subscribed";
        subscribeBtn.style.backgroundColor = "#555"; // تغيير اللون إذا أحببت
        subscribeBtn.style.cursor = "default";

        // منع إعادة الاشتراك
        subscribeBtn.disabled = true;

        // يمكنك إضافة رسالة صغيرة بجانب الزر أيضًا
        alert(`Thank you for subscribing with ${email}!`);
        emailInput.value = '';
    });

});



document.getElementById("findBtn").onclick = function () {
  window.location.href = "/places";
};


const spaces = {
  privateOffice: ["MQR Spaces", "KROO Space"],
  meetingRoom: ["MQR Spaces", "Zodiac Coworking Space", "KROO Space"],
  coworking: ["Barah", "Shaghaf", "CozyHive", "MQR Spaces", "KROO Space"],
  dedicatedDesk: ["CozyHive", "MQR Spaces", "KROO Space"]
};

function showCard(type) {
  // ربط كل نوع بالـ div الصحيح
  const containerMap = {
    privateOffice: "resultPO",
    coworking: "resultCW",
    dedicatedDesk: "resultDD",
    meetingRoom: "resultMR"
  };

  const containerId = containerMap[type];
  if (!containerId) return; // لو النوع مش موجود

  const container = document.getElementById(containerId);
  container.innerHTML = ""; // تفريغ المحتوى القديم

  spaces[type].forEach(space => {
    const p = document.createElement("p");
    p.textContent = space;
    container.appendChild(p);
  });
}

