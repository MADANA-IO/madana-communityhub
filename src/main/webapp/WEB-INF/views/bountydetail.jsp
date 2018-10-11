<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<jsp:include page="components/header.jsp" />

<style>
@media screen and (max-width: 767px)
 {

.mdl-tabs__tab, .mdl-tabs__tab-bar
{
	height:80px;
}

}
</style>
<body>
	<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />
		
		<main class="mdl-layout__content content">
		<div class="mdl-grid">
			
				<div class="mdl-cell mdl-cell--12-col ">
				    <!-- Tabs -->
   <div class="mdl-tabs mdl-js-tabs mdl-js-ripple-effect">
  <div class="mdl-tabs__tab-bar mdnheader" style="color:#f3f3f6;">
      <a href="#starks-panel" class="mdl-tabs__tab is-active"><i class="material-icons">info</i>Unseen(${fn:length(noaction)})</a>
      <a href="#lannisters-panel" class="mdl-tabs__tab"><i class="material-icons">done</i>Interacted(${fn:length(inprogress)})</a>
      <a href="#targaryens-panel" class="mdl-tabs__tab"><i class="material-icons">done_all</i>Completed(${fn:length(completed)})</a>
  </div>
  
  <div class="mdl-tabs__panel is-active" id="starks-panel">
  	<div class=" mdl-grid mdl-cell mdl-cell--12-col ">
<c:forEach items="${noaction}" var="post">
							<div class="mdl-card  mdl-cell mdl-cell--4-col-desktop mdl-cell--12-col-phone" style="background-color: transparent;">
					<div class="mdl-card__title">
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->

						<div >	${post.embeddCode}
	
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<p style="width: 100%; font-size: 60%;text-align: left;">
									<i class="material-icons">info</i> Earn 200 CPT for a Retweet
								</p>
									<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">info</i> Earn 100 CPT for a Like
								</p>

					</div>
				</div>

												</c:forEach>
												</div>
  </div>
  <div class="mdl-tabs__panel" id="lannisters-panel">
  	<div class=" mdl-grid mdl-cell mdl-cell--12-col ">
<c:forEach items="${inprogress}" var="post">
							<div class="mdl-card  mdl-cell mdl-cell--4-col" style="background-color: transparent;">
					<div class="mdl-card__title">
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->

						<div>	${post.embeddCode}
	
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
					<c:set var="actions">${post.completedActions}</c:set>
					<c:if test = "${fn:contains(actions, 'like')}">
    
						<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">info</i> Earn 200 CPT for a Retweet
								</p>
									<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">done</i> Received 100 CPT for a Like
								</p>
								  </c:if>
								  	<c:if test = "${fn:contains(actions, 'share')}">
									<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">info</i> Earn 100 CPT for a Like
								</p>
								<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">done</i> Received 200 CPT for a Retweet
								</p>
								  </c:if>

					</div>
				</div>

												</c:forEach>
												</div>
  </div>
  <div class="mdl-tabs__panel" id="targaryens-panel">
  	<div class=" mdl-grid mdl-cell mdl-cell--12-col ">
<c:forEach items="${completed}" var="post">
							<div class="mdl-card  mdl-cell mdl-cell--4-col" style="background-color: transparent;">
					<div class="mdl-card__title">
					</div>
					<div class="mdl-card__supporting-text   ">
						<!-- Deletable Contact Chip -->

						<div>	${post.embeddCode}
	
						</div>
					</div>
					<div class="mdl-card__actions mdl-card--border">
						<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">done</i> Received 200 CPT for a Retweet
								</p>
									<p
									
									style="width: 100%;font-size: 60%;text-align: left;">
									<i class="material-icons">done</i> Received 100 CPT for a Like
								</p>

					</div>
				</div>

												</c:forEach>
												</div>
  </div>
</div>
		
					<div class="mdl-grid mdl-cell--12-col">
					  <section class="mdl-layout__tab-panel is-active" id="fixed-tab-1">
      <div class="page-content">
	
</div>
    </section>
    <section class="mdl-layout__tab-panel" id="fixed-tab-2">
      <div class="page-content"><!-- Your content goes here --></div>
    </section>
    <section class="mdl-layout__tab-panel" id="fixed-tab-3">
      <div class="page-content"><!-- Your content goes here --></div>
    </section>
						
					</div>
					</div>
					

		</div>


		</main>
	</div>
	<jsp:include page="components/footer.jsp" />	 
 	
</body>
</html>
