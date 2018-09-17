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
	  <noscript id="loading-config">
      { 
        "phrases": ["Guiding the bits in your direction", "Spinning the cube", "Moving the satellite into position"], 
        "options": { 
          "typeSpeed": 50, 
          "backSpeed": 50, 
          "backDelay": 1000, 
          "loop": true 
        }
      }
    </noscript>
      <script type="text/javascript" src="<%=request.getContextPath()%>/resources/loadingscreen.min.js"></script>
       <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"/></script>
    <script type="text/javascript" src="https://intranet.madana.io/jira/s/3c7b8ba2b9b6923997fd484e6a6c6162-T/-jyncwb/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=0e0352a0"></script>
 
  

    
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
			<header class="demo-drawer-header"> <img
				src="${profile.image}" width="75" height="75">
			<br>
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
		<div class="mdl-grid">

			<div class=" mdl-cell mdl-cell--12-col mdl-grid">
				<h1>Welcome to the Community Hub</h1>
				<p>The Community Hub will be the future home of our community.
					Here you will be able to get the newest information about the
					progress and development of MADANA, engage actively in community
					campaigns and express your opinion on relevant topics in a fun and
					ludic way. For every interaction with certain community hub
					features, you will receive community points (CP). These points
					indicate your engagement in the community hub and for MADANA. These
					points influence your ranking on which basis MADANA decides how big
					the reward from community campaigns for you will be. The higher
					your rank, the better the reward will be.
			</div>


			<div class="mdl-grid mdl-cell mdl-cell--8-col">
				<div class="mdl-grid mdl-cell mdl-cell--12-col"></div>
				<!--  
                <div class="mdl-grid mdl-cell mdl-cell--12-col"> 
                			<div class="mdl-cell--12-col">
					 <h2><i class="material-icons md-36">poll</i> Rather</h2>
					<p>Play our daily community quiz and see how you compare to other community members in various privacy situations and MADANA trivia. Collect community points by sharing them with your friends.</p>
					</div>
					  <div class="mdl-grid mdl-cell mdl-cell--12-col transparent"> 
					  		<div class="mdl-cell--12-col" style="text-align:center">
					<h3>Would you rather?</h3>
								</div>
        	     	<div
				class="mdl-card something-else mdl-cell mdl-cell--8-col mdl-cell--6-col-desktop " style="background-color:#4d7da2;color:#b2d1ef;">
		  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text">Update</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>

			</div>
			   <div class="mdl-layout-spacer"></div>
			     	<div
				class="mdl-card something-else mdl-cell mdl-cell--8-col mdl-cell--6-col-desktop" style="background-color:#b2d1ef;color:#4d7da2;">
		  <div class="mdl-card__title mdl-card--expand">
    <h2 class="mdl-card__title-text">Update</h2>
  </div>
  <div class="mdl-card__supporting-text">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Aenan convallis.
  </div>
