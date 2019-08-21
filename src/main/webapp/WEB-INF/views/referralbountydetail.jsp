<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />
<body>
	<div
		class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<main class="mdl-layout__content content">
		<div class="mdl-grid ">

		
		
			<div class="mdl-cell mdl-cell--12-col ">
			  <h2 style="background-color: #4d7da2;
    height: 50px;width:100%;
    ">Referral bounty ${platformname} </h2>
				<div class="mdl-card  mdl-cell mdl-cell--12-col " style="background-color:transparent; color:white;">
					<div class="">
						<h2>Thanks for inviting ${fn:length(referrals)} users</h2>
					</div>
					<div class="  ">
						<c:choose>
							<c:when test="${platformname eq 'whitelisting'}">
					<h4>Users who referred other users to the whitelisting get a 10% commission for every investment made. 5000 CP will be rewarded in addition</h4>
							</c:when>
							<c:otherwise>
								<h4>Share the link below to get more CP. For every user who
									signs up with your referral link, you will be rewarded with
									1000 CP
									</h4>
							</c:otherwise>
						</c:choose>
						<div></div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
									<c:choose>
							<c:when test="${platformname eq 'whitelisting'}">
					<h5>Ended on 08.08.2019</h5>
							</c:when>
							<c:otherwise>
							<textarea id="copytext" class="mdl-textfield__input subheading" type="text"
							rows="4" disabled style="color: #4d7da2;">${platform.link}?referrer=${user.guid}</textarea>
						<div class="mdl-cell mdl-cell--6-col" text-align="center">
							<button
								class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
								onclick="CopyToClipboard('copytext')">
								<i class="material-icons">file_copy</i> copy Link
							</button>
							</div>
							</c:otherwise>
						</c:choose>
				
						
						
					</div>



				</div>

			</div>
						<div class="mdl-cell mdl-cell--12-col ">
				<ul class="demo-list-three mdl-list">
							<c:forEach items="${referrals}" var="object">
							
			
								  <li class="mdl-list__item mdl-list__item--two-line">
    <span class="mdl-list__item-primary-content" style="height:75px">
     <img src="${object.image}" width="50" height="50" class="circle"> <c:if test="${object.activated eq 'true'}">
									<i class="material-icons">verified_user</i>
											</c:if>
      <span> <a	href="https://communityhub.madana.io/profile/${object.userName}" class="subheading" style="color:#a0c3e8;font-size:24px;">${object.userName}(${object.points})</a></span>
      <span class="mdl-list__item-sub-title" style="padding-left:75px;margin-top:-15px;"> ${object.created} </span>

    </span>
    <span class="mdl-list__item-secondary-content">
    <a class="" 		href="/profile/<c:out value="${object.userName}" />">
											
									 <button
												class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect " >
												<i class="material-icons" >person</i>
											</button> </a>
											
 
    </span>
  </li>
							</c:forEach>
						</ul>

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
