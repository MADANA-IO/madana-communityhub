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
 <link href=' http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
  <link href=' http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
  <header class="mdl-layout__header mdl-layout__header--transparent ">
    <div class="mdl-layout__header-row mdnheader" >
      <!-- Title -->
      
      <span class="mdl-layout-title"> <img src="http://www.madana.io/images/logo.png"
					alt="MADANA Logo"
					width="50" height="50" > Community Hub</span>
    
    </div>
  </header>
		<div class="demo-drawer mdl-layout__drawer mdnnav">
		<header class="demo-drawer-header"> <img
				src="${profile.image}"
				style="width:100px; height:100px;"><br><span>${profile.points} CP</span>
			<div class="demo-avatar-dropdown">
				<span><h3>${profile.userName}</h3></span>
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
			<script data-jsd-embedded
				data-key="8c642375-cfe7-4f3c-9c7c-9b8ea797da80"
				data-base-url="https://jsd-widget.atlassian.com"
				src="https://jsd-widget.atlassian.com/assets/embed.js"></script> </header>
			<nav class="demo-navigation mdl-navigation mdnnav"> <a
				class="mdl-navigation__link" href="home"><i
				class=" material-icons" role="presentation">home</i>Home</a> <a
				class="mdl-navigation__link" href="profile"><i
				class=" material-icons" role="presentation">person</i>Profile</a> <a
				class="mdl-navigation__link" href=ranking><i
				class=" material-icons" role="presentation">group</i>Ranking</a> <a
				class="mdl-navigation__link" href="settings"><i
				class=" material-icons" role="presentation">settings</i>Settings</a>
			<div class="mdl-layout-spacer"></div>

			<div class="mdl-layout-spacer"></div>
			<a target="_blank" class="mdl-navigation__link"
				href="https://madana.atlassian.net/servicedesk/customer/portal/4"><i
				class=" material-icons" role="presentation">help_outline</i><span
				class="">Help</span></a> </nav>
		</div>
		<main class="mdl-layout__content content">
		<div class="mdl-grid demo-content">

			<div
				class="mdl-card mdl-cell mdl-cell--12-col transparent">
				<div class="mdl-card__title">
					<h1><img src="${profile.image}">${profile.userName}</h1>
				
				</div>
					<div class="mdl-card__supporting-text meta">
						<h3>${profile.points} CP</h3>
					</div>
				


			</div>
			<div
				class="mdl-card  mdl-cell mdl-cell--12-col transparent">
<div class="mdl-card__title">
				  <h3>Achievements</h3>
         
				</div>
   <p>After reaching a certain milestone, you can unlock achievements. For every achievement you unlock, you will receive bonus community points. You can see which achievements are still unlocked in your profile section. Some achievements are special and you can miss out on them, so pay attention!</p>
       
					<img style="width:100%;"
						src="		https://c-6rtwjumjzx7877x24i6z0u8q9bufd8px2ehqtzikwtsyx2esjy.g00.gamepedia.com/g00/3_c-6twhx78rzx78yinjzshmfnsji.lfrjujinf.htr_/c-6RTWJUMJZX77x24myyux78x3ax2fx2fi6z0u8q9bufd8p.hqtzikwtsy.sjyx2ftwhx78rzx78yinj_lfrjujinfx2fymzrgx2f9x2f9gx2fFhmnjajrjsyx78-mjfijw.uslx2f6547uc-Fhmnjajrjsyx78-mjfijw.uslx3fajwx78ntsx3dk627g63j4ii8ig19ifg3kk9i4j17h042x26n65h.rfwpx3dnrflj_$/$/$/$/$/$/$
">
				

			</div>
			<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
				<div class="mdl-card__title">
					<h3>Actions</h3>
				</div>
				<div class="mdl-card__supporting-text meta">
					<ul class="demo-list-three mdl-list">
						<c:forEach items="${profile.history}" var="object">
							<li class="mdl-list__item mdl-list__item--three-line"
								style="width: 100%"><span
								class="mdl-list__item-primary-content"> <i
									class="material-icons mdl-list__item-avatar">share</i> <span>Received
										${object.benefit} pts for ${object.action} on
										${object.platform} (${object.created}) </span> <span
									class="mdl-list__item-text-body"><a
										href="${object.link}">${object.text}</a> </span>
							</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
