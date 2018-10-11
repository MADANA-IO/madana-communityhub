<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<style>
@media  (max-width: 1000px) 
{
dialog.mdl-dialog
{

width:100%;
}
}
@media  (min-width: 1000px) 
{
dialog.mdl-dialog 
{

width:800px;
}
}
</style>
<jsp:include page="components/header.jsp" />

<body>
	<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />
		
		<main class="mdl-layout__content content">
		<div class="mdl-grid demo-content">


			<div class="mdl-card something-else mdl-cell mdl-cell--12-col transparent">
				<div class="mdl-card__title">
					<img src="${user.image}"><h2>
						${user.userName}
						</h2>
				</div>

				<div class="mdl-card__supporting-text">
					You have successfully logged in. <br>
					Please have a look at the
					information we collected from you. Your email is private,
					everything else can be discovered by everyone. <br> <br>
				</div>
				<div class="mdl-card__actions mdl-card--border">
			<button id="show-dialog" type="button" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">change avatar</button>
  <dialog class="mdl-dialog" >
    <h4 class="mdl-dialog__title" style="text-align:center">Change Avatar</h4>
         <p style="font-size:8px; padding-top:5px;text-align:center">
         Avatars provided by "Eucalyp Studio" under CC0 on iconfinder.com .
      </p>
    <div class="mdl-dialog__content"  style="height: 400px; overflow-y: scroll;">
    <div class="mdl-grid" id="avatars">
    <c:forEach var="avatar" items="${avatars}">
    <div class="mdl-card  mdl-cell mdl-cell--3-col mdl-cell--2-col-phone" >
				<div class="mdl-card__title">
				</div>
				<div class="mdl-card__supporting-text meta">

					<div >
						<img src="${avatar.image}">
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
				<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="${avatar.id}">
  <input type="radio" id="${avatar.id}" class="mdl-radio__button" name="options" value="1" checked>
  <span class="mdl-radio__label"></span>
</label>

				</div>
			</div>
   		</c:forEach>
 
      </div>
    </div>
    <div class="mdl-dialog__actions">
      <button type="button" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect cancel">cancel</button>
    
      <button type="button" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect close" style="width:200px; background:#a0c3e8; color:white;">Set Avatar</button>
    </div>
  </dialog>
  <script>
    var dialog = document.querySelector('dialog');
    var showDialogButton = document.querySelector('#show-dialog');
    if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog);
    }
    showDialogButton.addEventListener('click', function() 
    		{
      dialog.showModal();
    });
    dialog.querySelector('.close').addEventListener('click', function() 
    		{
    	var avatars = document.getElementById('avatars');
    	var btn = avatars.getElementsByClassName('is-checked')[0];
    	if (btn) {
    		var checkedElement = btn.getAttribute('for');
    		window.location.href = "settings/avatar/"+checkedElement;
    		
    	} else {
    		
    	}
    	
      dialog.close();
    });
    
    dialog.querySelector('.cancel').addEventListener('click', function() 
    		{
        dialog.close();
    		});

  </script>
					<a
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
						<form action="success" method="post">
						<!-- 
<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Delete Account</button> -->
						</form>
					</a>
				</div>

			</div>
<div class="mdl-grid mdl-cell mdl-cell--8-col transparent">
			<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
				<div class="mdl-card__title">
					<h3>Private Details</h3>
				</div>
				<div class="mdl-card__supporting-text meta ">
					<div class="minilogo"></div>
					<div>
						<table>

							<td width="50%;">
							<tr class="tddefault">
								<td width=20%;>Username:</td>
								<td align="left" width="10%"><c:out
										value="${user.userName}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Email:</td>
								<td width="10%"><c:out value="${user.mail}" /></td>
							</tr>
							<!-- 
							<tr class="tddefault">
								<td width=20%;>Firstname:</td>
								<td width="10%"><c:out value="${user.firstName}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Lastname:</td>
								<td width="10%"><c:out value="${user.lastName}" /></td>
							</tr>
							 -->
							<tr class="tddefault">
								<td width=20%;>Member since:</td>
								<td width="10%"><c:out value="${user.created}" /></td>
							</tr>
							<tr class="tddefault">
								<td width=20%;>Last login:</td>
								<td width="10%"><c:out value="${user.lastActive}" /></td>
							</tr>
							<tr>


							</tr>

							</td>

						</table>
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
				<!-- 
					<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Change Email</button>
					<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Change Password</button>  -->

				</div>
			</div>
					<div class="mdl-card  mdl-cell mdl-cell--12-col transparent">
				<div class="mdl-card__title ">
					<h3>Privacy Settings</h3>
				</div>
				<div class="mdl-card__supporting-text meta">
		
					<ul class="demo-list-control mdl-list">
						<c:forEach var="setting" items="${user.settings}">
  							<li class="mdl-list__item mdl-list__item--three-line">
  							<span class="mdl-list__item-primary-content"> 
  							<i class="material-icons mdl-list__item-avatar">history</i> 
  							<span>						${setting.name}</span>
  							 <span class="mdl-list__item-text-body"> ${setting.description} </span>
						</span> 
						<span class="mdl-list__item-secondary-action"> 
						<label	id="label${setting.id}"class="mdl-switch mdl-js-switch mdl-js-ripple-effect" for="${setting.id}">
						<input type="checkbox" id="${setting.id}" class="mdl-switch__input" 	<c:if test="${setting.value == 'true'}">checked</c:if> />
							</label>
						</span></li>
					</c:forEach> 
						
					</ul>

				</div>
							<script>
						<c:forEach var="setting" items="${user.settings}">

			
						document.addEventListener("DOMContentLoaded", function (event) 
								{
							var _selector = document.querySelector('label[id="label${setting.id}"]');
						    _selector.addEventListener('click', function (event) {
						        if ($(_selector).is('.is-checked'))
						        {
						        	document.forceLoading();
						        	window.location.href = "settings/${setting.id}?value=false";
						        } 
						        else 
						        {
						        	document.forceLoading();
						        	window.location.href = "settings/${setting.id}?value=true";
						        }
						    });
						});
						</c:forEach>
</script>

			</div>
			</div>
			<div
				class="mdl-card  mdl-cell mdl-cell--8-col mdl-cell--4-col-desktop transparent">
				<div class="mdl-card__title">
					<h3>Linked Accounts</h3>
				</div>
				<button
					class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--fab mdl-color--accent">
					<i class="material-icons mdl-color-text--white" role="presentation">add</i>
					<span class="visuallyhidden">add</span>
				</button>
				<div
					class="mdl-card__media">

				</div>
				<div
					class="mdl-card__supporting-text meta meta--fill "  >
					<div></div>
					<ul class="demo-list-control mdl-list">
							<c:forEach var="socialuser" items="${user.socialAccounts}">
  							<li class="mdl-list__item mdl-list__item--three-line"><span
							class="mdl-list__item-primary-content">
							<img src="${socialuser.image}" alt="${socialuser.platform}" height="50" width="50" style="margin-bottom:-15px;padding-right:10px;height:30px; width:40px;">
							 <span>
									${socialuser.platform}</span> <span class="mdl-list__item-text-body" style="align:center;padding-left:50px;">             ${socialuser.ident}</span>
						</span> <span class="mdl-list__item-secondary-action"> <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
  <i class="material-icons">cancel</i>
</button>
						</span></li>
					</c:forEach>
					
						
					</ul>
				</div>
			</div>
	
		</main>
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
	<jsp:include page="components/footer.jsp" />	  
</body>
</html>
