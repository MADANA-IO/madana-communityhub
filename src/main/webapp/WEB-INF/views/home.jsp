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

			<div class=" mdl-cell mdl-cell--12-col mdl-grid">
				<h2 style="background-color: #4d7da2; height: 50px; width: 100%;">Home</h2>

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
			<c:if test="${not empty MEDIUM_FEEDURL}">
				<div class=" mdl-cell mdl-cell--12-col mdl-grid" style="">
				
					<jsp:include page="medium/LatestPost.jsp" />

				</div>
			</c:if>
			<div class="mdl-grid mdl-cell mdl-cell--8-col">
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
													href="/auth/${fn:toLowerCase(platform.name)}">


													<button
														class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
														style="width: 100%;">Verify ${platform.name}
														account</button>

												</a>
												<c:if test="${platform.name == 'Twitter'}">
													<c:if test="${not empty profile.userName}">
														<br>

														<div style="font-size: 12px; color: #274863">You can
															also verify your account by sending a private message
															with "CH:${profile.userName}" to the official MADANA
															Twitter Account.</div>
													</c:if>
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
			<div class=" mdl-grid mdl-cell--4-col">
				<div class="mdl-cell mdl-cell--12-col "
					style="background: rgba(0, 0, 0, 0.3)">
					<div class="">
						<h4
							style="background-color: #4d7da2; height: 50px; padding: 10px;">
							<i class="material-icons">whatshot</i> Top Users
						</h4>
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->

						<div>

							<table id="rankingtable" style="width: 100%;">



								<tr id="rankingtableloader">
									<td><img
										src="https://cdn.madana.io/commonvisuals/icons/loading.gif"></td>
								</tr>
							</table>
						</div>


						<script>
							$
									.ajax({
										type : "GET",
										url : '${pageContext.request.contextPath}/session/ranking/top',
										dataType : "json",
										complete : [ function(response) {

											var obj = $
													.parseJSON(response.responseText);
											if (obj.length > 0) {

												const myNode = document
														.getElementById("rankingtableloader");
												myNode.innerHTML = '';
												var trHTML = '';
												for (var i = 0; i < obj.length; i++) {

													trHTML += '	<tr class="tddefault"	';
													if (i == 0) {
														trHTML += '  style="background-image: linear-gradient(to right, #D9A441, rgba(255, 255, 255, 0.1));" ';
													} else if (i == 1) {
														trHTML += '  style="background-image: linear-gradient(to right, #CCC2C2 50%, rgba(255, 255, 255, 0.1));" ';
													} else if (i == 2) {
														trHTML += '  style="background-image: linear-gradient(to right, #965A38 50%, rgba(255, 255, 255, 0.1));" ';
													}
													trHTML += '>';
													trHTML += '<td style="color: white;"><img src="'+obj[i].image+'"	width="60" height="60" class="circle"><a href="/profile/'+obj[i].userName+'">';
													trHTML += '<button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect profilelinkcircle"> <i class="material-icons">person</i></button>';
													trHTML += '</a> '
															+ obj[i].userName
															+ ' ';
													if (obj[i].activated == "true") {
														trHTML += '<i class="material-icons">verified_user</i>';
													}

													trHTML += ' <span style="display: block; font-size: 14px; position: relative; left: 120px; bottom: 20px; color: #274863;">'
															+ obj[i].points
															+ ' CP</span></td>	</tr>';

												}
												$("#rankingtable tbody")
														.append(trHTML);
											}
										} ]
									});
						</script>
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
				<div class="  mdl-cell mdl-cell--12-col "
					style="background: rgba(0, 0, 0, 0.3)">
					<div class="">
						<h4
							style="background-color: #4d7da2; height: 50px; padding: 10px;">
							<i class="material-icons">build</i> User Stats
						</h4>
					</div>
					<div class="">
						<div>
							<table>

								<tr class="tddefault">
									<td width="50%">Users:</td>
									<td align="left" width="50%"><c:out
											value="${system.usercount}" /></td>
								</tr>
								<tr class="tddefault">
									<td width="50%">Currently active:</td>
									<td width="50%"><c:out value="${system.activeusercount}" /></td>
								</tr>
								<tr class="tddefault">
									<td width="50%">Points collected:</td>
									<td width="50%"><c:out value="${system.rankingPointsSum}" /></td>
								</tr>



							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border"></div>

				</div>
				<div class="  mdl-cell mdl-cell--12-col "
					style="background: rgba(0, 0, 0, 0.3)">
					<div class="">
						<h4
							style="background-color: #4d7da2; height: 50px; padding: 10px;">
							<i class="material-icons">build</i> System Stats
						</h4>
					</div>
					<div class="">
						<div>
							<table>


								<tr class="tddefault">
									<td width="50%">Started:</td>
									<td width="50%"><c:out value="${system.startup}" /></td>
								</tr>
								<tr class="tddefault">
									<td width="50%">Last update:</td>
									<td width="50%"><c:out value="${system.useractionupdate}" /></td>
								</tr>

							</table>
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<br>
						<div>
							<a href="https://blog.madana.io/tagged/dev-notes" target="_blank"><button
									type="button"
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
			<div class=" mdl-cell mdl-cell--12-col mdl-grid">
				<hr>
				<h3>
					<i class="material-icons material-heading">share</i> Check our
					reddit
				</h3>
				<div class="mdl-grid"
					style="padding-left: 25px; padding-right: 25px;" id="reddit"></div>
				<script type="text/javascript">
					$(function() {
						var $content = $('#reddit');
						var data = {
							rss_url : 'https://www.reddit.com/r/MADANA.rss'
						};
						$
								.get(
										'https://api.rss2json.com/v1/api.json',
										data,
										function(response) {
											if (response.status == 'ok') {

												var output = '';
												$
														.each(
																response.items,
																function(k,
																		item) {
																	var tagIndex = item.description
																			.indexOf('<img'); // Find where the img tag starts
																	var srcIndex = item.description
																			.substring(
																					tagIndex)
																			.indexOf(
																					'src=')
																			+ tagIndex; // Find where the src attribute starts
																	var srcStart = srcIndex + 5; // Find where the actual image URL starts; 5 for the length of 'src="'
																	var srcEnd = item.description
																			.substring(
																					srcStart)
																			.indexOf(
																					'"')
																			+ srcStart; // Find where the URL ends
																	var src = item.description
																			.substring(
																					srcStart,
																					srcEnd); // Extract just the URL
																	output += '<div class="mdl-cell--12-col mdl-grid">';
																	output += '<div class="mdl-cell--2-col ">';
																	output += '<div style ="text-transform: uppercase;height:"><a target="_blank" style="text-transform: uppercase;letter-spacing: 1px; color:#274863"href="'+ item.link + '"><img style="" class="img-responsive" src="' + src + '"  ></a></div>';
																	output += '</div>';
																	output += '<div class="mdl-cell--10-col " style="    height: 60px;">';

																	output += '<h5><a style="color:#4d7da2 font-size:14px;" target="_blank" href="'+ item.link + '">'
																			+ item.title
																			+ '</a></h5>';
																	output += '<div style=" text-transform: uppercase; margin-bottom: 18px; padding-bottom: 10px; font-size: 12px; border-bottom: 1px solid #4d7da2;"><span style="color:white;"> Created <span  data-livestamp="'+ item.pubDate+'">'
																			+ item.pubDate
																			+ '"</span> by '
																			+ item.author
																			+ '</span></div>';

																	var yourString = item.description
																			.replace(
																					/<img[^>]*>/g,
																					""); //replace with your string.

																	output += '</div>';

																	output += '</div>';

																	return k < 10;
																});
												$content.html(output);
											}
										});
					});
				</script>
			</div>
		</div>
		<jsp:include page="components/snackbar.jsp" />
	</div>
	</main>

	<jsp:include page="components/footer.jsp" />



</body>

</html>
