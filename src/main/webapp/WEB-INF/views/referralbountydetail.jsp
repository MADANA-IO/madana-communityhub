<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />
<body>
	<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />
		
		<main class="mdl-layout__content content">
		<div class="mdl-grid demo-content">

			<div class="mdl-cell mdl-cell--12-col ">
				<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
					<div class="mdl-card__title">
						<h3>Thanks for inviting ${fn:length(referrals)} users</h3>
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->
						<ul class="demo-list-three mdl-list">
							<c:forEach items="${referrals}" var="object">
								<li class="mdl-list__item mdl-list__item--three-line"
									style="width: 100%"><span
									class="mdl-list__item-primary-content"> <i
										class="material-icons mdl-list__item-avatar">person</i> <a
										href="https://communityhub.madana.io/profile/${object.userName}">${object.userName}
											(${object.points})</a> <span class="mdl-list__item-text-body">
											<span> ${object.created} </span>
									</span>
								</span></li>
							</c:forEach>
						</ul>

						<div></div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<h4>Share the link below to get more pts. For every user who
							signs up you will be rewarded with 2000 CP</h4>
						<textarea class="mdl-textfield__input" type="text" rows="4"
							disabled style="color: #274863;">${platform.link}?referrer=${user.guid}</textarea>

					</div>
				</div>




			</div>
		</div>
	</div>

	</main>
	</div>
	<jsp:include page="components/footer.jsp" />	 

</body>
</html>
