<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />
<style>
.mdl-card {
	background-color: transparent;
}
</style>

<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<main class="mdl-layout__content content">
		<div class="mdl-grid">

			<div class=" mdl-cell mdl-cell--12-col mdl-grid" style="background:rgba(0,0,0,0.3)">
				<h2 style="background-color: #4d7da2; height: 50px; width: 100%;">Bounty</h2>
			<p>With the release of our Community Hub Beta, we open our special bounty campaign and our MADANA PAX (MDN) Token Sale commission to our community.<br> We want our community to be rewarded for being so supportive and dedicated. Therefore, we came up with something extraordinary, fun and easy to understand.
MADANA is offering a total of around € 500,000 Euro worth of our MADANA PAX (MDN) in this campaign and it lasts until the end of the Main Sale. Everyone can join, as you simply need to enter the Community Hub and collect points!

<br><br>
<a href="https://blog.madana.io/500-000-community-bounty-campaign-e9bf04a1122" target="_blank">Read the official blog post</a>
</p>
			</div>

			<div class="mdl-grid mdl-cell mdl-cell--12-col">
					<div class="mdl-cell mdl-cell--12-col " ">
					<div class="">
						<h3
							>
							<i class="material-icons">whatshot</i> Top Users
						</h3>
						<hr>
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->

						<div>

							<table style="width: 100%;" >

								<tr class="tddefault"
									style="background-image: linear-gradient(to right, #D9A441, rgba(255, 255, 255, 0.1));">
									<td class="" style="color: white;"><img
										src="${user1.image}" width="60" height="60" class="circle "><a
										href="/profile/<c:out value="${user1.userName}" />">

											<button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle">
												<i class="material-icons">person</i>
											</button>
									</a> <c:out value="${user1.userName}" /> <c:if
											test="${user1.activated eq 'true'}">
											<i class="material-icons">verified_user</i>
										</c:if> <span
										style="display: block; font-size: 14px; position: relative; left: 120px; bottom: 20px; color: #274863;"><c:out
												value="${user1.points}" /> CP</span></td>


								</tr>
								<tr class="tddefault"
									style="background-image: linear-gradient(to right, #CCC2C2 50%, rgba(255, 255, 255, 0.1));">
									<td style="color: white;"><img src="${user2.image}"
										width="60" height="60" class="circle"> <a
										href="/profile/<c:out value="${user2.userName}" />">

											<button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle">
												<i class="material-icons">person</i>
											</button>
									</a> <c:out value="${user2.userName}" /> <c:if
											test="${user2.activated eq 'true'}">
											<i class="material-icons">verified_user</i>
										</c:if> <span
										style="display: block; font-size: 14px; position: relative; left: 120px; bottom: 20px; color: #274863;"><c:out
												value="${user2.points}" /> CP</span></td>



								</tr>
								<tr class="tddefault"
									style="background-image: linear-gradient(to right, #965A38 50%, rgba(255, 255, 255, 0.1));">
									<td style="color: white;"><img src="${user3.image}"
										width="60" height="60" class="circle"><a
										href="/profile/<c:out value="${user3.userName}" />">

											<button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle">
												<i class="material-icons">person</i>
											</button>
									</a> <c:out value="${user3.userName}" /> <c:if
											test="${user3.activated eq 'true'}">
											<i class="material-icons">verified_user</i>
										</c:if> <span
										style="display: block; font-size: 14px; position: relative; left: 120px; bottom: 20px; color: #274863;"><c:out
												value="${user3.points}" /> CP</span></td>



								</tr>


							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<br> <a href="/ranking"><button id="show-dialog"
								type="button"
								class="mdl-button mdl-js-button  mdl-js-ripple-effect"
								style="width: 100%;">
								<i class="material-icons ">people</i> View Ranking
							</button></a>

					</div>
				</div>
				<div class="mdl-grid  mdl-cell mdl-cell--12-col ">
					
					<div class="mdl-cell--12-col">
						<hr>
						<h3>
							<i class="material-icons material-heading">share</i> Share the
							vision
						</h3>

						<p>Link your social media account to the community hub and
							collect community points by following MADANA and sharing relevant
							posts. Check the integrated feed for possible opportunities</p>
					</div>
					<c:forEach items="${social_platforms}" var="platform">
						<c:if test="${platform.name != 'Ethereum'}">
							<div
								class="mdl-card something-else mdl-cell mdl-cell--6-col mdl-cell--12-col-phone  transparent "
								style="height: 250px">
								<div class="mdl-card__title "
									style="height:200px;  background-image: url('${platform.icon}'), url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  ;">
									<div
										style="text-align: center; align: center; left: 50%; transform: translate(-50%, 0); bottom: 125px; z-index: 999999; position: absolute; color: #b2d1ef;">
										<c:forEach var="entry" items="${platform.oActions}">
											<span class="mdl-cell--3-col"> <i
												class="material-icons" style="color: #4d7da2;">
													${entry.key} </i><span style="padding: 5px;">
													${entry.value} </span>


											</span>
										</c:forEach>
									</div>
								</div>

								<div
									class="mdl-card__actions mdl-card--border mdl-grid transparent"
									style="height: 75px;">


									<c:if test="${platform.isDisabled == true}">
										<button type="button"
											class="mdl-button mdl-js-button mdl-button--disabled"
											style="width: 100%;">
											<i class="material-icons">info</i> Currently Disabled
										</button>

									</c:if>
									<c:if test="${platform.isDisabled == false}">
										<c:choose>





											<c:when test="${platform.isVerifiedByUser == false}">

												<a style="align: right; width: 100%;"
													href="auth/${fn:toLowerCase(platform.name)}">


													<button
														class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
														style="width: 100%;">Verify ${platform.name}
														account</button>

												</a>
												<c:if test="${platform.name == 'Twitter'}">

													<br>

													<div style="font-size: 12px; color: #274863">You can
														also verify your account by sending a private message with
														"CH:${profile.userName}" to the official MADANA Twitter
														Account.</div>
												</c:if>
											</c:when>
											<c:otherwise>



												<c:choose>
													<c:when test="${empty platform.oActions}">
														<a class=" mdl-cell--12-col "
															style="align: right; width: 100%;"
															href="/bounty/${fn:toLowerCase(platform.name)}">
													</c:when>

													<c:otherwise>
														<a class=" mdl-cell--6-col "
															style="align: right; width: 100%;"
															href="/bounty/${fn:toLowerCase(platform.name)}">
													</c:otherwise>
												</c:choose>



												<button
													class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
													style="width: 100%;">
													<i class="material-icons">forward</i> ${platform.name}
													bounty
												</button>


											</c:otherwise>

										</c:choose>
									</c:if>
								</div>
								<div class="mdl-card__menu" style="font-size: 10px;">
									<a href="${platform.link}"><button
											class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect"
											style="align: center">
											<i class="material-icons">open_in_new</i>
										</button> ${platform.name}</a>

								</div>

							</div>
						</c:if>

					</c:forEach>
				</div>
				<div class="mdl-grid  mdl-cell mdl-cell--12-col">
					<div class="mdl-cell--12-col">
						<hr>
						<h3>
							<i class="material-icons material-heading">person_add</i> Invite
							some friends
						</h3>
						<p>Invite your friends with your referral links and introduce
							them to MADANA. For every new friend, you can boost your
							community points counter considerably.</p>
					</div>
					<c:forEach items="${referral_platforms}" var="platform">
						<div
							class="mdl-card something-else mdl-cell mdl-cell--4-col transparent"
							style="height: 250px">
							<div class="mdl-card__title"
								style="height:250px;  background-image: url('${platform.icon}'), url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  ">
								<div
									style="text-align: center; align: center; left: 50%; transform: translate(-50%, 0); bottom: 125px; z-index: 999999; position: absolute; color: #b2d1ef;">
									<span class="mdl-cell--3-col"> <c:if
											test="${platform.name == 'Whitelisting'}">
											<p style="position: relative; bottom: -80px; width: 350px;">Ended
												on 08.08.2019</p>
										</c:if>
									</span>
								</div>
							</div>

							<div
								class="mdl-card__actions mdl-card--border mdl-grid transparent "
								style="height: 75px;">

								<c:if test="${platform.isDisabled == true}">
									<button type="button"
										class="mdl-button mdl-js-button mdl-button--disabled"
										style="width: 100%;">
										<i class="material-icons">info</i> Currently Disabled
									</button>

								</c:if>
								<c:if test="${platform.isDisabled == false}">

									<a style="width: 100%" onclick="document.forceLoading();"
										href="/bounty/${fn:toLowerCase(platform.name)}">

										<button
											class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
											style="width: 100%;">
											<i class="material-icons">forward</i> ${platform.name} bounty
										</button>

									</a>
								</c:if>
							</div>
							<div class="mdl-card__menu" style="font-size: 10px;">
								<c:choose>
									<c:when test="${platform.name == 'Whitelisting'}">

									</c:when>
									<c:otherwise>

										<a href="${platform.link}" onclick="document.forceLoading();"><button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect"
												style="align: center">
												<i class="material-icons">open_in_new</i>
											</button> ${platform.name}</a>
									</c:otherwise>
								</c:choose>

							</div>

						</div>



					</c:forEach>
				</div>
			</div>

		</div>


		<jsp:include page="components/snackbar.jsp" />
	</div>
	</main>

	<jsp:include page="components/footer.jsp" />



</body>

</html>
