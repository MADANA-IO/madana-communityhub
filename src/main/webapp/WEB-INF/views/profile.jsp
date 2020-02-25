<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
   
<jsp:include page="components/header.jsp" />

<style>
@media  (max-width: 1000px) 
{


.mdl-list__item
{
font-size:2.5vw;
}

}
</style>
<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
   	<jsp:include page="components/menu.jsp" />
		
		<main class="mdl-layout__content content">
		<div class="mdl-grid   ">

<div class="mdl-grid mdl-cell--12-col " class="" >
     <h2 style="background-color: #4d7da2;
    height: 50px;width:100%;
    ">Profile of ${destprofile.userName}</h2>
			<div class="mdl-cell mdl-cell--2-col ">

				<img src="${destprofile.image}" height="150" width="150" class="circle">
			</div>
			<div class="mdl-cell mdl-cell--10-col ">
				<h3>${destprofile.userName}<c:if test="${destprofile.activated eq 'true'}">
									<i class="material-icons">check_circle</i>
											</c:if></h3>
				<h4>${destprofile.points}CP</h4>
			</div>
			</div>
			<div class=" mdl-cell--12-col">

			
	<h3>
							<i class="material-icons material-heading">grade</i> Achievements
						</h3>

				<p>After reaching a certain milestone, you can unlock
					achievements. For every achievement you unlock, you will receive
					bonus community points. You can see which achievements are still
					unlocked in your profile section. Some achievements are special and
					you can miss out on them, so pay attention!</p>
					
					<c:choose>
    <c:when test="${empty destprofile.achievements}">
<h4> User has decided to hide his achievements</h4>
    </c:when>
    <c:otherwise>
    <c:forEach items="${destprofile.achievements}" var="achievementgroup">
					<div class="mdl-grid mdl-cell mdl-cell--12-col">
						<div class="mdl-cell--12-col ">
					
								<h4>
							<i class="material-icons material-heading">category</i> ${achievementgroup.name}
						</h4>
						</div>


						<c:forEach items="${achievementgroup.achievements}" var="achievement">

							<div class="mdl-card something-else mdl-cell--2-col-desktop mdl-cell--2-col-phone transparent"
								style="<c:if test="${achievement.completed == false}">opacity: 0.3;</c:if> margin:5px;"
								id="${achievement.name}">

								<div class="mdl-card__title"
									style="height:150px;  background-image: url('${achievement.image}'), url(https://cdn.madana.io/commonvisuals/backgrounds/hero-grid@3x.jpg); background-position: center, 0;  background-repeat: no-repeat, no-repeat;  background-size:50px,cover ;">

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
			<div class=" mdl-cell--12-col">
		

        	<div class=" mdl-cell mdl-cell--12-col">
					<div class="">
						<h4>
							<i class="material-icons">history</i> Action History
						</h4>
					</div>
					<div class="mdl-card__supporting-text meta">
							
<c:choose>
 <c:when test="${empty history}">
   <div class="mdl-cell mdl-cell--12-col">
					<p> User has decided to hide his Action History</p>
					</div>
    </c:when>
    <c:otherwise>
						<div>
							<ul class="demo-list-three mdl-list">
						<c:forEach items="${history}" var="object">
							<li class="mdl-list__item mdl-list__item--three-line"
								style="width: 100%;"><span
								class="mdl-list__item-primary-content"><span> <a
										target="_blank" class="subheading" style="color:#4d7da2;" href="${object.link}">${object.text}</a></span> <span></span> <span
									class="mdl-list__item-text-body subheading " style="font-size:80%;color:white;"><img
										src="${object.platformIcon}" height="30" width="30" style="margin-top:-10px;padding-right:5px; ">${object.actionIcon}
										Received ${object.benefit} pts for ${object.action} on
										${object.platform} </span> </span> <span
								class="subheading" style="Font-size:60%;color:#4d7da2;">
									${object.created} </span></li>
							<hr>
						</c:forEach>
					</ul>
						</div>
						    </c:otherwise>
</c:choose>
					</div>
					<div class="mdl-card__actions mdl-card--border">
			
					</div>
				</div>

	


		</div>
		</div>
		</main>
	</div>
	<jsp:include page="components/footer.jsp" />	 
	
</body>
</html>
