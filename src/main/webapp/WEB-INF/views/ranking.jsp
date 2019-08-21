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
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />
		
      <main class="mdl-layout__content content">
        <div class="mdl-grid ">
         <div class="mdl-grid" style="width:100%;" > 
         <div class="mdl-layout-spacer"></div>
         <div class="mdl-cell--12-col">
         <h2 style="background-color: #4d7da2;
    height: 50px;
    ">Ranking</h2>
         <p>In this section, you can see which rank you hold compared to other community members. The more community points you have the higher your rank will be. The ranking is the basis on which MADANA decides how big the reward from community campaigns will be for you. The higher your rank, the better the reward will be.
</p>
         </div>
            <div class="mdl-cell--12-col mdl-grid" style="padding-top:50px;">
         	<div
				class="mdl-card something-else mdl-cell mdl-cell--4-col mdl-cell--12-col-phone " style="    margin-top: 80px;background: linear-gradient(180deg, #CCC2C2, transparent);
    height: 325px;">
		  <div class="mdl-card__title mdl-card--expand " style="color:white;">
  
    <img src="${user2.image}" width="100" height="100" class ="circle"style="margin-right:25px;">
    <div>
    <h3 ><c:out value="${user2.userName}" />	<c:if test="${user2.activated eq 'true'}">
									<i class="material-icons">verified_user</i>
											</c:if></h3>
    
    
    </div>


   

  </div>
    <div class="mdl-card__supporting-text   "   style="    width: 100%;
   text-align: center;
    color: #4d7da2;
    background-color: white;">
		  <h4>${user2.points} CP</h4>
		</div>

			<div class="mdl-card__menu">
   <a href="/profile/<c:out value="${user2.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">person</i>
    </button></a>
  </div>
			</div>
			
  
        	     	<div
				class="mdl-card something-else mdl-cell mdl-cell--4-col mdl-cell--12-col-phone  " style="background: linear-gradient(180deg, #D9A441, transparent);
    height: 400px;">
		  <div class="mdl-card__title mdl-card--expand"  style="color:white;">
     
    <img src="${user1.image}" width="100" height="100" class ="circle" style="margin-right:25px;">
    <div class="smallinfo">
    <h3  ><c:out value="${user1.userName}" /><c:if test="${user1.activated eq 'true'}">
									<i class="material-icons">verified_user</i>
											</c:if></h3>
    	
     
    </div> 
  </div>
   <div class="mdl-card__supporting-text   "  style="    width: 100%;
   text-align: center;
    color: #4d7da2;
    background-color: white;">
		 <h4 >${user1.points} CP</h4>
		</div>
<div class="mdl-card__menu">
   <a href="/profile/<c:out value="${user1.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
     	 <i class="material-icons">person</i>
    </button></a>
  </div>
			</div>
			
			     	<div
				class="mdl-card something-else mdl-cell mdl-cell--4-col mdl-cell--12-col-phone  " style="     margin-top: 155px;   background: linear-gradient(180deg, #965A38, transparent);
    height: 250px;">
		  <div class="mdl-card__title mdl-card--expand"  style="color:white;">
     <img src="${user3.image}" width="100" height="100" class ="circle" style="margin-right:25px;">
    <div class="smallinfo">
    <h3 ><c:out value="${user3.userName}" /><c:if test="${user3.activated eq 'true'}">
									<i class="material-icons">verified_user</i>
											</c:if></h3>
    	
    
    </div> 
   </div>
   <div class="mdl-card__supporting-text   "  style="    width: 100%;
    text-align: center;
    color: #4d7da2;
    background-color: white;">
		  <h4>${user3.points} CP</h4>
		</div>
<div class="mdl-card__menu">
   <a href="/profile/<c:out value="${user3.userName}" />" > <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect ">
     	 <i class="material-icons">person</i>
    </button></a>
  </div>
  	      </div>
			</div>
        </div>
          <div class="mdl-cell mdl-cell--12-col " style="padding-top:50px;">
  
				<table
					class="mdl-data-table mdl-js-data-table mdl-data-table__header--sorted-descending  "
					style="width: 100%; color: #4d7da2;">
					<thead>
						<tr style="    background-color: white;">
							
							<th>Rank & Username</th>
							<th></th>
							<th>Points</th>
							<th>Link</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user" varStatus="myIndex">
						<c:if test="${myIndex.index>2}">
							<tr style="height:0!important; padding-top:0!important; padding-bottom:0!important;">
								<td class="tblrank"><p style="    font-size: 16px;
    letter-spacing: 0;
    margin: 0px;">${myIndex.index +1}.</p></td>
								<td style="text-align: left"><p style="    font-size: 16px;
    letter-spacing: 0;
    margin: 0px;">
							     <img src="${user.image}" width="40" height="40" class ="circle" style="margin-right:5px;">
										<c:out value="${user.userName}" />
										<c:if test="${user.activated eq 'true'}">
									<i class="material-icons">verified_user</i>
											</c:if>
									</p></td>
								<td><p class="tblcp mobilehide" style="    font-size: 16px;
    letter-spacing: 0;
    margin: 0px;">${user.points} CP</p></td>
								<td >
								<button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
  	<a href="profile/<c:out value='${user.userName}' />"><i class="material-icons">person</i></a>
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
