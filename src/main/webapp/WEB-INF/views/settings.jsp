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
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<main class="mdl-layout__content content">
		<div class="mdl-grid " >


			<div
				class="mdl-card something-else mdl-cell mdl-cell--12-col " style="background:transparent;">
				<div class="mdl-card__title" style="color:#274863;">
					<img src="${user.image}" class ="circle">
					<h3>${user.userName}<c:if test="${user.activated eq 'true'}">
									<i class="material-icons">check_circle</i>
											</c:if></h3>
				</div>

				<div class="">
					<span>You have successfully logged in. <br> Please have a look at
					the information we collected from you. Your email is private,
					everything else can be discovered by everyone. <br> <br></span>
				</div>
				<div class="mdl-card__actions mdl-card--border">
					<button id="changeavatarbutton" type="button"
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">change
						avatar</button>
					<dialog class="mdl-dialog" id="changeavatar">
					<h4 class="mdl-dialog__title" style="text-align: center">Change
						Avatar</h4>
					<p style="font-size: 8px; padding-top: 5px; text-align: center">
						Avatars provided by "Eucalyp Studio" under CC0 on iconfinder.com .
					</p>
					<div class="mdl-dialog__content"
						style="height: 400px; overflow-y: scroll;">
						<div class="mdl-grid" id="avatars">
							<c:forEach var="avatar" items="${avatars}">
								<div
									class="mdl-card  mdl-cell mdl-cell--3-col mdl-cell--2-col-phone">
									<div class="mdl-card__title"></div>
									<div class="mdl-card__supporting-text meta">

										<div>
											<img src="${avatar.image}">
										</div>
									</div>
									<div class="mdl-card__actions mdl-card--border">
										<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
											for="${avatar.id}"> <input type="radio"
											id="${avatar.id}" class="mdl-radio__button" name="options"
											value="1" checked> <span class="mdl-radio__label"></span>
										</label>

									</div>
								</div>
							</c:forEach>

						</div>
					</div>
					<div class="mdl-dialog__actions">
						<button type="button"
							class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect cancel">cancel</button>

						<button type="button"
							class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect close"
							style="width: 200px; background: #a0c3e8; color: white;">Set
							Avatar</button>
					</div>
					</dialog>
					<script>
    var dialog1 = document.querySelector('#changeavatar');
    var showDialogButton = document.querySelector('#changeavatarbutton');
    if (! dialog1.showModal) {
      dialogPolyfill.registerDialog(dialog1);
    }
    showDialogButton.addEventListener('click', function() 
    		{
    	dialog1.showModal();
    });
    dialog1.querySelector('.close').addEventListener('click', function() 
    		{
    	var avatars = document.getElementById('avatars');
    	var btn = avatars.getElementsByClassName('is-checked')[0];
    	if (btn) {
    		var checkedElement = btn.getAttribute('for');
    		window.location.href = "settings/avatar/"+checkedElement;
    		
    	} else {
    		
    	}
    	
    	dialog1.close();
    });
    
    dialog1.querySelector('.cancel').addEventListener('click', function() 
    		{
    	dialog1.close();
    		});

  </script>
					<!--	<a
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
				 		<form action="success" method="post">
						
