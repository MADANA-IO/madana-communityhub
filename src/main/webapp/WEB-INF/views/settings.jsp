<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<style>
@media ( max-width : 1000px) {
	dialog.mdl-dialog {
		width: 100%;
	}
}

@media ( min-width : 1000px) {
	dialog.mdl-dialog {
		width: 800px;
	}
}
</style>
<jsp:include page="components/header.jsp" />

<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<main class="mdl-layout__content content">
		<div class="mdl-grid ">


			<div class="mdl-card something-else mdl-cell mdl-cell--12-col "
				style="background: rgba(0, 0, 0, 0.3)">
				<h2 style="background-color: #4d7da2; height: 50px;">Settings</h2>
				<span>You have successfully logged in. <br> Please have
					a look at the information we collected from you. Your email is
					private, everything else can be discovered by everyone. <br> <br></span>
				<div class="mdl-card__title" style="">
					<img style="position: relative; top: 60px;" src="${user.image}"
						class="circle">
					<h3>${user.userName}<c:if test="${user.activated eq 'true'}">
							<i class="material-icons">verified_user</i>
						</c:if>
					</h3>
				</div>

				<div class=""
					style="padding-left: 170px; width: 60%; margin-top: -50px;">
					<div>
						<table style="color: white;">

							<tr class="tddefault ">
								<td>Signed up with username: <c:out
										value="${user.userName}" /></td>

							</tr>
							<tr class="tddefault">
								<td>Registered E-Mail: <c:out value="${user.mail}" />
								</td>
							</tr>

							<tr class="tddefault">
								<td>Member since: <c:out value="${user.created}" /></td>
							</tr>
							<tr class="tddefault">
								<td>Last seen: <c:out value="${user.lastActive}" /></td>
							</tr>

							<tr class="tddefault">
								<td><br>
								<br></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
					<jsp:include page="components/dialogs/ChangeAvatar.jsp" />
					
					<button id="show-changepassword" type="button"
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">change
						password</button>
					<script>
						var showDialogButton = document
								.querySelector('#show-changepassword');

						showDialogButton.addEventListener('click', function() {
							window.location.href = "resetpassword";
						});
					</script>
					
					<jsp:include page="components/dialogs/ChangeMail.jsp" />




				</div>

			</div>




			<div class="mdl-grid mdl-cell mdl-cell--12-col "
				style="background: rgba(0, 0, 0, 0.3)">

				<div class="mdl-card  mdl-cell mdl-cell--12-col "
					style="background: transparent">
					<div class="mdl-card__title" style="color: white;">
						<h2>
							<i class="material-icons material-heading">account_circle</i>
							Privacy Settings
						</h2>

					</div>
					<hr>
					<div class="mdl-card__supporting-text meta">

						<ul class="demo-list-control mdl-list">
							<c:forEach var="setting" items="${user.settings}">
								<li class="mdl-list__item mdl-list__item--three-line"><span
									class="mdl-list__item-primary-content"> <i
										class="material-icons mdl-list__item-avatar"
										style="background: transparent;">settings</i> <span
										style="color: white" class="subheading">
											${setting.name}</span> <span class="mdl-list__item-text-body"
										style="color: #4d7da2"> ${setting.description} </span>
								</span> <span class="mdl-list__item-secondary-action"> <label
										id="label${setting.id}"
										class="mdl-switch mdl-js-switch mdl-js-ripple-effect"
										for="${setting.id}"> <input type="checkbox"
											id="${setting.id}" class="mdl-switch__input"
											<c:if test="${setting.value == 'true'}">checked</c:if> />
									</label>
								</span></li>
							</c:forEach>

						</ul>

					</div>
				</div>



				<script>
					<c:forEach var="setting" items="${user.settings}">

					document
							.addEventListener(
									"DOMContentLoaded",
									function(event) {
										var _selector = document
												.querySelector('label[id="label${setting.id}"]');
										_selector
												.addEventListener(
														'click',
														function(event) {
															if ($(_selector)
																	.is(
																			'.is-checked')) {
																document
																		.forceLoading();
																window.location.href = "settings/${setting.id}?value=false";
															} else {
																document
																		.forceLoading();
																window.location.href = "settings/${setting.id}?value=true";
															}
														});
									});
					</c:forEach>
				</script>


			</div>
			<div class="mdl-grid mdl-cell mdl-cell--12-col "
				style="background: rgba(0, 0, 0, 0.3)">

				<div class="mdl-grid mdl-cell mdl-cell--12-col ">
					<div class="mdl-cell mdl-cell--12-col">
						<h2>
							<i class="material-icons material-heading">link</i> Linked
							Accounts
						</h2>
						<hr>
					</div>

					<div class="mdl-card__media  mdl-cell mdl-cell--12-col"></div>
					<div class="mdl-card__supporting-text meta meta--fill ">
						<div></div>
						<ul class="demo-list-control mdl-list" style="width: 100%;">
							<c:forEach var="socialuser" items="${user.socialAccounts}">
								<li class="mdl-list__item mdl-list__item--three-line" style="">
									<span class="mdl-list__item-primary-content"> <img
										src="${socialuser.image}" alt="${socialuser.platform}"
										height="50" width="50" class=""
										style="margin-bottom: -15px; padding-right: 10px; height: 40px; width: 40px;">
										<span class="subheading" style="color: white;">
											${socialuser.platform}</span> <span class="mdl-list__item-text-body"
										style="align: center; color: #4d7da2; padding-left: 50px"">
											${socialuser.ident}</span>
								</span> <span class="mdl-list__item-secondary-action">
										<button
											class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
											<i class="material-icons">cancel</i>
										</button>
								</span>
								</li>
							</c:forEach>
							<li><hr></li>
							<li class="mdl-list__item mdl-list__item--three-line" style=""><span
								class="mdl-list__item-primary-content"> <a href="#">
										<button id="addAccount"
											class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--fab "
											style="margin-left: -10px; padding-right: 10px;">
											<i class="material-icons mdl-color-text--white"
												role="presentation">add</i> <span class="visuallyhidden">add</span>
										</button> <span class="subheading"
										style="color: white; padding-left: 10px;"> Link another
											account</span>
												<c:set var="platforms" value="${platforms}" scope="request"/>
												<jsp:include page="components/dialogs/AddAccount.jsp" />
								</a>
							</span> <span class="mdl-list__item-secondary-action"> <!--  <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
  <i class="material-icons">cancel</i>
</button> -->
							</span></li>

						</ul>
					</div>
					<div class="mdl-card__actions mdl-card--border"></div>
				</div>
			</div>

			<div class="mdl-grid  mdl-cell mdl-cell--12-col "
				style="background: rgba(0, 0, 0, 0.3)">
				<div class="mdl-cell mdl-cell--12-col">
					<h2>
						<i class="material-icons material-heading">warning</i> Danger
						Zone
					</h2>
					<hr>
				</div>
				<div class="mdl-cell mdl-cell--12-col">
					<a class="mdl-button mdl-js-button mdl-button--raised "
						href="deleteaccount"
						style="margin-left: 10%; width: 80%; background-color: transparent; color: indianred;">Delete
						Account</a>
				</div>
			</div>
		</div>

		</main>
	</div>




	<jsp:include page="components/footer.jsp" />
</body>
</html>
