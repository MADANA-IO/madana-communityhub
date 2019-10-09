<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="java.util.ResourceBundle"%>
<% ResourceBundle resource = ResourceBundle.getBundle("com.madana.webclient.system");
  String version=resource.getString("version"); %>
<header class="mdl-layout__header mdl-layout__header--transparent ">
	<style>
.activelink {
	background-color: rgba(0, 0, 0, 0.2);
}

.mdh-expandable-search {
	margin: 0 50px;
	align-items: center;
	justify-content: center;
}

.mdh-expandable-search form {
	max-width: 600px;
	width: 100%;
}

.mdh-expandable-search, .mdh-expandable-search form,
	.mdh-expandable-search input {
	/* Cross browser flex-grow */
	-webkit-box-flex: 1;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
}

.mdh-expandable-search, .mdh-expandable-search form {
	/* Cross browser inline-flex */
	display: -webkit-inline-box;
	display: -webkit-inline-flex;
	display: -moz-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
}

/* Position search icon */
.mdh-expandable-search .material-icons {
	position: relative;
	right: -40px;
	margin-left: -24px;
	/* Remove the blank space left behind by the icon being relatively positioned */
}

.mdh-expandable-search input {
	outline: none;
	border: none;
	font-size: 16px;
	color: #FFFFFF;
	background-color: #274863;
	padding: 0px 35px 0px 70px;
	height: 40px;
	line-height: 40px;
	/* TODO: This was recommended for cross browser compatability of input height, check if its actually needed in modern browsers */
	border-radius: 5px 5px 5px 5px;
	-moz-border-radius: 5px 5px 5px 5px;
	-webkit-border-radius: 5px 5px 5px 5px;
}

.mdh-expandable-search input::-webkit-input-placeholder {
	/* WebKit browsers */
	color: #FFFFFF;
}

.mdh-expandable-search input:-moz-placeholder {
	/* Mozilla Firefox 4 to 18 */
	color: #FFFFFF;
	opacity: 1;
	/* Firefox gives the placeholder a reduced opacity so we have to increase it */
}

.mdh-expandable-search input::-moz-placeholder {
	/* Mozilla Firefox 19+ */
	color: #FFFFFF;
	opacity: 1;
	/* Firefox gives the placeholder a reduced opacity so we have to increase it */
}

.mdh-expandable-search input:-ms-input-placeholder {
	/* Internet Explorer 10+ */
	color: #FFFFFF;
}

/* Bug fix: https://github.com/google/material-design-lite/issues/1078
 * To much padding on the left of header when the menu button is hidden */
@media screen and (min-width: 851px) {
	.mdl-layout__header-row {
		padding: 0 40px 0 40px;
	}
}

/* Bug fix for badges being in the wrong location */
.mdl-badge[data-badge]:after {
	right: -7px;
	top: -8px;
}
</style>
	<div class="mdl-layout__header-row mdnheader">
		<!-- Title -->

		<div class="mdl-layout-title">
				<a href="/home"><span style="color:#a0c3e8;
     font-size:22px; padding-left: 25px;"><i><img
						src="https://www.madana.io/assets/img/logo-madana.png"
						alt="MADANA Logo" width="30" height="30" ></i> Community Hub</span>
</a>
		</div>

		<div class="mdl-layout-spacer"></div>

		<!-- Navigation -->
		<nav class="mdl-navigation">
		<!-- 
			<a href="/request/create"
			onclick="document.forceLoading();" 
				class="mdl-navigation__link mdl-cell--hide-phone subheading"> <i
				class=" material-icons " style="padding-right: 10px;"
				role="presentation">create</i>Create request

			</a> 
 -->

			<div class="mdl-layout-spacer"></div>

			<img id="accbtn" src="${profile.image}" width="35" height="35"
				class="circle">


			<ul
				class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
				for="accbtn">
				<li style="width:200px;    padding: 10px 16px;
    font-weight: 600;"><img src="${profile.image}"
					width="40" height="40" class="circle " style="margin-left: -0px;">${profile.userName}</li>
					<hr>

		<a target="_blank" href="https://communityhub.madana.io/profile/${profile.userName}"
				><li
					class="mdl-menu__item"><i class="material-icons">account_circle</i><span style="margin-left:25px;">Profile</span></li>
				</a>
					<a target="_blank" href="https://communityhub.madana.io/settings"
					><li
					class="mdl-menu__item"><i class="material-icons">settings</i><span style="margin-left:25px;">Settings</span></li>
				</a>
				<a href="/logout"
					onclick="document.reRenderLoading({ phrases: ['Logging you out'] });"><li
					class="mdl-menu__item"><i class="material-icons">lock</i><span style="margin-left:25px;">Logout</span></li>
				</a>
				<hr class="mobilehide">

				<a id="feedback-button" href="#"><li
					class="mdl-menu__item"><i class=" material-icons"
						>feedback</i><span style="margin-left:25px;">Give
							feedback</span></li> </a>
				<a id="bug-button" href="#"><li
					class="mdl-menu__item"><i class=" material-icons"
						>bug_report</i><span style="margin-left:25px;">Report
							a bug</span></li> </a>
		
			</ul>

		</nav>

	</div>
