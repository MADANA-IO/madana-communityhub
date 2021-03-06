<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<style>
 #status {
    position: fixed;
    bottom: 0;
    left: 0;
  }
.color-dot {
  @include border-radius(99px);
  display:inline-block;
  width:10px;
  height:10px;
  margin-right:5px;

}
.login {
	position: absolute;
	top: calc(40%);
	left: calc(50% - 50px);
	height: 150px;
	width: 600px;
	z-index: 2;
}

.registerbutton {
	color: white;
	background: linear-gradient(to left, #4d7da2, #6e9cc6);
}

.loginbutton {
	color: #4d7da2;
}

.login a {
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	width: 200px;
	text-align: center;
}

.login input[type=text] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=submit] {
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=submit]:hover {
	opacity: 0.8;
}

.login input[type=submit]:active {
	opacity: 0.6;
}

.login input[type=text]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=password]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=submit]:focus {
	outline: none;
}

#container {
	height: 100%;
	width: 100%;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	position: fixed;
	top: 0;
	left: 0;
	/* Preserve aspet ratio */
	min-width: 100%;
	min-height: 100%;
	background-color: #162b40;
}

}
.slide {
	background: #274863;
	display: block;
	position: relative;
	left: -50;
	top: 0;
	height: 200px;
	width: 200px;
	background: blue;
	overflow: hidden;
}

body, html {
	margin: 0px;
	padding: 0px;
	width: 100%;
	overflow: hidden;
}

img {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

.grad {
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(0, 0
		, 0, 0)), color-stop(100%, rgba(0, 0, 0, 0.65)));
	/* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header {
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 300px);
	z-index: 2;
}

.header img {
	display: block;
	position: relative;
	left: -50;
	top: 0;
	height: 200px;
	width: 200px;
	overflow: hidden;
}

.header div {
	float: left;
	color: #fff;
	font-family: 'Montserrat';
	font-size: 35px;
	font-weight: 200;
}

.header div span {
	color: #5379fa !important;
}

@media ( max-width : 767px) {
	.header {
		position: absolute;
		height: 100px;
		width: 100px;;
		top: 50px;
		left: calc(50% - 50px);
		z-index: 2;
		width: 100%;
	}
	.login {
		position: absolute;
		top: 50%;
		left: -42%;
		height: 150px;
		width: 250px;;
		z-index: 2;
	}
	#container {
		background: #274863;
		left: 0;
		height: 100%;
		width: 100%;
		justify-content: center;
		align-items: center;
	}
}

#container table {
	position: absolute;
	left: -215px;
	height: 100%;
	width: 100%;
	justify-content: center;
	align-items: center;
}

.content {
	left: -200px;
	width: 100%;
	height: 150px;
	color: #f3f3f6;
	background: transparent;
}

body, html {
	margin: 0px;
	padding: 0px;
	width: 100%;
	background: #274863;
}

.header img {
	display: block;
	position: relative;
	top: 0;
	height: 100px;
	width: 100px;
	overflow: hidden;
}

.login input[type=text] {
	width: 200px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password] {
	width: 200px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=submit] {
	width: 200px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Montserrat';
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.mdl-button.mdl-button--colored {
	color: #a0c3e8;
	font-size: 2.8vw;
}
}
</style>


<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/TweenMax.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/jquery.js" /></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.20.2/utils/Draggable.min.js"></script>
<c:if test="${GOOGLECAPTCHA == 'true'}">
	<script
		src='https://www.google.com/recaptcha/api.js?render=<c:out value="${GOOGLECAPTCHA_WEBSITEKEY}"/>'></script>
</c:if>
</head>