<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="demo-drawer mdl-layout__drawer mdnnav">
			<header class="demo-drawer-header"> <img
				src="${profile.image}" width="50" height="50"> <br>
			<span>${profile.points} CP</span>
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
					<li class="mdl-menu__item"><i class="material-icons">lock</i>Logout...</li>
				</ul>
			</div>
			</header>
			<nav class="demo-navigation mdl-navigation mdnnav"> <a
				class="mdl-navigation__link" href="/home"><i
				class=" material-icons" role="presentation">home</i>Home</a> <a
				class="mdl-navigation__link" href="/home"><i
				class=" material-icons" role="presentation">announcement</i>News</a> <a
				class="mdl-navigation__link" href="/profile"><i
				class=" material-icons" role="presentation">person</i>Profile</a> <a
				class="mdl-navigation__link" href="/ranking"><i
				class=" material-icons" role="presentation">group</i>Ranking</a> <a
				class="mdl-navigation__link" href="/settings"><i
				class=" material-icons" role="presentation">settings</i>Settings</a>
			<div class="mdl-layout-spacer"></div>


			<a class="mdl-navigation__link" href="/faq"><i
				class=" material-icons" role="presentation">help_outline</i><span
				class="">FAQ</span></a> <a href="#" id="feedback-button"
				class="mdl-navigation__link"><i class=" material-icons"
				role="presentation">bug_report</i><span class="">Report a Bug</span></a>
			<hr>
			<div style="margin-left: 30px;">
				<i><img src="http://www.madana.io/assets/img/logo-madana.png"
					alt="MADANA Logo" width="30" height="30" style="padding-top: 20px;"></i><span
					style="font-size: 12px; color: #4d7da2; padding-left: 20px;">
					Community Hub </span><span
					style="font-size: 12px; padding-left: 60px; color: #4d7da2;">0.1.12-164.260</span>
			</div>

			</nav>
		</div>