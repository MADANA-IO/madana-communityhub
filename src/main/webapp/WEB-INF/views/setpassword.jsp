<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html lang="en" >


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.madana.io/assets/css/main.css">

<title>MADANA Community Hub</title>
  <meta charset="UTF-8">
  
  
  
      <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */


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
	background-image: url(https://www.madana.io/assets/img/hero-grid.jpg);
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
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
	left: calc(50% - 255px);
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
	top: calc(50% - 75px);
	left: calc(50% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login a{
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
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
	  <noscript id="loading-config">
      { 
        "phrases": ["Guiding the bits in your direction", "Spinning the cube", "Moving the satellite into position"], 
        "options": { 
          "typeSpeed": 50, 
          "backSpeed": 50, 
          "backDelay": 1000, 
          "loop": true 
        }
      }
    </noscript>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/loadingscreen.min.js"></script>
    
</head>

<body>

  <div class="body"></div>
		<div class="grad"></div>
	<div class="header">
			<div>
                <img src="https://www.madana.io/assets/img/logo-madana.png"	alt="MADANA Logo"width="175" height="175" style="text-align:center; display:block;"><p style="	text-align:center;font-size: 20px;"><h4>Community Hub</h4></p></div>
		</div>
		<br>
		<div class="login">
					<form:form name="submitForm" method="POST">

			<div>

				<table>
					<tr>
					
						<td><br><br>Email</td>
						<td><br><br><input type="text" name="email" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" /></td>
					</tr>
					<tr>
						<td>re-enter password </td>
						<td><input type="password" name="matchingPassword" /></td>
					</tr>
						<tr>
						<td><br><br></td>
						<td><input type="submit" value="set new password" /></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="/login">Login</a></td>
					</tr>
						<tr>
						<td><br><br></td>
						<td>	<div style="color: red">${error}</div></td>
					</tr>
					
				</table>
			

			</div>
		</form:form>
		</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  	  <loading-screen id="loading-screen" />
<script type="text/javascript" src="https://intranet.madana.io/jira/s/3c7b8ba2b9b6923997fd484e6a6c6162-T/-jyncwb/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=0e0352a0"></script>


  

</body>

</html>