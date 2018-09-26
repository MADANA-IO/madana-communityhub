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
<div class="mdl-grid mdl-cell--12-col">
			<div class="mdl-cell mdl-cell--2-col ">

				<img src="${profile.image}" height="150" width="150">
			</div>
			<div class="mdl-cell mdl-cell--10-col ">
				<h1>${profile.userName}</h1>
				<h3>${profile.points}CP</h3>
			</div>
			</div>
			<div class=" mdl-cell--12-col">

				<h3>Achievements</h3>


				<p>After reaching a certain milestone, you can unlock
					achievements. For every achievement you unlock, you will receive
					bonus community points. You can see which achievements are still
					unlocked in your profile section. Some achievements are special and
					you can miss out on them, so pay attention!</p>
					
					<c:choose>
    <c:when test="${empty profile.achievements}">
<h4> User has decided to hide his achievements</h4>
    </c:when>
    <c:otherwise>
    <c:forEach items="${profile.achievements}" var="achievementgroup">
					<div class="mdl-grid mdl-cell mdl-cell--12-col">
						<div class="mdl-cell--12-col ">
							<h3>${achievementgroup.name}</h3>
						</div>


						<c:forEach items="${achievementgroup.achievements}" var="achievement">

							<div class="mdl-card something-else mdl-cell transparent"
								style="<c:if test="${achievement.completed == false}">opacity: 0.3;</c:if> margin:5px;width:19%;"
								id="${achievement.name}">

								<div class="mdl-card__title"
									style="height:150px;  background-image: url('${achievement.image}'), url(https://www.madana.io/assets/img/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:50px,cover ;">

								</div>

								<div class="mdl-card__supporting-text">
									<b>${achievement.name}</b>
										<div
								style="height: 5px;<c:if test="${achievement.completed == true}">background-color: green;</c:if><c:if test="${achievement.completed == false}">background-color: gray;</c:if> width:100%;">


							</div>
								</div>
								<!-- <div class="mdl-card__actions mdl-card--border mdl-grid ">
									${achievement.description}</div> -->
								<div class="mdl-card__menu" style="color: #f3f3f6;">
									${achievement.reward} CP</div>

							</div>
							<div class="mdl-tooltip mdl-tooltip--large"
								for="${achievement.name}">${achievement.description}</div>
						</c:forEach>


						
					

					</div>
				</c:forEach>
    </c:otherwise>
</c:choose>

				

			</div>
	<h3>Action History</h3>
		
<c:choose>
 <c:when test="${empty history}">
   <div class="mdl-cell mdl-cell--12-col">
					<h4> User has decided to hide his Action History</h4>
					</div>
    </c:when>
    <c:otherwise>
        	<div class="mdl-cell mdl-cell--12-col"
					style="height: 600px; overflow-y: scroll;">
					<ul class="demo-list-three mdl-list">
						<c:forEach items="${history}" var="object">
							<li class="mdl-list__item mdl-list__item--three-line transparent"
								style="width: 100%"><span
								class="mdl-list__item-primary-content"><span> <a
										href="${object.link}">${object.text}</a></span> <span></span> <span
									class="mdl-list__item-text-body"><img
										src="${object.platformIcon}" height="50" width="50">${object.actionIcon}
										Received ${object.benefit} pts for ${object.action} on
										${object.platform} </span> </span> <span
								class="mdl-list__item-secondary-content">
									${object.created} </span></li>
							<hr>
						</c:forEach>
					</ul>
				</div>
    </c:otherwise>
</c:choose>
	


		</div>
		</main>
	</div>
	<jsp:include page="components/footer.jsp" />	 
	
</body>
</html>
