<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<button id="show-changemail" type="button"
							class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">change
							E-Mail</button>
<dialog class="mdl-dialog" id="changemaildialog" >
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