<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<dialog class="mdl-dialog" id="changeavatar">
<h4 class="mdl-dialog__title" style="text-align: center">Change
	Avatar</h4>
<p style="font-size: 8px; padding-top: 5px; text-align: center">
	Avatars provided by "Eucalyp Studio" under CC0 on iconfinder.com .</p>
<div class="mdl-dialog__content"
	style="height: 400px; overflow-y: scroll;">
	<div class="mdl-grid" id="avatars">
		<c:forEach var="avatar" items="${avatars}">
			<div class="mdl-card  mdl-cell mdl-cell--3-col mdl-cell--2-col-phone">
				<div class="mdl-card__title"></div>
				<div class="mdl-card__supporting-text meta">

					<div>
						<img src="${avatar.image}">
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
					<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect"
						for="${avatar.id}"> <input type="radio" id="${avatar.id}"
						class="mdl-radio__button" name="options" value="1" checked>
						<span class="mdl-radio__label"></span>
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

