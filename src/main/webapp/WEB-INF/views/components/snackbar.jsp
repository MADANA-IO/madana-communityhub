<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  	<c:if test="${not empty error}">
  <button class="mdl-snackbar__action" type="button"></button>
							  <div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar" style="background-color:#995336">
							  
  <div class="mdl-snackbar__text"></div>
 <button class="mdl-snackbar__action" type="button"></button>
 <script  type="text/javascript">
 r(function(){
  'use strict';
 
    let data = {
      message: '${error}',
      timeout: 10000,
      actionText: 'Undo'
    };
    let snackbarContainer = document.querySelector('#demo-snackbar-example');

    	  snackbarContainer.MaterialSnackbar.showSnackbar(data);

 });
 function r(f){/in/.test(document.readyState)?setTimeout('r('+f+')',9):f()}

</script>
		</c:if>
		  	<c:if test="${not empty info}">
  <button class="mdl-snackbar__action" type="button"></button>
							  <div id="info-snackbar" class="mdl-js-snackbar mdl-snackbar" style="background-color:#274863; color:#f3f3f6;">
							  
  <div class="mdl-snackbar__text"></div>
 <button class="mdl-snackbar__action" type="button"></button>
 <script  type="text/javascript">
 r(function(){
  'use strict';
 
    let data = {
      message: '${info}',
      timeout: 10000,
      actionText: 'Undo'
    };
    let snackbarContainer = document.querySelector('#info-snackbar');

    	  snackbarContainer.MaterialSnackbar.showSnackbar(data);

 });
 function r(f){/in/.test(document.readyState)?setTimeout('r('+f+')',9):f()}

</script>
		</c:if>