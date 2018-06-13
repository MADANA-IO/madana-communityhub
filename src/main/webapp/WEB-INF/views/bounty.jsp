<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<!-- <link href=“https://fonts.googleapis.com/css?family=Montserrat” rel=“stylesheet”> -->
<!-- Global Site Tag (gtag.js) - Google Analytics -->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MADANA -Community</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="author" content="Jean-Fabian Wenisch">
<meta name="publisher" content="MADANA">
<meta name="copyright" content="MADANA">
<meta name="description"
	content="In March 2018, MADANA filed in a patent for its procedure at the DPMA in Germany: “Automated procedure for the protection
        of electronic data for the purpose of data processing by third parties including transparent and uninterruptible remuneration”.">
<meta name="keywords"
	content="MADANA, Madana, Blockchain, Data Privacy, Market for Data Analysis, Datasecurity">
<meta name="page-topic" content="Wissenschaft">
<meta name="page-type" content="...">
<meta http-equiv="content-language" content="en">
<meta name="robots" content="index, follow">
<!-- Favicon -->
<link rel="apple-touch-icon" href="apple-touch-icon-152x152.png">
<link rel="icon" href="favicon-196x196.png">
<link rel="apple-touch-icon-precomposed" sizes="57x57"
	href="https://www.madana.io/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="https://www.madana.io/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="https://www.madana.io/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="https://www.madana.io/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon-precomposed" sizes="60x60"
	href="https://www.madana.io/apple-touch-icon-60x60.png" />
<link rel="apple-touch-icon-precomposed" sizes="120x120"
	href="https://www.madana.io/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon-precomposed" sizes="76x76"
	href="https://www.madana.io/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon-precomposed" sizes="152x152"
	href="https://www.madana.io/apple-touch-icon-152x152.png" />
<link rel="icon" type="image/png" href="favicon-196x196.png"
	sizes="196x196" />
<link rel="icon" type="image/png" href="favicon-96x96.png" sizes="96x96" />
<link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
<link rel="icon" type="image/png" href="favicon-128.png" sizes="128x128" />
<meta name="application-name" content="&nbsp;" />
<meta name="msapplication-TileColor" content="#FFFFFF" />
<meta name="msapplication-TileImage"
	content="https://www.madana.io/mstile-144x144.png" />
<meta name="msapplication-square70x70logo"
	content="https://www.madana.io/mstile-70x70.png" />
<meta name="msapplication-square150x150logo"
	content="https://www.madana.io/mstile-150x150.png" />
<meta name="msapplication-wide310x150logo"
	content="https://www.madana.io/mstile-310x150.png" />
<meta name="msapplication-square310x310logo"
	content="https://www.madana.io/mstile-310x310.png" />
<!--  Open Graph Tags -->
<meta property="og:title" content="MADANA - Patent Pending">
<meta property="og:description"
	content="In March 2018, MADANA filed in a patent for its procedure at the DPMA in Germany: “Automated procedure for the protection
        of electronic data for the purpose of data processing by third parties including transparent and uninterruptible remuneration”.">
<meta property="og:image"
	content="https://www.madana.io/images/patent-pending.png">
<meta property="og:url" content="https://www.madana.io/patent">
<meta name="twitter:card" content="summary_large_image">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.grey-indigo.min.css" />
<!-- Bootstrap Core CSS -->
<link href="https://www.madana.io/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link
	href="https://www.madana.io/fonts/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="https://www.madana.io/css/font-awesome.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link href="https://www.madana.io/css/style.css" rel="stylesheet">
<link href="https://www.madana.io/css/patent-page.css" rel="stylesheet">
<link href="https://www.madana.io/css/responsive.css" rel="stylesheet">

