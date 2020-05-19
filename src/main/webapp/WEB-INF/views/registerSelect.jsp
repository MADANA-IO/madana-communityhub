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
top: calc(50% - 50px);
	left: calc(50%);
	height: 150px;
	width: 600px;
	z-index: 2;
}
@media screen and (max-width: 767px)
 {
.login {
	position: absolute;
	top: 250px;
	    left: calc(22%);
	height: 150px;
	width: 250px;;
	z-index: 2;
}
}

</style>





<body>

	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<div id="container" style="    height: 100%;
    width: 100%;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    position: fixed;
    top: 0;
    left: 0;
    min-width: 100%;
    min-height: 100%;
    background-color: rgba(39,72,99,0.3);
    background-image: url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid.jpg);
    background-size: cover;
    background-blend-mode: multiply;
    -webkit-filter: blur(5px);">
		

		
			<br>

		</div>


	</div>
		<div class="header">
				<div>
				 <img id="logo" src="https://cdn.madana.io/commonvisuals/logos/logo-madana@3x.png"
						alt="MADANA Logo" width="175" height="175"
						style="text-align: center; display: block;"> 
						<span style="   font-family: Montserrat;
    font-style: normal;
    font-variant: normal;
    font-size: 24px;
    color: #a0c3e8 !important;
    position: absolute;
    top: 120px;
    left: -60px;
        margin-right: -50px;
">Community Hub</span>
				</div>
			</div>
			<div class="content">
				<div class="login">
					<form name="submitForm" method="POST">

			<div>

				<table>
			
					<tr>
					
				
						<td><br>		<span><a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" style="width:100%; font-size: 12px;;padding:10px;"
				href="/register/basic">Signup with Password</a></span></td>
					</tr>
				
						<tr>
				
						<td>	<br>	<a style="text-decoration:none;width:100%;padding:5px;"href="/register/ethereum" ><span 
								style="background: white;color:#274863; width:100%;border: 1px solid #4d7da2; border-radius:14px;padding: 10px; ">
							
									<img
										src="<%=request.getContextPath()%>/resources/img/metamask.svg"
										style="position: relative;left:8px; height: 20px; width: 20px;">
										<span style="padding-left:8px;">Signup with MetaMask </span>
												
							</span></a>
						</td>
						
					</tr>
				
						<tr>
						<td><br><br><a  
									 href="/login" style="text-decoration:none;">Already have an Account?</a>	<div style="color: red">${error}</div></td>
					</tr>
					
				</table>


			</div>
		</form>
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
  parallaxIt(e, ".logo", -30);
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
