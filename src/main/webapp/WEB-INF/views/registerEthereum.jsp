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
				<c:if test="${not empty nonce}">
    

					<tr>
			
						<td><input  style="border: 1px solid #4d7da2;"  id="username" type="text" placeholder="Username" name="username" /></td>
					</tr>
					<tr>
					
				
						<td><br><input  style="border: 1px solid #4d7da2;"  id="email"  type="text"  placeholder="E-Mail"name="email" /></td>
					</tr>
					
						<tr>
				
						<td style="color:#f3f3f6;" class="subheading" ><input id="toc" type="checkbox" name="TOC" value="read" > I've read and accept the <a style="font-size:14px;"target="_blank" href="https://resources.madana.io/TERMSOFUSE_MADANA_CommunityHub.pdf">Terms of Use Agreement</a> and <a style="font-size:14px;" target="_blank" href="https://www.madana.io/privacy-policy">Privacy policy</a></td>
						
					</tr>
				</c:if>
						<tr>
				
						<td>		<br><br>
						<span id="web3signup" 
								style="background: white;color:#274863; border: 1px solid #4d7da2; padding: 10px; width: 250px;">
								<c:if test="${not empty nonce}">
									<img
										src="https://metamask.io/img/metamask.png"
										style="position: relative;left:8px; height: 20px; width: 20px;">
										<span style="padding-left:8px;">Signup with MetaMask </span>
												</c:if>
												<c:if test="${ empty nonce}">
									<img
										src="https://metamask.io/img/metamask.png"
										style="position: relative;left:8px; height: 20px; width: 20px;">
										<span style="padding-left:8px;">Open Metamask </span>
												</c:if>
							</span><input type="hidden" id="tokenfield" name="captchatoken" value="null">
						</td>
						
					</tr>
				
						<tr>
						<td><br><br><a  
									 href="/login" style="text-decoration:none;">Already have an Account?</a><br><br><a  
									 href="/register/basic" style="text-decoration:none;">Signup using password</a>	<div id="error" style="color: red">${error}</div></td>
					</tr>
					
				</table>
		<c:if test="${GOOGLECAPTCHA == 'true'}">
			<script>
		
				   
			
grecaptcha.ready(function() 
		{
	
grecaptcha.execute('${GOOGLECAPTCHA_WEBSITEKEY}', {action: 'registerEthereum'})
.then(function(token) {
	document.getElementById("tokenfield").value = token;
});
});

</script>
</c:if>
			</div>
		</form>
		

		<script>
  $(document).ready(function(){
    $('#web3signup').click(function(){
    	checkWeb3();
    });
  });
</script>
		<div id="nonce" hidden>${nonce}</div>
	<jsp:include page="components/snackbar.jsp" />
				</div>
			</div>

<jsp:include page="components/statuspage.jsp" />
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
//source https://stackoverflow.com/questions/19064352/how-to-redirect-through-post-method-using-javascript/27766998
function redirectPost(url, data) {
    var form = document.createElement('form');
    document.body.appendChild(form);
    form.method = 'post';
    form.action = url;
    for (var name in data) {
	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = name;
	input.value = data[name];
	form.appendChild(input);
    }
    form.submit();
}

async function askForAddress() {
	await ethereum.enable()
	redirectPost(window.location.href,{"wallet": web3.eth.coinbase})
}

function signNonce(nonce) {
    web3.personal.sign(web3.fromUtf8(nonce), web3.eth.coinbase, (error, signature) => {
    if (error == null) {
	redirectPost(window.location.href,{"wallet": web3.eth.coinbase, "nonce": nonce, "signature": signature, "username": document.getElementById("username").value, "email": document.getElementById("email").value,"read":document.getElementById("toc").checked, "captchatoken":document.getElementById("tokenfield").value })
      //document.getElementById("signature").innerHTML = "Your signature is: "+signature;
    } else {
      //document.getElementById("signature").innerHTML = "Failed to get signature: "+error;
    }
  });
}

function checkWeb3() {
  if (typeof window.ethereum !== 'undefined'
  || (typeof window.web3 !== 'undefined')) {
    // Web3 browser user detected. You can now use the provider.
    const provider = window['ethereum'] || window.web3.currentProvider
	error = document.getElementById("error").innerHTML
	if (error == "") {
		nonce = document.getElementById("nonce").innerHTML
		if (nonce == "") {
			askForAddress()
		} else {
			signNonce(nonce)
		}
	}
  } else {
    const provider = null
    document.getElementById("error").innerHTML = "Your browser does not support DAPPS";
  }
}

	</script>
</html>
