<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Material Design Lite</title>

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="images/android-desktop.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="images/touch/ms-touch-icon-144x144-precomposed.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="images/favicon.png">

<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

<link href=“https://fonts.googleapis.com/css?family=Montserrat”
	rel=“stylesheet”>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/styles.css" />
<style>
#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
	z-index: 900;
}
</style>
</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<header class="demo-header mdl-layout__header">
		<div class="mdl-layout__header-row">
			<span class="mdl-layout-title">Home</span>
			<div class="mdl-layout-spacer"></div>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
				<label class="mdl-button mdl-js-button mdl-button--icon"
					for="search"> <i class="material-icons">search</i>
				</label>
				<div class="mdl-textfield__expandable-holder">
					<input class="mdl-textfield__input" type="text" id="search">
					<label class="mdl-textfield__label" for="search">Enter your
						query...</label>
				</div>
			</div>
			<button
				class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon"
				id="hdrbtn">
				<i class="material-icons">more_vert</i>
			</button>
			<ul
				class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right"
				for="hdrbtn">
				<li class="mdl-menu__item">About</li>
				<li class="mdl-menu__item">Contact</li>
				<li class="mdl-menu__item">Legal information</li>
			</ul>
		</div>
		</header>
		<div class="demo-drawer mdl-layout__drawer ">
			<header class="demo-drawer-header"> <img
				src="http://www.madana.io/images/animations/Animation 2/A2_3.png"
				class="demo-avatar">
			<div class="demo-avatar-dropdown">
				<span><h4>${msg}</h4></span>
				<div class="mdl-layout-spacer"></div>
				<button id="accbtn"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
					<i class="material-icons" role="presentation">arrow_drop_down</i> <span
						class="visuallyhidden">Accounts</span>
				</button>
				<ul
					class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
					for="accbtn">
					<li class="mdl-menu__item"><i class="material-icons">add</i>Create
						account...</li>
					<li class="mdl-menu__item"><i class="material-icons">lock_open</i>Login...</li>
					<li class="mdl-menu__item"><i class="material-icons">lock</i>Logout...</li>
				</ul>
			</div>
			</header>
			<nav class="demo-navigation mdl-navigation"> <a
				class="mdl-navigation__link" href="/home"><i
				class=" material-icons" role="presentation">home</i>Home</a> <a
				class="mdl-navigation__link" href="/profile"><i
				class=" material-icons" role="presentation">person</i>Profile</a> <a
				class="mdl-navigation__link" href="/bounty"><i
				class=" material-icons" role="presentation">share</i>Bounty</a> <a
				class="mdl-navigation__link" href="/rather"><i
				class=" material-icons" role="presentation">poll</i>Rather</a> <a
				class="mdl-navigation__link" href="ranking"><i
				class=" material-icons" role="presentation">group</i>Ranking</a>
			<div class="mdl-layout-spacer"></div>

			<div class="mdl-layout-spacer"></div>
			<a class="mdl-navigation__link" href=""><i
				class=" material-icons" role="presentation">help_outline</i><span
				class="">Help</span></a> </nav>
		</div>
		<main class="mdl-layout__content content">
		<div class="mdl-grid demo-content">

			<div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--12-col">
				<h1>Bounty</h1>
				<br> <br>
				 <br> <br>

				<div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
					<div class="mdl-tabs__tab-bar">
						<c:forEach items="${social_platforms}" var="platform">
							<span class="mdl-badge" data-badge="${fn:length(platform.feed)}"><img
								style="height: 40px;" src="${platform.icon}"></img> <a
								href="#${platform.name}-panel" class="mdl-tabs__tab is-active">${platform.name}</a>
							</span>
						</c:forEach>

						<span><img style="height: 40px;"
							src="https://image.freepik.com/free-icon/myspace-social-share_318-25327.jpg"></img>
							<a href="#Referral-panel" class="mdl-tabs__tab">Referral</a> </span>
					</div>

					<c:forEach items="${social_platforms}" var="platform">
						<div class="mdl-tabs__panel" id="${platform.name}-panel"
							style="padding: 70px; margin-top: 100px; background-color: #f3f3f6;">
							<div class=" mdl-card mdl-shadow--2dp"
								style="width: 100%; align: center;">
								<div class="mdl-card__title mdl-card--expand"
									style="background-color: #4d7da2; height: 100px;">
									<div style="width: 50%;">
										<img style="height: 40px; float: left;" src="${platform.icon}"></img>
										<h2 class="mdl-card__title-text" style="color: #f3f3f6"">${platform.name}</h2>
									</div>
									<div style="width: 50%;">
										<span style="float: right;"><a
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
											style="color: #b2d1ef" href="${platform.link}"> View
												Updates </a> <a href="/auth/${platform.name}"><button
													class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent"
													style="background-color: #a0c3e8">Verify Account</button></a></span>
									</div>
								</div>
								<div class="mdl-card__supporting-text">
									<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr,
										sed diam nonumy eirmod tempor invidunt ut labore et dolore
										magna aliquyam erat, sed diam voluptua. At vero eos et accusam
										et justo duo dolores et ea rebum. Stet clita kasd gubergren,
										no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem
										ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
										nonumy eirmod tempor invidunt ut labore et dolore magna
										aliquyam erat, sed diam voluptua. At vero eos et accusam et
										justo duo dolores et ea rebum. Stet clita kasd gubergren, no
										sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem
										ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
										nonumy eirmod tempor invidunt ut labore et dolore magna
										aliquyam erat, sed diam voluptua. At vero eos et accusam et
										justo duo dolores et ea rebum. Stet clita kasd gubergren, no
										sea takimata sanctus est Lorem ipsum dolor sit amet. Duis
										autem vel eum iriure dolor in hendrerit in vulputate velit
										esse molestie consequat, vel illum dolore eu feugiat nulla
										facilisis at vero eros et accumsan et iusto odio dignissim qui
										blandit praesent luptatum zzril delenit augue duis dolore te
										feugait nulla facilisi. Lorem ipsum dolor sit amet,</p>
								</div>
								<div class="mdl-card__actions mdl-card--border">


									<ul>
										<c:forEach items="${platform.feed}" var="post">
											<li class="mdl-list__item mdl-list__item--three-line"
												style="color: #4d7da2"><span
												class="mdl-list__item-primary-content" style="width: 150px;">
													<i class=" mdl-list__item-avatar"
													style="width: 150px; height: 200px;"><img
														src="${post.picture}" style="width: 150px;"></i> <span>${post.created}</span>
													<span class="mdl-list__item-text-body"
													style="height: 250px; color: #274863">${post.text} </span>
											</span> <span style="color: #4d7da2"
												class="mdl-list__item-secondary-content"> <a
													class="mdl-list__item-secondary-action" target="_blank"
													href="${post.link}"><i class="material-icons">share</i>
														Share</a><br> <a class="mdl-list__item-secondary-action"
													target="_blank" href="${post.link}"><i
														class="material-icons">thumb_up</i> Like</a>


											</span></li>
											<hr width=50%>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>


	</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