<button
						class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
						Delete Account</button>
						</form>
					</a> -->
				</div>

			</div>
			<div class="mdl-grid mdl-cell mdl-cell--12-col ">
				<div class="mdl-card  mdl-cell mdl-cell--6-col " style="background:transparent">
					<div class="mdl-card__title" style="color:#274863;">
					<h2>
							<i class="material-icons material-heading" >perm_identity</i> Private Details
						</h2>
					</div>
					<div class=" ">
						<div class="minilogo"></div>
						<div>
							<table class="subheading">

								<td width="50%;">
								<tr class="tddefault ">
									<td width=20%;>Username:</td>
									<td align="left" width="10%"><c:out
											value="${user.userName}" /></td>
								</tr>
								<tr class="tddefault">
									<td width=20%;>E-Mail:</td>
									<td width="10%"><c:out value="${user.mail}" /> </td>
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
						<button id="show-changepassword" type="button"
							class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">change
							password</button>
						<button id="show-changemail" type="button"
							class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">change
							E-Mail</button>
						
							<c:if test="${!user.activated eq 'true'}">
								
											
								<a  class="mdl-button mdl-button--colored mdl-js-button mdl-button--raised " style="margin-left:10px;" href="/settings/verifymail"><i class="material-icons">check_circle</i> verify
							E-Mail
									</a></c:if>
									
										<c:if test="${user.activated eq 'true'}">
								
											
								  <span> E-Mail verified!</span></c:if>
					</div>
					</div>
				
				<dialog class="mdl-dialog" id="changemaildialog">
				<h4 class="mdl-dialog__title" style="text-align: center">Change
					E-Mail</h4>
				<p style="font-size: 8px; padding-top: 5px; text-align: center">

				</p>
				<div class="mdl-dialog__content"
					style="height: 100px; overflow-y: scroll;">
					<table>

						<tr>
							<td>E-Mail</td>
							<td><input type="text" id="pw1" name="password" /></td>
						</tr>
						<tr>
							<td>Re-enter E-Mail</td>
							<td><input type="text" id="pw2" name="matchingPassword" /></td>
						</tr>
						<tr>
							<td><label id="pwinfolabel" style="color:red;"></label></td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="mdl-dialog__actions">
					<button type="button"
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect cancel">cancel</button>

					<button type="button"
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect close"
						style="width: 200px; background: #a0c3e8; color: white;">Change
						E-Mail</button>
				</div>
				</dialog>
				<script>

    var showDialogButton = document.querySelector('#show-changepassword');
    
    showDialogButton.addEventListener('click', function() 
    		{
    	window.location.href = "resetpassword";
    });

  </script>
  				<script>
    var dialog = document.querySelector('#changemaildialog');
    var showDialogButton = document.querySelector('#show-changemail');
    if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog);
    }
    showDialogButton.addEventListener('click', function() 
    		{
      dialog.showModal();
    });
    dialog.querySelector('.close').addEventListener('click', function() 
    		{
    	var todo = document.getElementById("pw1").value;
    	var todo2 = document.getElementById("pw2").value;
    		if(todo != todo2)
    			{
    			document.getElementById("pwinfolabel").innerHTML='Entered E-Mails are not matching';
    			}
    		else {
    			window.location.href = "settings/changemail/"+todo;
     		   dialog.close();
     	}
    	 
    	
   
    });
    
    dialog.querySelector('.cancel').addEventListener('click', function() 
    		{
        dialog.close();
    		});

  </script>
  			<div class="mdl-card  mdl-cell mdl-cell--8-col " style="background:transparent">
					<div class="mdl-card__title"style="color:#274863;">
					<h2>
							<i class="material-icons material-heading" >account_circle</i> Privacy Settings
						</h2>
						</div>
					<div class="mdl-card__supporting-text meta">

						<ul class="demo-list-control mdl-list">
							<c:forEach var="setting" items="${user.settings}">
								<li class="mdl-list__item mdl-list__item--three-line"><span
									class="mdl-list__item-primary-content"> <i
										class="material-icons mdl-list__item-avatar" style="background:transparent;color:#274863;">settings</i> <span class="subheading">
											${setting.name}</span> <span class="mdl-list__item-text-body">
											${setting.description} </span>
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
  	<div
				class="mdl-card  mdl-cell mdl-cell--6-col mdl-cell--4-col-desktop transparent">
			<div class="mdl-card__title">
					<h2>
							<i class="material-icons material-heading" >link</i> Linked Accounts
						</h2>
						</div>
				<!-- 
				<button
					class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--fab mdl-color--accent">
					<i class="material-icons mdl-color-text--white" role="presentation">add</i>
					<span class="visuallyhidden">add</span>
				</button> -->
				<div class="mdl-card__media"></div>
				<div class="mdl-card__supporting-text meta meta--fill ">
					<div></div>
					<ul class="demo-list-control mdl-list">
						<c:forEach var="socialuser" items="${user.socialAccounts}">
							<li class="mdl-list__item mdl-list__item--three-line"><span
								class="mdl-list__item-primary-content"> <img
									src="${socialuser.image}" alt="${socialuser.platform}"
									height="50" width="50" class=""
									style="margin-bottom: -15px; padding-right: 10px; height: 30px; width: 40px;">
									<span class="subheading"> ${socialuser.platform}</span> <span
									class="mdl-list__item-text-body"
									style="align: center; padding-left: 50px;">
										${socialuser.ident}</span>
							</span> <span class="mdl-list__item-secondary-action">
									<!--  <button class="mdl-button mdl-js-button mdl-button--icon mdl-button--colored">
  <i class="material-icons">cancel</i>
</button> -->
							</span></li>
						</c:forEach>


					</ul>
				</div>
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
		
		</main>
	</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

	<jsp:include page="components/footer.jsp" />
</body>
</html>
