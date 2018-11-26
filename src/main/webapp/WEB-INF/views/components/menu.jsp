<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*" %> 
<%@ page import = "java.util.ResourceBundle" %>
<% ResourceBundle resource = ResourceBundle.getBundle("de.madana.webclient.system");
  String version=resource.getString("version"); %>
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
			<header class="demo-drawer-header"><div class="drawercontainer"> <a href="/profile"><img
				src="${profile.image}" width="75" height="75"> </a> </div>
				<div class="drawercontainer2">
			<a href="/profile"><span class="customfontlabel" style="padding-top:10px;padding-bottom:5px;">${profile.points} CP</span>
			</div><div class="demo-avatar-dropdown drawercontainer3" style="width:100%;">
				<span><h3  class="customfont">${profile.userName}</h3></span></a> 

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
			<div id="status" style="margin-left:10px;">   <a href="http://status.madana.io" target="_blank">
            <span class="color-dot"></span>
            <span class="color-description"></span>
          </a></div>
			<div style="margin-left: 30px;">
				<i><img src="https://www.madana.io/assets/img/logo-madana.png"
					alt="MADANA Logo" width="30" height="30" style="padding-top: 20px;"></i><span
					style="font-size: 12px; color: #4d7da2; padding-left: 20px;">
					Community Hub </span><span
					style="font-size: 12px; padding-left: 60px; color: #4d7da2;">  <%=version %></span>
			</div>

			</nav>
		</div>
		<style>
<style>
 #status {
    position: fixed;
    bottom: 0;
    right: 0;
  }
.color-dot {
  @include border-radius(99px);
  display:inline-block;
  width:10px;
  height:10px;
  margin-right:5px;

}
.maintenance
{
 background-color:#e74c3c;
}
.critical
{
 background-color:#e74c3c;
}
.major
{
 background-color:#e67e22;
}
.minor
{
 background-color:#f1c40f;
}
.none
{
 background-color:#2ecc71;
}
</style>

<script type="text/javascript"
	src=" https://cdn.statuspage.io/se-v2.js" /></script>
	   <!-- status information inserted here -->
      

 <script  type="text/javascript">
//notice the JS Library is imported already (click the gear next to JS)
//this script also assumes jQuery is already loaded on the page.

var sp = new StatusPage.page({ page: '41zg7lf9yvrd'});

sp.summary({
success: function(data) {
  // adds the text description to the dropdown
  $('.color-description').text(data.status.description);
  // appends the status indicator as a class name so we can use the right color for the status light thing
  $('.color-dot').addClass(data.status.indicator);
}
});
</script>
		