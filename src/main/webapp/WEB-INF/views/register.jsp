<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://www.madana.io/css/style.css">
<link rel="stylesheet" href="http://www.madana.io/css/bootstrap.css">

<title>Spring Login Form</title>
</head>
<body
	style="background-image: url(http://www.madana.io/images/background/animation_1_bg.jpg); background-repeat: no-repeat; background-size: 100% 100%;">
	<div align="center"
		style="width: 100%; height: 100%; text-align: center;">
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br>
		<form:form name="submitForm" method="POST">

			<div
				style="display:block;align: center; margin: 0 auto; background-color: rgba(255, 255, 255, 0.9);width: 350px; height: 400px; text-align: center;">
				<img src="http://www.madana.io/images/logo.png"
					alt="MADANA Logo"
					width="250" height="250" style="text-align:center; padding-top:25px;padding-left:100px;
display:block;">
<br><br><br>
				<table>
				
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password" /></td>
					</tr>
					<tr>
						<td>Enter Password again</td>
						<td><input type="password" name="matchingPassword" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Submit" /></td>
					</tr>
				</table>
				<div style="color: red">${error}</div>

			</div>
		</form:form>
	</div>
</body>
</html>