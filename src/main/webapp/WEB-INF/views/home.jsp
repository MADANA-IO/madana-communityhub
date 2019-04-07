<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />

<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<main class="mdl-layout__content content">
		<div class="mdl-grid">

			<div class=" mdl-cell mdl-cell--12-col mdl-grid">
				<h2>Welcome !</h2>
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
				<div class="mdl-grid  mdl-cell mdl-cell--12-col ">
					<div class="mdl-cell--12-col">
						<h3>
							<i class="material-icons material-heading">share</i> Share the vision
						</h3>
				
						<p>Link your social media account to the community hub and
							collect community points by following MADANA and sharing relevant
							posts. Check the integrated feed for possible opportunities</p>
					</div>
					<c:forEach items="${social_platforms}" var="platform">

						<div
							class="mdl-card something-else mdl-cell mdl-cell--6-col mdl-cell--12-col-phone  transparent "
							style="height: 350px">
							<div class="mdl-card__title "
								style="height:300px;  background-image: url('${platform.icon}'), url(https://www.madana.io/assets/img/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:75px 75px,cover ;">
								<div
									style="text-align: center; align: center; left: 50%; transform: translate(-50%, 0); bottom: 125px; z-index: 999999; position: absolute; color: #b2d1ef;">
									<c:forEach var="entry" items="${platform.oActions}">
										<span class="mdl-cell--3-col"> <i
											class="material-icons"> ${entry.key} </i><span style="padding:5px;"> ${entry.value} </span>
											

										</span>
									</c:forEach>
								</div>
							</div>

							<div class="mdl-card__actions mdl-card--border mdl-grid "
								style="background: #f3f3f6; height: 75px;">


								<c:if test="${platform.isDisabled == true}">
									<button type="button" class="mdl-button mdl-js-button mdl-button--disabled"
										style="width: 100%;">
										<i class="material-icons">info</i> Currently Disabled
									</button>

								</c:if>
								<c:if test="${platform.isDisabled == false}">
									<c:choose>





										<c:when test="${platform.isVerifiedByUser == false}">

											<a
												
												style="align: right;width: 100%; " onclick="document.forceLoading();" 
												
												
													
															
												href="auth/${fn:toLowerCase(platform.name)}">

											
													<button
														class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
														Verify ${platform.name} account</button>
											
											</a>
										
										</c:when>

										<c:otherwise>
											<a
												class="
								<c:choose>
  <c:when test="${empty platform.oActions}">
  mdl-cell--12-col
  </c:when>

  <c:otherwise>
  mdl-cell--6-col
  </c:otherwise>
</c:choose>
								
								
								 "
												style="align: right; width: 100%;"
												onclick="document.forceLoading();"
												href="/bounty/${fn:toLowerCase(platform.name)}">

											
													<button
														class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
														style="width: 100%;">
														<i class="material-icons">forward</i>
														${platform.name} bounty
													</button>
											
											</a>
										</c:otherwise>

									</c:choose>
								</c:if>
							</div>
							<div class="mdl-card__menu">
								<c:choose>
									<c:when test="${platform.isVerifiedByUser == false}">
										<c:if test="${platform.name == 'Twitter'}">
										
												<button type="button" id="twitterinfo" class="mdl-button mdl-js-button " style="color:#a0c3e8;"
													>
													<i class="material-icons">info</i>
													
												</button>
													<div class="mdl-tooltip mdl-tooltip--large" for="twitterinfo" style="width:150px;">
						You can also verify your account by sending a private message starting with "CH:" directly followed by your CommunityHub Username to the official MADANA Twitter Account.
