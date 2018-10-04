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
	top: calc(20%);
	left: calc(50% - 50px);
	height: 150px;
	width: 600px;
	z-index: 2;
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
				<div class="login">
					<h1>Welcome to the Community Hub!</h1>
					<p>The Community Hub will be the future home of our community.
						Here you will be able to get the newest information about the
						progress and development of MADANA, engage actively in community
						campaigns and express your opinion on relevant topics in a fun and
						ludic way.</p>
					<p>For every interaction with certain community hub features,
						you will receive community points (CP). These points indicate your
						engagement in the community hub and for MADANA. These points
						influence your ranking on which basis MADANA decides how big the
						reward from community campaigns for you will be. The higher your
						rank, the better the reward will be.</p>

					<span> <a class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" href="/register">Get
							started</a> </span>
							<span><a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="color:a0c3e8" href="/login">Login</a></span>



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
