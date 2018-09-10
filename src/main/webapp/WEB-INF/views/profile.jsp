<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>MADANA Community Hub</title>

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
<link rel="stylesheet" href="http://www.madana.io/assets/css/main.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/materials.css" />


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
<link href=' http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<link href=' http://fonts.googleapis.com/css?family=Montserrat'
	rel='stylesheet' type='text/css'>
<noscript id="loading-config">{ "phrases": ["Guiding the bits
	in your direction", "Spinning the cube", "Moving the satellite into
	position"], "options": { "typeSpeed": 50, "backSpeed": 50, "backDelay":
	1000, "loop": true } }</noscript>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/loadingscreen.min.js"></script>

</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<header class="mdl-layout__header mdl-layout__header--transparent ">
		<div class="mdl-layout__header-row mdnheader">
			<!-- Title -->

			<span class="mdl-layout-title"> <img
				src="http://www.madana.io/assets/img/logo-madana.png"
				alt="MADANA Logo" width="50" height="50"> Community Hub
			</span>

		</div>
		</header>
		<div class="demo-drawer mdl-layout__drawer mdnnav">
			<header class="demo-drawer-header"> <img src="${user.image}"
				width="75" height="75"> <br>
			<span>${user.points} CP</span>
			<div class="demo-avatar-dropdown">
				<span><h3>${user.userName}</h3></span>

				<div class="mdl-layout-spacer"></div>
				<button id="accbtn"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
					<i class="material-icons" role="presentation">arrow_drop_down</i> <span
						class="visuallyhidden">Accounts</span>
				</button>
				<ul
					class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
					for="accbtn">
					<li class="mdl-menu__item"><i class="material-icons">lock</i>Logout...</li>
				</ul>
			</div>
			<script data-jsd-embedded
				data-key="8c642375-cfe7-4f3c-9c7c-9b8ea797da80"
				data-base-url="https://jsd-widget.atlassian.com"
				src="https://jsd-widget.atlassian.com/assets/embed.js"></script> </header>
			<nav class="demo-navigation mdl-navigation mdnnav"> <a
				class="mdl-navigation__link" href=/"home"><i
				class=" material-icons" role="presentation">home</i>Home</a> <a
				class="mdl-navigation__link" href="/profile"><i
				class=" material-icons" role="presentation">person</i>Profile</a> <a
				class="mdl-navigation__link" href="/ranking"><i
				class=" material-icons" role="presentation">group</i>Ranking</a> <a
				class="mdl-navigation__link" href="/settings"><i
				class=" material-icons" role="presentation">settings</i>Settings</a>
			<div class="mdl-layout-spacer"></div>

			<div class="mdl-layout-spacer"></div>
			<a target="_blank" class="mdl-navigation__link"
				href="http://faq.madana.io"><i
				class=" material-icons" role="presentation">help_outline</i><span
				class="">FAQ</span></a> </nav>
		</div>
		<main class="mdl-layout__content content">
		<div class="mdl-grid demo-content">
<div class="mdl-grid mdl-cell--12-col">
			<div class="mdl-cell mdl-cell--2-col ">

				<img src="${profile.image}" height="150" width="150">
			</div>
			<div class="mdl-cell mdl-cell--10-col ">
				<h1>${profile.userName}</h1>
				<h3>${profile.points}CP</h3>
			</div>
			</div>
			<div class=" mdl-cell--12-col">

				<h3>Achievements</h3>


				<p>After reaching a certain milestone, you can unlock
					achievements. For every achievement you unlock, you will receive
					bonus community points. You can see which achievements are still
					unlocked in your profile section. Some achievements are special and
					you can miss out on them, so pay attention!</p>

				<c:forEach items="${profile.achievements}" var="achievementgroup">
					<div class="mdl-grid mdl-cell mdl-cell--12-col">
						<div class="mdl-cell--12-col ">
							<h3>${achievementgroup.name}</h3>
						</div>


						<c:forEach items="${achievementgroup.achievements}" var="achievement">

							<div class="mdl-card something-else mdl-cell transparent"
								style="<c:if test="${achievement.completed == false}">opacity: 0.3;</c:if> margin:5px;width:19%;"
								id="${achievement.name}">

								<div class="mdl-card__title"
									style="height:150px;  background-image: url('${achievement.image}'), url(https://www.madana.io/assets/img/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:50px,cover ;">

								</div>

								<div class="mdl-card__supporting-text">
									<b>${achievement.name}</b>
										<div
								style="height: 5px;<c:if test="${achievement.completed == true}">background-color: green;</c:if><c:if test="${achievement.completed == false}">background-color: gray;</c:if> width:100%;">


							</div>
								</div>
								<!-- <div class="mdl-card__actions mdl-card--border mdl-grid ">
									${achievement.description}</div> -->
								<div class="mdl-card__menu" style="color: #f3f3f6;">
									${achievement.reward} CP</div>

							</div>
							<div class="mdl-tooltip mdl-tooltip--large"
								for="${achievement.name}">${achievement.description}</div>
						</c:forEach>


						
					

					</div>
				</c:forEach>

			</div>
	<h3>Action History</h3>
		

	
				<div class="mdl-cell mdl-cell--12-col"
					style="height: 600px; overflow-y: scroll;">
					<ul class="demo-list-three mdl-list">
						<c:forEach items="${history}" var="object">
							<li class="mdl-list__item mdl-list__item--three-line transparent"
								style="width: 100%"><span
								class="mdl-list__item-primary-content"><span> <a
										href="${object.link}">${object.text}</a></span> <span></span> <span
									class="mdl-list__item-text-body"><img
										src="${object.platformIcon}" height="50" width="50">${object.actionIcon}
										Received ${object.benefit} pts for ${object.action} on
										${object.platform} </span> </span> <span
								class="mdl-list__item-secondary-content">
									${object.created} </span></li>
							<hr>
						</c:forEach>
					</ul>
				</div>

		</div>
		</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	<loading-screen id="loading-screen" />
	<script type="text/javascript" src="https://intranet.madana.io/jira/s/3c7b8ba2b9b6923997fd484e6a6c6162-T/-jyncwb/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=0e0352a0"></script>

	
</body>
</html>
