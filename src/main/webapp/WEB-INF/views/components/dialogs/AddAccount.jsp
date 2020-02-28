<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<dialog class="mdl-dialog" id="addAccountDialog" style="color: #274863; " >
				<h4 class="mdl-dialog__title" style="text-align: center;color: #274863; ">Link another account
					</h4>
				<hr>
				<div class="mdl-dialog__content"
					style="height: 50%;">
						<ul class="demo-list-control mdl-list" style="width: 100%;">
							<c:forEach var="platform" items="${platforms}">
								<li class="mdl-list__item mdl-list__item--three-line" style="">
									<span class="mdl-list__item-primary-content"> <img
										src="${platform.icon}" alt="${platform.name}"
										height="50" width="50" class=""
										style="margin-bottom: -15px; padding-right: 10px; height: 40px; width: 40px;">
										<span class="subheading" >
											${platform.name}</span> 
								</span> <span class="mdl-list__item-secondary-action">
					
					<c:if test="${platform.isDisabled == 'true'}"><span style="color:darkgrey">Currently disabled</span></c:if> 
					<c:if test="${platform.isDisabled == 'false'}">
											<button type="button" id="auth${platform.name}"
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect close"
						style="width: 200px; background: #a0c3e8; color: white;">Authenticate
						</button>
				<script>
						var showDialogButton = document
								.querySelector('#auth${platform.name}');

						showDialogButton.addEventListener('click', function() {
							window.location.href = "/auth/${platform.name}".toLowerCase();
						});
					</script>
					</c:if> 
								</span>
								</li>
							</c:forEach>
							</ul>
				
				</div>
				<div class="mdl-dialog__actions">
					<button type="button"
						class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect cancel">cancel</button>

				
				</div>
				</dialog>
					<script>
    var dialog = document.querySelector('#addAccountDialog');
    var showDialogButton = document.querySelector('#addAccount');
    if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog);
    }
    showDialogButton.addEventListener('click', function() 
    		{
      dialog.showModal();
    });

    
    dialog.querySelector('.cancel').addEventListener('click', function() 
    		{
        dialog.close();
    		});

  </script>