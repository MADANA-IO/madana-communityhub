<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<% ResourceBundle resource = ResourceBundle.getBundle("de.madana.webclient.system");
  String version=resource.getString("version"); %>
<style>
.mdl-layout__drawer-button
{
padding-top:10px;
}

@media  (max-width: 600px) 
{

.demo-avatar-dropdown h3
{
font-size:6vw;
}


}
@media  (min-width: 600px)  and (max-width: 800px) 
{

.demo-avatar-dropdown h3
{
font-size:4.5vw;
}


}
@media  (min-width: 801px)  and (max-width: 1600px) 
{

.demo-avatar-dropdown h3
{
font-size:2.0vw;
}


}
@media (min-width: 1600px) 
{

.demo-avatar-dropdown h3
{
font-size:1.5vw;
}


}

</style>
	<header class="mdl-layout__header mdl-layout__header--transparent ">
		<div class="mdl-layout__header-row mdnheader">
			<!-- Title -->

			<span class="mdl-layout-title">
			 <img src="https://www.madana.io/assets/img/logo-madana.png"
					alt="MADANA Logo" width="30" height="30" style="margin-right: 10px;">Community Hub [ BETA ]
			</span>
			 <div class="mdl-layout-spacer"></div>
      <!-- Navigation -->
      <nav class="mdl-navigation">
        <a class="mdl-navigation__link mdl-cell--hide-phone "target="_blank" href="https://www.madana.io">Website</a>
        <a class="mdl-navigation__link mdl-cell--hide-phone " target="_blank" href="https://blog.madana.io">Blog</a>
        <a class="mdl-navigation__link mdl-cell--hide-phone " target="_blank" href="https://www.reddit.com/r/MADANA/">Forum</a>
        <a class="mdl-navigation__link mdl-cell--hide-phone " target="_blank"href="https://t.me/madanaofficial">Chat</a>
      </nav>

		</div>
		</header>
<div class="demo-drawer mdl-layout__drawer mdnnav">
			<header class="demo-drawer-header"> <a href="/profile"><img
				src="${profile.image}" width="75" height="75"> </a> 
			<a href="/profile"><span class="customfontlabel" style="padding-top:10px;padding-bottom:5px;">${profile.points} CP</span>
			<div class="demo-avatar-dropdown" style="width:100%;">
				<span><h3>${profile.userName}</h3></span></a> 

				<div class="mdl-layout-spacer"></div>
				<button id="accbtn"
					class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
					<i class="material-icons" role="presentation">arrow_drop_down</i> <span
						class="visuallyhidden">Accounts</span>
				</button>
				<ul	class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
					for="accbtn">
					<a href="/logout" onclick="document.reRenderLoading({ phrases: ['Logging you out'] });" ><li class="mdl-menu__item">
					<i class="material-icons">lock</i>Logout...</li>
				</a>
				</ul>
			</div>
			</header>
			<nav class="demo-navigation mdl-navigation mdnnav"> <a
				class="mdl-navigation__link" href="/home"><i
				class=" material-icons" role="presentation">home</i>Home</a> <a
				class="mdl-navigation__link" href="/news"><i
				class=" material-icons" role="presentation">info</i>News</a> <a
				class="mdl-navigation__link" href="/profile"><i
				class=" material-icons" role="presentation">person</i>Profile</a> <a
				class="mdl-navigation__link" href="/ranking"><i
				class=" material-icons" role="presentation">group</i>Ranking</a> <a
				class="mdl-navigation__link" href="/settings"><i
				class=" material-icons" role="presentation">settings</i>Settings</a>
			<div class="mdl-layout-spacer"></div>


			<a class="mdl-navigation__link" href="/faq"><i
				class=" material-icons" role="presentation">help_outline</i><span
				class="">FAQ</span></a> 
				<div class=" mobilehide" id="feedback-button">
				<a href="#" 
				class="mdl-navigation__link mdl-cell--hide-phone "><i class="material-icons"
				role="presentation">feedback</i><span>Give Feedback</span></a></div>
				<div class=" mobilehide" id="bug-button">
				<a href="#" 
				class="mobilehide mdl-navigation__link mdl-cell--hide-phone mobilehide"><i class=" material-icons"
				role="presentation">bug_report</i><span>Report a Bug</span></a></div>
			<hr>
			<div style="margin-left: 30px;">
				<i><img src="https://www.madana.io/assets/img/logo-madana.png"
					alt="MADANA Logo" width="30" height="30" style="padding-top: 20px;"></i><span
					style="font-size: 12px; color: #4d7da2; padding-left: 20px;">
					Community Hub </span><span
					style="font-size: 12px; padding-left: 60px; color: #4d7da2;">  <%=version %></span>
			</div>

			</nav>
		</div>