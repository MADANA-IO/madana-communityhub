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
	top: calc(40%);
	left: calc(50% + 100px);
	height: 150px;
	width: 600px;
	z-index: 2;
}

@media screen and (max-width: 767px) {
	.login {
		position: absolute;
		top: 180px;
		left: 230px;
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
			<img
				src="https://cdn.madana.io/commonvisuals/backgrounds/hero-grid.jpg" />

			<div class="header">
				<div>
					<img
						src="https://cdn.madana.io/commonvisuals/logos/logo-madana@3x.png"
						alt="MADANA Logo" width="175" height="175"
						style="text-align: center; display: block;">
				</div>
			</div>
			<br>
			<div class="content">
				<div class="login">
					<form name="submitForm" method="POST">

						<div>

							<table>
								<tr>
									<td></td>
									<td style="color: #f3f3f6;" class="subheading"><input
										type="checkbox" name="del" value="del"> I want to
										delete my account</td>

								</tr>
								<tr>
									<td><br> <br></td>
								</tr>
								<tr>
									<td></td>
									<td style="color: #f3f3f6;" class="subheading"><input
										type="checkbox" name="TOC" value="read"> I've read and
										accept the <a style="font-size: 14px;" target="_blank"
										href="https://resources.madana.io/TERMSOFUSE_MADANA_CommunityHub.pdf">Terms
											of Use Agreement</a> and <a style="font-size: 14px;"
										target="_blank" href="https://www.madana.io/privacy-policy">Privacy
											policy</a></td>

								</tr>
								<tr>
									<td><br> <br></td>
									<td><input type="submit" id="registerbutton"
										value="Delete" /><input type="hidden" id="tokenfield"
										name="captchatoken" value="null"></td>

								</tr>
								<tr>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td><br> <br></td>
									<td><a href="/login">Log-In</a>
										<div style="color: red">${error}</div></td>
								</tr>

							</table>
		<c:if test="${GOOGLECAPTCHA == 'true'}">
							<script>
		
				   
			
grecaptcha.ready(function() 
		{
	
grecaptcha.execute('${GOOGLECAPTCHA_WEBSITEKEY}', {action: 'delete'})
.then(function(token) {
	document.getElementById("tokenfield").value = token;
});
});

</script>
</c:if>
						</div>
					</form>
					<jsp:include page="components/snackbar.jsp" />
				</div>
			</div>
		</div>


	</div>

	<c:if test="${not empty STATUSPAGE_PAGEID}">
		<div class="mobilehide" id="status">
			<a href="<c:out value="${STATUSPAGE_PAGELINK}"/>" target="_blank"
				style="text-decoration: none;"> <span class="color-dot"></span>
				<span class="color-description"></span>
			</a>
		</div>
		<jsp:include page="components/widgets/StatusPage.jsp" />
	</c:if>
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
