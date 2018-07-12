<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script data-jsd-embedded data-key="8c642375-cfe7-4f3c-9c7c-9b8ea797da80" data-base-url="https://jsd-widget.atlassian.com" src="https://jsd-widget.atlassian.com/assets/embed.js"></script>

</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<header class="demo-header mdl-layout__header">
		<div class="mdl-layout__header-row">
			<span class="mdl-layout-title">Settings</span>
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
			        <nav class="demo-navigation mdl-navigation">
          <a class="mdl-navigation__link" href="home"><i class=" material-icons" role="presentation">home</i>Home</a>
          <a class="mdl-navigation__link" href="profile"><i class=" material-icons" role="presentation">person</i>Profile</a>
          <a class="mdl-navigation__link" href="bounty"><i class=" material-icons" role="presentation">share</i>Bounty</a>
          <a class="mdl-navigation__link" href="rather"><i class=" material-icons" role="presentation">poll</i>Rather</a>
          <a class="mdl-navigation__link" href="ranking"><i class=" material-icons" role="presentation">group</i>Ranking</a>
           <a class="mdl-navigation__link" href="settings"><i class=" material-icons" role="presentation">settings</i>Settings</a>
           <div class="mdl-layout-spacer"></div>
       
                     <div class="mdl-layout-spacer"></div>
          <a target="_blank" class="mdl-navigation__link" href="https://madana.atlassian.net/servicedesk/customer/portal/4"><i class=" material-icons" role="presentation">help_outline</i><span class="">Help</span></a>
        </nav>
		</div>
		<main class="mdl-layout__content content">
		<div class="mdl-grid demo-content">


			<div class="mdl-card something-else mdl-cell mdl-cell--12-col">
				<div class="mdl-card__title">
					<h2>
						Hello ${msg},
						</h3>
				</div>

				<div class="mdl-card__supporting-text">
					You have successfully logged in. Please have a look at the
					information we collected from you. Your email is private,
					everything else can be discovered by everyone. <br> <br>
					But there's currently nothing to look at right now, the only thing
					you can do is...
				</div>
				<div class="mdl-card__actions mdl-card--border">
					<a
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
						<form action="success" method="post">
<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Delete Account</button>
						</form>
					</a>
				</div>

			</div>

			<div class="mdl-card  mdl-cell mdl-cell--8-col">
				<div class="mdl-card__title">
					<h3>Private Details</h3>
				</div>
				<div class="mdl-card__supporting-text meta mdl-color-text--grey-600">
					<div class="minilogo"></div>
					<div>
						<table>

							<td width="50%;">
							<tr class="tddefault">
								<td width=20%;>Username:</td>
								<td align="left" width="10%"><c:out
										value="${user.userName}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Email:</td>
								<td width="10%"><c:out value="${user.mail}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Firstname:</td>
								<td width="10%"><c:out value="${user.firstName}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Lastname:</td>
								<td width="10%"><c:out value="${user.lastName}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Member since:</td>
								<td width="10%"><c:out value="${user.created}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Last login:</td>
								<td width="10%"><c:out value="${user.lastActive}" /></td>
							</tr>
							<tr>


							</tr>

							</td>

						</table>
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
					<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Change Email</button>
					<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Change Password</button>

				</div>
			</div>
			<div
				class="mdl-card something-else mdl-cell mdl-cell--8-col mdl-cell--4-col-desktop">
				<div class="mdl-card__title">
					<h3>Linked Accounts</h3>
				</div>
				<button
					class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--fab mdl-color--accent">
					<i class="material-icons mdl-color-text--white" role="presentation">add</i>
					<span class="visuallyhidden">add</span>
				</button>
				<div
					class="mdl-card__media mdl-color--white mdl-color-text--grey-600">

				</div>
				<div
					class="mdl-card__supporting-text meta meta--fill mdl-color-text--grey-600">
					<div></div>
					<ul class="demo-list-control mdl-list">
							<c:forEach var="socialuser" items="${user.socialAccounts}">
  							<li class="mdl-list__item mdl-list__item--three-line"><span
							class="mdl-list__item-primary-content">
							<img src="${socialuser.image}" alt="${socialuser.platform}" height="50" width="50" style="margin-bottom:-15px;">
							 <span>
									${socialuser.platform}</span> <span class="mdl-list__item-text-body" style="align:center;padding-left:50px;">             ${socialuser.ident}</span>
						</span> <span class="mdl-list__item-secondary-action"> <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
  <i class="material-icons">cancel</i>
</button>
						</span></li>
					</c:forEach>
					
						
					</ul>
				</div>
			</div>
			<div class="mdl-card  mdl-cell mdl-cell--12-col">
				<div class="mdl-card__title">
					<h3>Privacy Settings</h3>
				</div>
				<div class="mdl-card__supporting-text meta">
					<ul class="demo-list-control mdl-list">
						<li class="mdl-list__item mdl-list__item--three-line"><span
							class="mdl-list__item-primary-content"> <i
								class="material-icons mdl-list__item-avatar">history</i> <span>
									Show activity</span> <span class="mdl-list__item-text-body"> If
									you disable this setting nobody besides you will be able to see
									your activity in your profile </span>
						</span> <span class="mdl-list__item-secondary-action"> <label
								class="mdl-switch mdl-js-switch mdl-js-ripple-effect"
								for="list-switch-1"> <input type="checkbox"
									id="list-switch-1" class="mdl-switch__input" checked />
							</label>
						</span></li>
						<li class="mdl-list__item mdl-list__item--three-line"><span
							class="mdl-list__item-primary-content"> <i
								class="material-icons mdl-list__item-avatar">star</i> <span>Show
									achievments</span> <span class="mdl-list__item-text-body"> If
									you disable this setting nobody besides you will be able to see
									your achievments in your profile </span>
						</span> <span class="mdl-list__item-secondary-action"> <label
								class="mdl-switch mdl-js-switch mdl-js-ripple-effect"
								for="list-switch-1"> <input type="checkbox"
									id="list-switch-1" class="mdl-switch__input" checked />
							</label>
						</span></li>
					</ul>
				</div>
			</div>
		</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
