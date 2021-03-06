<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />
<jsp:include page="components/loginheader.jsp" />
<head>
<script language="javascript">
				function authenticate(username,password){
				
					   document.getElementById("username").value = username;
					   document.getElementById("password").value = password;
					   document.getElementById("submitForm").submit();
					}
				</script>
</head>
<style>
.login {
	position: absolute;
	top: calc(50% - 100px);
	left: calc(50%);
	height: 150px;
	width: 600px;
	z-index: 2;
}

@media screen and (max-width: 767px) {
	.login {
		position: absolute;
		top: 220px;
		left: calc(21%);
		height: 150px;
		width: 250px;;
		z-index: 2;
	}
}
</style>





<body>

	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<div id="container"
			style="height: 100%; width: 100%; justify-content: center; align-items: center; overflow: hidden; position: fixed; top: 0; left: 0; min-width: 100%; min-height: 100%; background-color: rgba(39, 72, 99, 0.3); background-image: url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid.jpg); background-size: cover; background-blend-mode: multiply; -webkit-filter: blur(5px);">



			<br>

		</div>


	</div>
	<div class="header">
		<div>
			<img
				src="https://cdn.madana.io/commonvisuals/logos/logo-madana@3x.png"
				alt="MADANA Logo" width="175" height="175"
				style="text-align: center; display: block;"> <span
				style="font-family: Montserrat; font-style: normal; font-variant: normal; font-size: 24px; color: #a0c3e8 !important; position: absolute; top: 120px; left: -60px; margin-right: -50px;">Community
				Hub</span>
		</div>
	</div>
	<div class="content">
		<div class="login">
			<h1 class="mobilehide">Welcome!</h1>
			<p >The Community Hub will be the future home of our community.
				Here you will be able to get the newest information about the
				progress and development of MADANA, engage actively in community
				campaigns and express your opinion on relevant topics.</p>


			<!-- 	<p>For every interaction with certain community hub features,
						you will receive community points (CP). These points indicate your
						engagement in the community hub and for MADANA. These points
						influence your ranking on which basis MADANA decides how big the
						reward from community campaigns for you will be. The higher your
						rank, the better the reward will be.</p> -->
			
		 <span> <a
				class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
				style="background:rgba(255,255,255,0.7);color: #274863;padding:5px; font-size: 12px;" href="/register">Get
					started</a>
			</span> 	<span><a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style=" font-size: 12px;padding:5px;"
				href="/login">Login</a></span>


			<jsp:include page="components/snackbar.jsp" />
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
