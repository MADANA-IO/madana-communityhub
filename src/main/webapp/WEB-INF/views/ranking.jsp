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


.smallinfo
{
position:absolute;
}
.smallinfo h2
{
position:absolute;
padding-top:28px;
}
.smallinfo h3
{
position:absolute;
top:65px;
}
.mdl-data-table {
    table-layout:fixed;
    width:100%; 
}
.mdl-data-table h4{
    font-size:4.5vw;
}
.mdl-data-table .tblcp{
     margin-top: 50px;
    margin-left: -300px;
}




}
</style>
<body>
	<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />
		
      <main class="mdl-layout__content content">
        <div class="mdl-grid ">
         <div class="mdl-grid" style="width:100%;" > 
         <div class="mdl-layout-spacer"></div>
         	<div
				class="mdl-card something-else mdl-cell--6-col-desktop mdl-cell--6-col-phone " style="background:transparent;">
		  <div class="mdl-card__title mdl-card--expand " style="color:#274863;">
  
    <img src="${user1.image}" width="150" height="150" class ="circle"style="margin-right:25px;">
    <div>
    <h3 ><c:out value="${user1.userName}" /></h3>
      <h4>${user1.points} CP</h4>
    </div>


   

  </div>
    <div class="mdl-card__supporting-text   "  style="width:100%;background-color:#D9A441;">
		
		</div>

			<div class="mdl-card__menu">
   <a href="/profile/<c:out value="${user1.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">face</i>
    </button></a>
  </div>
			</div>
			<div class="mdl-layout-spacer"></div>
         </div>
        <div class="mdl-grid" style="width:100%;"> 
        	     	<div
				class="mdl-card something-else mdl-cell mdl-cell--8-col mdl-cell--6-col-desktop mdl-cell--2-col-phone" style="background:transparent;"">
		  <div class="mdl-card__title mdl-card--expand"  style="color:#274863;">
     
    <img src="${user2.image}" width="150" height="150" class ="circle" style="margin-right:25px;">
    <div class="smallinfo">
    <h3  ><c:out value="${user2.userName}" /></h3>
      <h4>${user2.points} CP</h4>
    </div> 
  </div>
   <div class="mdl-card__supporting-text   "  style="width:100%;background-color:#CCC2C2;">
		
		</div>
<div class="mdl-card__menu">
   <a href="/profile/<c:out value="${user2.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">face</i>
    </button></a>
  </div>
			</div>
			   <div class="mdl-layout-spacer"></div>
			     	<div
				class="mdl-card something-else mdl-cell mdl-cell--8-col mdl-cell--2-col-phone mdl-cell--6-col-desktop " style="background:transparent;">
		  <div class="mdl-card__title mdl-card--expand"  style="color:#274863;">
     <img src="${user3.image}" width="150" height="150" class ="circle" style="margin-right:25px;">
    <div class="smallinfo">
    <h3 ><c:out value="${user3.userName}" /></h3>
      <h4>${user3.points} CP</h4>
    </div> 
   </div>
   <div class="mdl-card__supporting-text   "  style="width:100%;background-color:#965A38;">
		
		</div>
<div class="mdl-card__menu">
   <a href="/profile/<c:out value="${user3.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect ">
     	 <i class="material-icons">face</i>
    </button></a>
  </div>
  	
			</div>
        </div>
          <div class="mdl-cell mdl-cell--12-col ">
  
				<table
					class="mdl-data-table mdl-js-data-table mdl-data-table__header--sorted-descending  "
					style="width: 100%">
					<thead>
						<tr>
							
							<th>Rank & Username</th>
							<th></th>
							<th>Points</th>
							<th>Link</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user" varStatus="myIndex">
						<c:if test="${myIndex.index>2}">
							<tr>
								<td class="tblrank"><h4>${myIndex.index +1}.</h4></td>
								<td style="text-align: left"><h4>
							     <img src="${user.image}" width="75" height="75" class ="circle" style="margin-right:5px;">
										<c:out value="${user.userName}" />
									</h4></td>
								<td><h4 class="tblcp">${user.points} CP</h4></td>
								<td >
								<button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
  	<a href="profile/<c:out value='${user.userName}' />"><i class="material-icons">face</i></a>
</button>

							</td>
							</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
		
          </div>
   	<jsp:include page="components/snackbar.jsp" />
        </div>
      </main>
    </div>
	<jsp:include page="components/footer.jsp" />	 
  </body>
</html>
