<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*"%>


<header class="mdl-layout__header mdl-layout__header--transparent ">
	<style>


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
			<div class="mobilehide" style="padding-left: 25px;"></div>
			<a href="/home"><span style="color: #a0c3e8; font-size: 22px;"><i><img
						src="https://cdn.madana.io/commonvisuals/logos/logo-madana.png"
						alt="MADANA Logo" width="30" height="30"></i> Community Hub</span> </a>
		
		</div>



		<nav class="mdl-navigation ">
			<c:if test="${not empty MEDIUM_FEEDURL}">
				<span class="mobilehide"> <a
					class="${currentsite eq 'news' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
					href="/news" onclick="document.forceLoading();"><i
						class=" material-icons" role="presentation">message</i> News</a>
				</span>
			</c:if>
			<span class="mobilehide"> <a
				class="${currentsite eq 'bounty' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
				href="/bounty" onclick="document.forceLoading();"><i
					class=" material-icons" role="presentation">local_atm</i> Bounty</a>
			</span> <span class="mobilehide"> <a
				class="${currentsite eq 'organizations' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
				href="#" onclick="document.forceLoading();" style="color: darkgrey;"><i
					class=" material-icons" role="presentation" disabled>business</i>
					Organizations</a>

			</span>
 <span class="mobilehide"> <a
				class="${currentsite eq 'stakeholders' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
				href="#" onclick="document.forceLoading();" style="color: darkgrey;"><i
					class=" material-icons" role="presentation">people</i> Stakeholders</a>
			</span>
			<div class="mdl-layout-spacer"></div>

			<div style="position: absolute;right:5px; width:300px;top:10px;" class="mobilehide">
				<span
					style="float:left;margin-top:-10px;"><a class="mdl-navigation__link" href="/faq"><i
					class=" material-icons" role="presentation">help_outline</i> FAQ</a> </span>
					
					<c:choose>
				<c:when test="${empty profile.userName}">
					<div >
						<span style="float:left;margin-top:-10px;"><a href="/start" class="mdl-navigation__link "> <i
							class=" material-icons " style="padding-right: 10px;"
							role="presentation">account_circle</i><span class="mobilehide">Sign in</span>

						</a>
						</span>
					</div>
				</c:when>
				<c:otherwise>
					<div  >

						<span id="accbtn"> <img src="${profile.image}" width="35"
							height="35" class="circle"> <span class="mobilehide"><strong>${profile.userName}</strong></span>
							<i class=" material-icons " style="position: relative; top: 5px;"
							role="presentation">arrow_drop_down</i>
						</span>
					</div>



					<ul
						class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect"
						for="accbtn">
						<li class="mdl-menu__item"><a
							href="/profile/${profile.userName}" style="text-decoration: none">
								<img
								src="https://cdn.madana.io/commonvisuals/icons/material-icons_3-0-1_account-circle_32_0_274863_none.png"
								width="18" height="18"><span style="margin-left: 25px;">Community
									Profile</span>
						</a></li>

						<li class="mdl-menu__item"><a href="/settings"
							style="text-decoration: none"> <img
								src="https://cdn.madana.io/commonvisuals/icons/material-icons_3-0-1_settings_32_0_274863_none.png"
								width="18" height="18"><span style="margin-left: 25px;">Account
									Settings</span></a></li>

						<li class="mdl-menu__item"><a href="/logout"
							style="text-decoration: none"> <img
								src="https://cdn.madana.io/commonvisuals/icons/material-icons_3-0-1_lock_32_0_274863_none.png"
								width="18" height="18"><span style="margin-left: 25px;">Logout</span></a></li>

						<li>
							<hr>
						<li>
						<li id="feedback-button" class="mdl-menu__item"><a
							href="/logout" style="text-decoration: none"> <img
								src="https://cdn.madana.io/commonvisuals/icons/material-icons_3-0-1_feedback_32_0_274863_none.png"
								width="18" height="18"><span
								style="margin-left: 25px; color: #a0c3e8;">Give feedback</span></a></li>

						<li id="bug-button" class="mdl-menu__item"><img
							src="https://cdn.madana.io/commonvisuals/icons/material-icons_3-0-1_bug-report_32_0_274863_none.png"
							width="18" height="18"><span
							style="margin-left: 25px; color: #a0c3e8;">Report a bug</span></li>


					</ul>
				</c:otherwise>
			</c:choose>
			</div>
			
		</nav>
		<!-- Navigation -->
		</div>
