<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />
<jsp:include page="components/loginheader.jsp" />
<head>
</head>
<style>
.ethereum {
	position: absolute;
	top: calc(50% - 50px);
	left: calc(50%);
	height: 150px;
	width: 600px;
	z-index: 2;
}

@media screen and (max-width: 767px) {
	.ethereum {
		position: absolute;
		top: 250px;
		left: calc(22%);
		height: 150px;
		width: 250px;;
		z-index: 2;
	}
}
</style>

<body onload="checkWeb3()">
	<div id="nonce" hidden>${nonce}</div>

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
				style="font-family: Montserrat; font-style: normal; font-variant: normal; font-size: 24px; color: #a0c3e8 !important; position: absolute; top: 120px; left: -60px; margin-right: -50px;">
				Community Hub </span>
		</div>
	</div>
	<div class="content">
	
		<div class="ethereum">
		<h2>Pending signature challenge</h2>
		<p class="mobilehide">
	We are verifying the ownership of your account by generating and random text and letting you sign that data using your private key provided by metamask. If the signature can be verified we will consider you user the owner of that public address. The backend checks which MADANA account was linked with this address and provides an authentication token.
	</p>
	<h5>Waiting for input from metamask...</h5>
	<img src="https://cdn.madana.io/commonvisuals/icons/loading.gif" style="height:10px;width:150px;"> 
			<div id="error" style="color: red">${error}</div>
			<div id="info" style="color: green">${info}</div>

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
// source https://stackoverflow.com/questions/19064352/how-to-redirect-through-post-method-using-javascript/27766998
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
	redirectPost(window.location.href,{"wallet": web3.eth.coinbase, "nonce": nonce, "signature": signature})
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
