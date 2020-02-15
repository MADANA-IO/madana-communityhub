<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />


<style>
body, html
{
margin:0px;
padding:0px;
width:100%;
  overflow:hidden;
      background:  linear-gradient(
      rgba(255, 255, 255, 0.9), 
      rgba(255, 255, 255, 0.1)
    ),url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
    
font-family:Raleway;
    
}
.login {
	position: absolute;
	top: calc(40%);
	left: calc(50% + 100px);
	height: 150px;
	width: 600px;
	z-index: 2;
}
@media screen and (max-width: 767px)
 {

.login {
	position: absolute;
	top: 180px;
	left:230px;
	height: 150px;
	width: 100%;;
	z-index: 2;
}


}

* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 110%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}


/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #a0c3e8;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #274863;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}
</style>





<body>
<div class="slideshow-container">

<div class="mySlides ">

  <img src="https://cdn.madana.io/commonvisuals/introslider/Slide1.png" style="width:90%">

</div>

<div class="mySlides ">

  <img src="https://cdn.madana.io/commonvisuals/introslider/Slide2.png" style="width:90%">

</div>

<div class="mySlides ">

  <img src="https://cdn.madana.io/commonvisuals/introslider/Slide3.png" style="width:90%">
</div>
<div class="mySlides ">

  <img src="https://cdn.madana.io/commonvisuals/introslider/Slide4.png" style="width:90%">
</div>

<a class="prev" style="font-size:64px;color:#a0c3e8;"onclick="plusSlides(-1)">&#10094;</a>
<a class="next" style="font-size:64px;color:#a0c3e8;" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center; padding-top:75px;">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
</div>



	<jsp:include page="components/footer.jsp" />
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) 
  {
	  window.location.href = "register?intro=false";
	  } 
  if (n < 1) 
  {
	  window.location.href = "/"; 
	  }
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none"; 
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block"; 
  dots[slideIndex-1].className += " active";
}
	</script>

</body>

</html>