</header>
<div class="demo-drawer mdl-layout__drawer mdnnav">
	<header class="demo-drawer-header">
		<div>
			<span style="font-size: 24px; color: #a0c3e8;"><i><img
					src="https://cdn.madana.io/commonvisuals/logos/logo-madana.png"
					alt="MADANA Logo" width="50" height="50"></i><span
				style="padding-left: 25px; font-size: 14px;">Community Hub <span
					style="font-size: 12px; color: #d6e2ec;
	/* padding-left: 75px; */ top: 70px; position: absolute; left: 92px;">Version ${applicationScope['VERSION']}
					
				</span></span> </span>
		</div>

	</header>
	<nav class="demo-navigation mdl-navigation mdnnav">

		<a
			class="${currentsite eq 'home' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/home"><i class=" material-icons" role="presentation">home</i>Home</a>


		<c:if test="${not empty MEDIUM_FEEDURL}">
			<a
				class="${currentsite eq 'news' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
				href="/news"><i class=" material-icons" role="presentation">message</i>News</a>
		</c:if>
			<a
				class="${currentsite eq 'profile' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
				href="/profile"><i class=" material-icons" role="presentation">account_circle</i>Profile</a>
		<a
			class="${currentsite eq 'bounty' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/bounty"><i class=" material-icons" role="presentation">local_atm</i>
			Bounty</a> <a
			class="${currentsite eq 'ranking' ?  'mdl-navigation__link activelink': 'mdl-navigation__link'}"
			href="/ranking"><i class=" material-icons" role="presentation">people</i>Ranking</a>



		<div class="mdl-layout-spacer"></div>
		<hr style="margin: 25px;">

		<p style="text-align: center">More from MADANA</p>

		<a class="mdl-navigation__link" target="_blank"
			href="https://www.madana.io"><i class=" material-icons "
			role="presentation">http</i><span>Website</span></a> <a
			class="mdl-navigation__link" target="_blank"
			href="https://blog.madana.io"><img
			src="https://cdn.madana.io/commonvisuals/logos/logo-footer-medium@3x.png"
			width="25" height="25" style="margin-left: -0px;"><span
			style="padding-left: 35px;">Blog</span></a> <a
			class="mdl-navigation__link" target="_blank"
			href="https://www.reddit.com/r/MADANA/"> <img
			src="https://cdn.madana.io/commonvisuals/logos/logo-footer-reddit@3x.png"
			width="25" height="25" style="margin-left: -0px;"><span
			style="padding-left: 35px;">Reddit</span></a> <a
			class="mdl-navigation__link" target="_blank"
			href="https://t.me/madanaofficial"><img
			src="https://cdn.madana.io/commonvisuals/logos/logo-footer-telegram@3x.png"
			width="25" height="25" style="margin-left: -0px;"><span
			style="padding-left: 35px;">Telegram</span></a>

		<div class="mdl-layout-spacer"></div>
		<c:if test="${not empty STATUSPAGE_PAGEID}">
			<div id="status" class="mdl-navigation__link"
				style="font-size: 10px; position: relative">
				<a href="${applicationScope['STATUSPAGE_PAGELINK']}" target="_blank">
					<span class="color-dot"></span> <span class="color-description"></span>
				</a>
			</div>
		</c:if>

	</nav>
</div>