</header>
<div class="demo-drawer mdl-layout__drawer mdnnav">
	<header class="demo-drawer-header">
		<div>
			<span style="font-size: 24px;color:#a0c3e8;"><i><img
						src="https://www.madana.io/assets/img/logo-madana.png"
						alt="MADANA Logo" width="50" height="50"></i><span style="padding-left:25px;font-size: 14px;">Community Hub	<span
					style="font-size: 10px;
    color: #274863;
    /* padding-left: 75px; */
    top: 70px;
    position: absolute;
    left: 92px;">Beta  <%=version %> </span></span>
					</span>
		</div>

	</header>
	<nav class="demo-navigation mdl-navigation mdnnav">

		<a
			class="${currentsite eq 'home' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/home"><i class=" material-icons" role="presentation">home</i>Home</a>
	

		
		<a
			class="${currentsite eq '/news' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/news"><i class=" material-icons" role="presentation">message</i>News</a>
		<a
			class="${currentsite eq '/profile' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/profile"><i class=" material-icons" role="presentation">person</i>Profile</a>
	

		<a
			class="${currentsite eq '/ranking' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/ranking"><i class=" material-icons" role="presentation">people</i>Ranking</a>




			
			<div class="mdl-layout-spacer"></div>
			
				<hr style="margin:25px;">
					<p style="text-align:center">More from MADANA </p>
				
		<a class="mdl-navigation__link" target="_blank" href="https://www.madana.io"><i class=" material-icons "
				 role="presentation">http</i><span>Website</span></a>
	
				 <a
			class="mdl-navigation__link" target="_blank" href="https://blog.madana.io"><img
				src="https://cdn-images-1.medium.com/max/1600/1*emiGsBgJu2KHWyjluhKXQw.png"
				width="25" height="25" class="circle " style="margin-left: -0px;"><span style="padding-left:20px;">Blog</span></a>
		<a class="mdl-navigation__link" target="_blank" href="https://www.reddit.com/r/MADANA/">
			<img
				src="https://www.redditstatic.com/new-icon.png" width="25"
				height="25" class="circle " style="margin-left: -0px;"><span style="padding-left:20px;">Reddit</span></a>
		<a class="mdl-navigation__link" target="_blank" href="https://t.me/madanaofficial"><img
				src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Telegram_logo.svg/240px-Telegram_logo.svg.png"
				width="25" height="25" class="circle " style="margin-left: -0px;"><span style="padding-left:20px;">Telegram</span></a>


		


		<a class="mdl-navigation__link" href="/faq"><i
			class=" material-icons" role="presentation">help_outline</i><span
			class="">FAQ</span></a>

	<div class="mdl-layout-spacer"></div>
		<div id="status" class="mdl-navigation__link" style="font-size:10px;    position: relative">
			<a href="http://status.madana.io" target="_blank"> <span
				class="color-dot"></span> <span class="color-description"></span>
			</a>
		</div>
	

	</nav>
</div>
<style>
<
style>#status {
	
}

.color-dot { @include border-radius(99px);
	display: inline-block;
	width: 10px;
	height: 10px;
	margin-right: 5px;
}

.maintenance {
	background-color: #e74c3c;
}

.critical {
	background-color: #e74c3c;
}

.major {
	background-color: #e67e22;
}

.minor {
	background-color: #f1c40f;
}

.none {
	background-color: #2ecc71;
}
</style>

<script type="text/javascript" src=" https://cdn.statuspage.io/se-v2.js" /></script>
<!-- status information inserted here -->


<script type="text/javascript">
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


<script type="text/javascript" src=" https://cdn.statuspage.io/se-v2.js" /></script>
<!-- status information inserted here -->



