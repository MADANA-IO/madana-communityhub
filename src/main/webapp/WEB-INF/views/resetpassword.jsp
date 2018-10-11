<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />
<jsp:include page="components/loginheader.jsp" />
<style>
.login {
	position: absolute;
	top: calc(45%);
	   left: calc(60%);

	height: 150px;
	width: 400px;
	z-index: 2;
}
@media screen and (max-width: 767px)
 {

.login {
	position: absolute;
	top: 180px;
	left:250px;
	height: 150px;
	width: 100%;;
	z-index: 2;
}

}
</style>





<body>

	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<div id="container">
			<img src="https://www.madana.io/assets/img/hero-grid.jpg" />

			<div class="header">
				<div>
					<img src="https://www.madana.io/assets/img/logo-madana@3x.png"
						alt="MADANA Logo" width="175" height="175"
						style="text-align: center; display: block;">
				</div>
			</div>
			<br>
			<div class="content">
				<div class="login">				<form name="submitForm" method="POST">

			<div>

				<table>
					<tr>
						<td>E-Mail</td>
						<td><input type="text"
							placeholder="Please enter your E-Mail address" name="mail" /></td>
					</tr>
					<tr>
						<td><br><br></td>
						</tr>
					<tr>
						<td><br><br></td>
						<td><input type="submit" value="Reset password" /></td>
					</tr>
					<tr>
						<td></td>
						<td><br><a href="/register">Create an Account</a> </td>
					</tr>
					
						<tr>
						<td><br><br></td>
						<td>	<div style="color: red">${error}</div></td>
					</tr>
					
				</table>
			

			</div>
		</form>
	<jsp:include page="components/snackbar.jsp" />
				</div>
			</div>
		</div>


	</div>



	<jsp:include page="components/footer.jsp" />


</body>
<script type="text/javascript">
$("#container").mousemove(function(e) {
  parallaxIt(e, ".slide", -100);
  parallaxIt(e, "img", -30);
});

function parallaxIt(e, target, movement) {
  var $this = $("#container");
  var relX = e.pageX - $this.offset().left;
  var relY = e.pageY - $this.offset().top;

  TweenMax.to(target, 1, {
    x: (relX - $this.width() / 2) / $this.width() * movement,
    y: (relY - $this.height() / 2) / $this.height() * movement
  });
}
	</script>
</html>
