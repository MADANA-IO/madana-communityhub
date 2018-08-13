<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html lang="en" >


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://www.madana.io/assets/css/main.css">


<title>MADANA Community Hub</title>
  <meta charset="UTF-8">
 <style>


body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-image: url(http://www.madana.io/assets/img/hero-grid.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}
.button
{
	width: 300px;
	height: 55px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;

	font-size: 100px;
	font-weight: 800;
	padding: 50px;
	margin-top: 10px;

}

.grad{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(0,0,0,0)), color-stop(100%,rgba(0,0,0,0.65))); /* Chrome,Safari4+ */
	z-index: 1;
	opacity: 0.7;
}

.header{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 300px);
	z-index: 2;

}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(20%);
	left: calc(50% - 50px);
	height: 150px;
	width: 600px;
	z-index: 2;
}

.registerbutton{
	color:white;
	background: linear-gradient(to left, #4d7da2, #6e9cc6);
}
.loginbutton
{
	color:#4d7da2;
}
.login a{
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	width:200px;
	text-align:center;


}

.login input[type=text]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password]{
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255,255,255,0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=submit]{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=submit]:hover{
	opacity: 0.8;
}

.login input[type=submit]:active{
	opacity: 0.6;
}

.login input[type=text]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=password]:focus{
	outline: none;
	border: 1px solid rgba(255,255,255,0.9);
}

.login input[type=submit]:focus{
	outline: none;
}

::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>

<body>
<section id="pax" class="light-grey">
  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>
                <img src="http://www.madana.io/assets/img/logo-madana.png"	alt="MADANA Logo"width="175" height="175" style="text-align:center; display:block;"><p style="	text-align:center;font-size: 20px;"><h4>Community Hub</h4></p></div>
		</div>
		<br>
		<div class="login" style="font-size: 20px;">
		<h1>Welcome!</h1>
		<p>The Community Hub will be the future home of our community. Here you will be able to get the newest information about the progress and development of MADANA, engage actively in community campaigns and express your opinion on relevant topics in a fun and ludic way.</p>
		<p>For every interaction with certain community hub features, you will receive community points (CP). These points indicate your engagement in the community hub and for MADANA. These points influence your ranking on which basis MADANA decides how big the reward from community campaigns for you will be. The higher your rank, the better the reward will be. </p>
		
			<span><a class="button loginbutton" href="/login" style="">Login</a> 	<a class="button registerbutton" href="/register">Get started</a></span>
	
		
		
		</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  </section>

</body>

</html>