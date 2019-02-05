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
		<div class="mdl-grid ">

		
					<div class="mdl-cell mdl-cell--4-col ">
				<ul class="demo-list-three mdl-list">
							<c:forEach items="${referrals}" var="object">
								<li class="mdl-list__item mdl-list__item--three-line"
									style="width: 100%"><span
									class="mdl-list__item-primary-content"> <img
										src="${object.image}" width="50" height="50" style=""> <a
										href="https://communityhub.madana.io/profile/${object.userName}">${object.userName}
											(${object.points})</a> <span class="mdl-list__item-text-body">
											<span> ${object.created} </span>
									</span>
								</span></li>
							</c:forEach>
						</ul>

		</div>
			<div class="mdl-cell mdl-cell--8-col ">
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
						<h3>Thanks for inviting ${fn:length(referrals)} users</h3>
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->
					

						<div></div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<c:choose>
							<c:when test="${platformname eq 'whitelisting'}">
					<h4>Share the link below to get more CP and a 10% commission for every user who invests by using your referral link. You will be rewarded with additional 5000 CP</h4>
							</c:when>
							<c:otherwise>
								<h4>Share the link below to get more CP. For every user who
									signs up with your referral link, you will be rewarded with
									1000 CP
									</h4>
							</c:otherwise>
						</c:choose>
						<textarea id="copytext" class="mdl-textfield__input" type="text"
							rows="4" disabled style="color: #274863;">${platform.link}?referrer=${user.guid}</textarea>
						<div class="mdl-cell mdl-cell--6-col" text-align="center">
							<button
								class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
								onclick="CopyToClipboard('copytext')">
								<i class="material-icons">file_copy</i> copy Link
							</button>
						</div>
					</div>



				</div>

			</div>
		<jsp:include page="components/snackbar.jsp" /> </main>
	</div>
	<jsp:include page="components/footer.jsp" />

</body>
<script>
	function CopyToClipboard(containerid) {
		if (document.selection) {
			var range = document.body.createTextRange();
			range.moveToElementText(document.getElementById(containerid));
			range.select().createTextRange();
			document.execCommand("copy");

		} else if (window.getSelection) {
			var range = document.createRange();
			range.selectNode(document.getElementById(containerid));
			window.getSelection().addRange(range);
			document.execCommand("copy");
			alert("Your referral Link has been copied to your clipboard")
		}
	}
</script>
</html>
