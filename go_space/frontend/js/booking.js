function openPopup(place){
document.getElementById("popup").style.display="flex";
document.getElementById("title").innerHTML="Book " + place;
}

function closePopup(){
document.getElementById("popup").style.display="none";
}

function confirmBooking(){
alert("Booking Confirmed ✓");
closePopup();
}