</div>
			</div>
			</div>-->

				<div class="mdl-grid  mdl-cell mdl-cell--12-col ">
					<div class="mdl-cell--12-col">
						<h2>
							<i class="material-icons md-36">share</i> Share the vision
						</h2>
						<p>Link your social media account to the community hub and
							collect community points by following MADANA and sharing relevant
							posts. Check the integrated feed for possible opportunities</p>
					</div>
					<c:forEach items="${social_platforms}" var="platform">

						<div
							class="mdl-card something-else mdl-cell mdl-cell--6-col transparent">
							<div class="mdl-card__title"
								style="height:400px;  background-image: url('${platform.icon}'), url(https://www.madana.io/assets/img/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:150px,cover ;">

							</div>

							<div class="mdl-card__supporting-text">
								<br> <br> But there's currently nothing to look at
								right now, the only thing you can do is...
							</div>
							<div class="mdl-card__actions mdl-card--border mdl-grid "
								style="background: #f3f3f6;height:20%;">

								<c:forEach var="entry" items="${platform.oActions}">
									<span class="mdl-cell--3-col"> <i class="material-icons">${entry.key}</i>
										${entry.value} / ${fn:length(platform.feed)}

									</span>
								</c:forEach>

							<c:if test="${platform.isDisabled == true}">
								<button
									 type="button"
									class="mdl-button mdl-js-button "
									style="width: 100%;">
									<i class="material-icons">info</i> Currently Disabled
								</button>
  
  	</c:if>
  		<c:if test="${platform.isDisabled == false}">
								<c:choose>

								

								
							
									<c:when test="${platform.isVerifiedByUser == false}">

										<a
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect   mdl-cell--12-col"
											style="align: right"  onclick="document.forceLoading();" style="width: 100%;"
											href="auth/${fn:toLowerCase(platform.name)}">

											<form action="success" method="post">
												<button
													class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
													Verify ${platform.name} account</button>
											</form>
										</a>
									</c:when>

									<c:otherwise>
										<a
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect
								<c:choose>
  <c:when test="${empty platform.oActions}">
  mdl-cell--12-col
  </c:when>

  <c:otherwise>
  mdl-cell--6-col
  </c:otherwise>