<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<style>
.background {
	background-image:
		url("http://www.madana.io/images/animations/Animation 3/Animation_3_1.jpg");
	background-repeat: no-repeat;
	background-size: 100% 200%;
	background-position: center;
	background-color: black;
	z-index: 1000000;
	color: #d6e2ec;
}
</style>
</head>
<body class="background">
	<ul id="social_side_links" style="text-align: center;">
		<li><a style="background-color: #1dadeb;"
			href="https://twitter.com/madana_hq" target="_blank"
			onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_sidebar', eventLabel: 'Twitter'});">
				<i style="display: inline-block; margin: 0 auto;"
				class="fa fa-twitter"></i>
		</a></li>
		<li><a style="background-color: #FF5700;"
			href="http://reddit.com/r/MADANA" target="_blank"
			onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_sidebar', eventLabel: 'Reddit'});">
				<i style="display: inline-block; margin: 0 auto;"
				class="fa fa-reddit"></i>
		</a></li>
		<li><a style="background-color: #0088cc;"
			href="https://t.me/madanaofficial" target="_blank"
			onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_sidebar', eventLabel: 'Telegram'});">
				<i style="display: inline-block; margin: 0 auto;"
				class="fa fa-telegram"></i>
		</a></li>
		<li><a style="background-color: #000000;"
			href="https://blog.madana.io" target="_blank"
			onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_sidebar', eventLabel: 'Medium'});">
				<i style="display: inline-block; margin: 0 auto;"
				class="fa fa-medium"></i>
		</a></li>
		<!-- <li><a style="background-color: #5c3a58;" href="https://linkedin.com" target="_blank"><i style="display:inline-block; margin:0 auto;"  class="fa fa-slack"></i> </a></li> -->
	</ul>
	<!-- scrollToTop -->
	<!-- ================ -->
	<div class="scrollToTop">
		<i class="icon-up-open-big"></i>
	</div>
	<!-- header start -->
	<!-- ================ -->
	<header class="header fixed clearfix navbar navbar-fixed-top">
	<div class="container">
		<div class="row">
			<div class="col-xs-4">
				<!-- header-left start -->
				<!-- ================ -->
				<div class="header-left clearfix">
					<!-- logo -->
					<div class="logo smooth-scroll">
						<a href="https://www.madana.io#banner"> <img id="logo"
							src="https://www.madana.io/images/logo.png" alt="MADANA">
						</a>
					</div>
				</div>
				<!-- header-left end -->
			</div>
			<div class="col-xs-8">
				<!-- header-right start -->
				<!-- ================ -->
				<div class="header-right clearfix">
					<!-- main-navigation start -->
					<!-- ================ -->
					<div class="main-navigation animated">
						<!-- navbar start -->
						<!-- ================ -->
						<nav class="navbar navbar-default" role="navigation">
						<div class="container-fluid">
							<!-- Toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target="#navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse scrollspy smooth-scroll"
								id="navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right">
									<li class="active"><a href="https://www.madana.io#banner">HOME</a>
									</li>
									<li><a href="https://www.madana.io#about">ABOUT</a></li>
									<li><a href="https://www.madana.io#pax">PAX</a></li>
									<li><a href="https://www.madana.io#team">TEAM</a></li>
									<li><a href="https://www.madana.io#media">MEDIA</a></li>
									<li><a href="https://www.madana.io#faq">FAQ</a></li>
								</ul>
							</div>
						</div>
						</nav>
						<!-- navbar end -->
					</div>
					<!-- main-navigation end -->
				</div>
				<!-- header-right end -->
			</div>
		</div>
	</div>
	</header>
	<!-- header end -->
	<div align="center" class="section">

		<div class="container section " align="left"
			style="margin-top: 20px; padding-left: 20px; padding-top: 50px; margin-bottom: -30px; background-color: rgba(77, 125, 162, 0.1);">
			<table style="width: 100%">
				<tr>
					<td><img
						src="http://www.madana.io/images/animations/Animation 2/A2_Transform_1_2.png"
						alt="MADANA Logo" width="80" height="175"
						style="text-align: center; display: block;">
						<h2>${msg}</h2></td>
					<td>
						<h1>5000000000pts</h1>
					</td>
				</tr>
			</table>
		</div>

		<div class="container" style="background-color: #274863;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" align="center">
				<ul class="nav navbar-nav">
					<li class="active"><a href="<c:url value="/success" />">Home</a></li>
					<li><a href="<c:url value="/bounty" />">Bounty</a></li>
					<li><a href="<c:url value="/rather" />">Rather</a></li>
					<li><a href="<c:url value="/ranking" />">Ranking</a></li>
					<li><a href="<c:url value="/achievments" />">Achievments</a></li>

				</ul>
			</div>
		</div>
		<div class="container section-about " style="height: 100%">
			<h1>Bounty</h1>
			<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
				<div class="mdl-tabs__tab-bar">
					<span class="mdl-badge" data-badge="${fn:length(feed_facebook)}"> <a
						href="#starks-panel" class="mdl-tabs__tab is-active"></a>Facebook</span> <a
						href="#lannisters-panel" class="mdl-tabs__tab">Twitter</a> <a
						href="#targaryens-panel" class="mdl-tabs__tab">LinkedIn</a> <a
						href="#targaryens-panel" class="mdl-tabs__tab">Reddit</a> <a
						href="#targaryens-panel" class="mdl-tabs__tab">Telegram</a> <a
						href="#targaryens-panel" class="mdl-tabs__tab">Referal</a>
				</div>

				<div class="mdl-tabs__panel is-active" id="starks-panel">
					<ul class="demo-list-three mdl-list">
					<c:forEach items="${feed_facebook}" var="facebookpost">
						<li class="mdl-list__item mdl-list__item--three-line"><span
							class="mdl-list__item-primary-content"> <i
								class=" mdl-list__item-avatar"><img src="${facebookpost.picture}" alt="Italian Trulli"></i> <span>${facebookpost.created}</span> <span class="mdl-list__item-text-body">
									${facebookpost.text} </span>
						</span> <span class="mdl-list__item-secondary-content"> <a
								class="mdl-list__item-secondary-action" href="#"><i
									class="material-icons">star</i></a>
						</span></li>
					</c:forEach>
					</ul>
				</div>
				<div class="mdl-tabs__panel" id="lannisters-panel">
					<ul>
						<li>Tywin</li>
						<li>Cersei</li>
						<li>Jamie</li>
						<li>Tyrion</li>
					</ul>
				</div>
				<div class="mdl-tabs__panel" id="targaryens-panel">
					<ul>
						<li>Viserys</li>
						<li>Daenerys</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- <div id="banner" class="section section-intro">
        <div id="document-embed" class="container">
            <embed src="files/15649-PT-DE-Patent.pdf" type="application/pdf" width="100%" height="100%" />
        </div>
    </div> -->
	<!-- ================ -->
	<section id="media" class="section-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4" align="center">
				<ul align="left">
					<p>
						2018 MADANA. <br> All rights reserved.
					</p>
				</ul>
			</div>
			<div class="col-md-4" align="center">
				<!-- Trigger the modal with a button -->
				<button type="button" class="btn" data-toggle="modal"
					data-target="#myModal">Imprint</button>
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Imprint</h4>
							</div>
							<div class="modal-body">
								<p>
									<strong>MADANA UG (haftungsbeschränkt)</strong> <br> c/o
									WeWork Sony Center <br>
								</p>
								<p>
									Kemperplatz 1, Building A <br> 10785 Berlin <br>
									Germany <br>
								<p>
									<i class="fa fa-envelope" aria-hidden="true"> </i>
									info@madana.io
								</p>
								<br>
								<p>Represented by Christian G. Junger & Dieter Schule</p>
								<p>
									Register court: Amtsgericht Charlottenburg <br>Register
									number: HRB 194081 B
								</p>
								<p>USt-ID: DE 316 508 179</p>
								<br> <br>
								<p>
									<strong>Data Privacy Statement</strong> <br> <br>
									This website uses Google Analytics, a web analytics service
									provided by Google, Inc. ("Google"). Google Analytics uses
									"cookies", which are text files placed on your computer to help
									the website analyse how visitors use the site. The information
									generated by the cookie about your use of the website
									(including your IP address) will be transmitted to and stored
									by Google on servers in the United States . Google will use
									this information for the purpose of evaluating your use of the
									website, compiling reports on website activity for website
									operators and providing other services relating to website
									activity and internet usage. Google may also transfer this
									information to third parties where required to do so by law, or
									where such third parties process the information on Google's
									behalf. Google will not associate your IP address with any
									other data held by Google. You may refuse the use of cookies by
									selecting the appropriate settings on your browser, however
									please note that if you do this you may not be able to use the
									full functionality of this website. By using this website, you
									consent to the processing of data about you by Google in the
									manner and for the purposes set out above. <br> <br>
									You can prevent Google’s collection and use of data (cookies
									and IP address) by downloading and installing the browser
									plug-in available under
									https://tools.google.com/dlpage/gaoptout?hl=en. <br> <br>
									Please note that this website initializes Google Analytics with
									the setting: anonymizeIp This guarantees anonymized data
									collection by masking the last part of your IP address. <br>
									<br> Further information concerning the terms and
									conditions of use and data privacy can be found at
									http://www.google.com/analytics/terms/gb.html or at
									http://www.google.com/intl/en_uk/analytics/privacyoverview.html
								</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4" align="center">
				<p>
					<a target="_blank" href="mailto:info@madana.io"> <i
						class="fa fa-envelope" aria-hidden="true"></i> info@madana.io
					</a>
				</p>
				<p class="social-links">
					<a target="_blank" href="https://www.reddit.com/r/MADANA/"> <i
						class="fa fa-reddit"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Reddit'});"></i>
					</a> <a target="_blank" href="https://t.me/madanaofficial"> <i
						class="fa fa-telegram"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Telegram'});"></i>
					</a> <a target="_blank" href="https://blog.madana.io"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Github'});">
						<i class="fa fa-medium"></i>
					</a> <a target="_blank" href="https://twitter.com/madana_hq"> <i
						class="fa fa-twitter"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Twitter'});"></i>
					</a> <a target="_blank" href="https://www.facebook.com/madana.io/">
						<i class="fa fa-facebook"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Facebook'});"></i>
					</a> <a target="_blank"
						href="https://www.linkedin.com/company/18227151/"> <i
						class="fa fa-linkedin"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'LinkedIn'});"></i>
					</a> <a target="_blank" href="https://www.xing.com/companies/madana">
						<i class="fa fa-xing"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Xing'});"></i>
					</a> <a target="_blank"
						href="https://www.youtube.com/channel/UCPxsLkfAY63FV5kgTceZUNQ">
						<i class="fa fa-youtube"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Youtube'});"></i>
					</a> <a target="_blank" href="https://github.com/MADANA-IO"> <i
						class="fa fa-git-square"
						onClick="ga('send', 'event', { eventCategory: 'Social', eventAction: 'button_click_footer', eventLabel: 'Github'});"></i>
					</a>
					<!--  
                            
                            <a target="_blank" href="https://github.com/JFWenisch"><i class="fa fa-slack"></i></a>
                                <a target="_blank" href="https://github.com/JFWenisch"><i class="fa fa-btc"></i></a>
                            <a target="_blank" href="https://github.com/JFWenisch"><i class="fa fa-wechat"></i></a>
                            <a target="_blank" href="https://github.com/JFWenisch"><i class="fa fa-telegram"></i></a>
                                <a target="_blank" href="https://github.com/JFWenisch"><i class="fa fa-reddit"></i></a>
                                    <a target="_blank" href="https://github.com/JFWenisch"><i class="fa fa-youtube"></i></a> -->
				</p>
			</div>
		</div>
	</div>
	</section>
	<!-- section end -->
	<footer> <script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<!-- Jquery and Bootstap core js files --> <script
		type="text/javascript"
		src="https://www.madana.io/plugins/jquery.min.js"></script> <script
		type="text/javascript"
		src="https://www.madana.io/bootstrap/js/bootstrap.min.js"></script> <!-- Backstretch javascript -->
	<script type="text/javascript"
		src="https://www.madana.io/plugins/jquery.backstretch.min.js"></script>
	<!-- Appear javascript --> <script type="text/javascript"
		src="https://www.madana.io/plugins/jquery.appear.js"></script> <script
		type="text/javascript" src="https://www.madana.io/js/template.js"></script>
	</footer>
</body>
</html>