</div>
						
											</c:if>
											</c:when>
											</c:choose>
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

							<h3>
							<i class="material-icons material-heading">person_add</i> Invite some
							friends
						</h3>
						<p>Invite your friends with your referral links and introduce
							them to MADANA. For every new friend, you can boost your
							community points counter considerably.</p>
					</div>
					<c:forEach items="${referral_platforms}" var="platform">
						<div
							class="mdl-card something-else mdl-cell mdl-cell--4-col transparent"
							style="height: 350px">
							<div class="mdl-card__title"
								style="height:300px;  background-image: url('${platform.icon}'), url(https://www.madana.io/assets/img/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:75px 75px,cover ;">
								<div
									style="text-align: center; align: center; left: 50%; transform: translate(-50%, 0); bottom: 125px; z-index: 999999; position: absolute; color: #b2d1ef;">
									<span class="mdl-cell--3-col"> <i class="material-icons">person_add</i>
									<!-- 	<span style="padding:5px;">${fn:length(platform.referrals)}</span> -->
									</span>
								</div>
							</div>

							<div class="mdl-card__actions mdl-card--border mdl-grid "
								style="background: #f3f3f6; height: 75px;">

								<c:if test="${platform.isDisabled == true}">
									<button type="button" class="mdl-button mdl-js-button mdl-button--disabled"
										style="width: 100%;">
										<i class="material-icons">info</i> Currently Disabled
									</button>

								</c:if>
								<c:if test="${platform.isDisabled == false}">

									<a
									
										style="width: 100%" onclick="document.forceLoading();"
										href="/bounty/${fn:toLowerCase(platform.name)}">
										
											<button
												class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
												style="width: 100%;">
												<i class="material-icons">forward</i> ${platform.name}
												bounty
											</button>
										
									</a>
								</c:if>
							</div>
							<div class="mdl-card__menu">
								<a href="${platform.link}" onclick="document.forceLoading();"><button
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
					<div class="mdl-card__title ">
							<h4>
							<i class="material-icons">whatshot</i> Top Users
						</h4>
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
									<td class="subheading"><img src="${user1.image}" width="75"
										height="75" class="circle "><a
										href="/profile/<c:out value="${user1.userName}" />">
											
									 <button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle" >
												<i class="material-icons" >face</i>
											</button> </a> <c:out value="${user1.userName}" /><c:if test="${user1.activated eq 'true'}">
									<i class="material-icons">check_circle</i>
											</c:if></td>
									<td style="text-align:right;"><c:out
											value="${user1.points}" /> CP</td>
								
								</tr>
								<tr class="tddefault">
									<td  class="subheading"><img src="${user2.image}" width="75"
										height="75" class="circle"> <a
										href="/profile/<c:out value="${user2.userName}" />">
											
									 <button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle" >
												<i class="material-icons" >face</i>
											</button> </a><c:out value="${user2.userName}" /><c:if test="${user2.activated eq 'true'}">
									<i class="material-icons">check_circle</i>
											</c:if></td>
									<td style="text-align:right;"><c:out value="${user2.points}" /> CP</td>
							

								</tr>
								<tr class="tddefault">
									<td class="subheading"><img src="${user3.image}" width="75"
										height="75" class="circle"><a
										href="/profile/<c:out value="${user3.userName}" />">
											
									 <button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle" >
												<i class="material-icons" >face</i>
											</button> </a><c:out value="${user3.userName}" /><c:if test="${user3.activated eq 'true'}">
									<i class="material-icons">check_circle</i>
											</c:if></td>
									<td style="text-align:right;"><c:out value="${user3.points}" /> CP</td>
								

								</tr>


							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<br> <a href="/ranking"><button id="show-dialog"
								type="button"
								class="mdl-button mdl-js-button  mdl-js-ripple-effect"
								style="width: 100%;">
								<i class="material-icons ">people</i> See all users
							</button></a>

					</div>
				</div>
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
							<h4>
							<i class="material-icons">timeline</i> User Stats
						</h4>
					</div>
					<div
						class="mdl-card__supporting-text meta mdl-color-text--grey-600">
						<div>
							<table>


								<tr class="tddefault">
									<td width=75px;>Users:</td>
									<td align="left" width="10%"><c:out
											value="${system.usercount}" /></td>
								</tr>
								<tr class="tddefault">
									<td width=75px;>Currently active users:</td>
									<td width="10%"><c:out value="${system.activeusercount}" /></td>
								</tr>
								<tr class="tddefault">
									<td width=75px;>Points collected:</td>
									<td width="10%"><c:out value="${system.rankingPointsSum}" /></td>
								</tr>

								<tr>


								</tr>



							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border ">
				
					</div>
				</div>
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
						<h4>
							<i class="material-icons">build</i> System Stats
						</h4>
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
							<a href="https://blog.madana.io/tagged/dev-notes" target="_blank"><button  type="button"
									class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
									style="width: 100%;">
									<i class="material-icons">developer_board</i> See Update news
								</button></a>
						</div>
						<br>
						<div>


							<button id="mainbug-button" type="button"
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
								style="width: 100%;">
								<i class="material-icons">bug_report</i> Report a bug
							</button>


						</div>
					</div>
				</div>
			</div>


			<jsp:include page="components/snackbar.jsp" />
		</div>
		</main>
	</div>
	<jsp:include page="components/footer.jsp" />



</body>

</html>