</c:choose>
								
								
								 "
											style="align: right" onclick="document.forceLoading();" 
											href="bounty/${fn:toLowerCase(platform.name)}">

											<form action="success" method="post">
												<button
													class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
													<i class="material-icons">arrow_forward</i>
													${platform.name} bounty
												</button>
											</form>
										</a>
									</c:otherwise>
								
								</c:choose>
	  	</c:if>
							</div>
							<div class="mdl-card__menu">
								<a href="${platform.link}"><button
										class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect"
										style="align: center">
										<i class="material-icons">open_in_new</i>
									</button> ${platform.name}</a>
							</div>

						</div>


					</c:forEach>
				</div>
				<div class="mdl-grid  mdl-cell mdl-cell--12-col">
					<div class="mdl-cell--12-col">
						<h2>
							<i class="material-icons md-36">person_add</i> Invite some
							friends
						</h2>
						<p>Invite your friends with your referral links and introduce
							them to MADANA. For every new friend, you can boost your
							community points counter considerably.</p>
					</div>
					<c:forEach items="${referral_platforms}" var="platform">
						<div
							class="mdl-card something-else mdl-cell mdl-cell--4-col transparent">
							<div class="mdl-card__title"
								style="height:400px;  background-image: url('${platform.icon}'), url(https://www.madana.io/assets/img/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:150px,cover ;">


							</div>

							<div class="mdl-card__supporting-text">
								<br> <br> But there's currently nothing to look at
								right now, the only thing you can do is...
							</div>
							<div class="mdl-card__actions mdl-card--border mdl-grid "
								style="background: #f3f3f6;height:20%;">
								
														<c:if test="${platform.isDisabled == true}">
								<button
									 type="button"
									class="mdl-button mdl-js-button "
									style="width: 100%;">
									<i class="material-icons">info</i> Currently Disabled
								</button>
  
  	</c:if>
  		<c:if test="${platform.isDisabled == false}">
  		<span class="mdl-cell--3-col"> <i class="material-icons">person_add</i>
									${fn:length(platform.referrals)}
								</span> 
								<a
									class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-cell--8-col"
									style="align: right" onclick="document.forceLoading();" 
									href="bounty/${fn:toLowerCase(platform.name)}">
									<form action="success" method="post">
										<button
											class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" style="width: 100%;">
											<i class="material-icons">arrow_forward</i> ${platform.name}
											bounty
										</button>
									</form>
								</a>
								  	</c:if>
							</div>
							<div class="mdl-card__menu">
								<a href="${platform.link}" onclick="document.forceLoading();" ><button
										class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect"
										style="align: center">
										<i class="material-icons">open_in_new</i>
									</button> ${platform.name}</a>
							</div>

						</div>



					</c:forEach>
				</div>
			</div>
			<div class=" mdl-grid mdl-cell--4-col">
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
						<h3>
							<i class="material-icons">whatshot</i> Top Users
						</h3>
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->

						<div>
							<p>In the ranking section, you can see which ranking position
								you hold compared to other community members. The more community
								points you have the higher your rank will be. The ranking is the
								basis on which MADANA decides how big the reward from community
								campaigns will be for you. The higher your rank, the better the
								reward will be.</p>
							<br>
							<hr>
							<table>

								<tr class="tddefault">
									<td width=20%;><img src="${user1.image}" width="75"
										height="75"> <c:out value="${user1.userName}" /></td>
									<td align="left" width="10%"><c:out
											value="${user1.points}" /> CP</td>
											<td align="right" width="10%">   <a href="/profile/<c:out value="${user1.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">launch</i>
    </button></a></td>
								</tr>
								<tr class="tddefault">
									<td width=20%;><img src="${user2.image}" width="75"
										height="75"> <c:out value="${user2.userName}" /></td>
									<td width="10%"><c:out value="${user2.points}" /> CP</td>
																<td align="right" width="10%">   <a href="/profile/<c:out value="${user2.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">launch</i>
    </button></a></td>
						
								</tr>
								<tr class="tddefault">
									<td width=20%;><img src="${user3.image}" width="75"
										height="75"> <c:out value="${user3.userName}" /></td>
									<td width="10%"><c:out value="${user3.points}" /> CP</td>
																<td align="right" width="10%">   <a href="/profile/<c:out value="${user3.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">launch</i>
    </button></a></td>
						
								</tr>


							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<br> <a href="/ranking"><button id="show-dialog"
								type="button"
								class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
								style="width: 100%;">
								<i class="material-icons">people</i> See all users
							</button></a>

					</div>
				</div>
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
						<h3>
							<i class="material-icons">timeline</i> User Stats
						</h3>
					</div>
					<div
						class="mdl-card__supporting-text meta mdl-color-text--grey-600">
						<div>
							<table>


								<tr class="tddefault">
									<td width=20%;>Users:</td>
									<td align="left" width="10%"><c:out
											value="${system.usercount}" /></td>
								</tr>
								<tr class="tddefault">
									<td width=20%;>Currently active users:</td>
									<td width="10%"><c:out value="${system.activeusercount}" /></td>
								</tr>
								<tr class="tddefault">
									<td width=20%;>Points collected:</td>
									<td width="10%"><c:out value="${system.rankingPointsSum}" /></td>
								</tr>

								<tr>


								</tr>



							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border ">
						<img
							src="http://img.sc.chinaz.com/upload/2015/12/11//2015121109134858.jpg"
							width="90%" height="300" style="padding: 10px;">
					</div>
				</div>
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
						<h3>
							<i class="material-icons">build</i> System Stats
						</h3>
					</div>
					<div class="mdl-card__supporting-text meta">
						<div>
							<table>



								<tr class="tddefault">
									<td>Started:</td>
									<td width="70%"><c:out value="${system.startup}" /></td>
								</tr>
								<tr class="tddefault">
									<td>Last update:</td>
									<td width="70%"><c:out value="${system.useractionupdate}" /></td>
								</tr>
								<tr>


								</tr>

								</td>

							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<br>
						<div>
							<a href="/ranking"><button id="show-dialog" type="button"
									class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
									style="width: 100%;">
									<i class="material-icons">developer_board</i> See Update news
								</button></a>
						</div>
						<br>
						<div>

	
							<button
									id="feedback-button" type="button"
									class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"
									style="width: 100%;">
									<i class="material-icons">bug_report</i> Report a bug
								</button>


						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	  <loading-screen id="loading-screen" />
	
	
	  
  <!-- your footer scripts go here -->  
	
</body>
</html>
