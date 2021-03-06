<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>MADANA Community Hub</title>

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="196x196" href="<%=request.getContextPath()%>/resources/img/communityhub.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="#b2d1ef">
<meta name="apple-mobile-web-app-title" content="MADANA Community Hub">
<link rel="apple-touch-icon-precomposed"
	href="<%=request.getContextPath()%>/resources/img/communityhub.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="<%=request.getContextPath()%>/resources/img/communityhub.png">
<meta name="msapplication-TileColor" content="#b2d1ef">

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/img/communityhub.png">


 <%-- Start fonts --%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link href=' https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap" rel="stylesheet"> 
	
	
 <%-- End fonts --%>


 <%-- Start css --%>
<link rel="stylesheet" type='text/html'
	href="https://www.madana.io/assets/css/main.css">

<link rel="stylesheet" type='text/css'
	href="<%=request.getContextPath()%>/resources/materials.css" />


<link rel="stylesheet" type='text/css'
	href="<%=request.getContextPath()%>/resources/styles.css" />
	     <script language="javascript"> 
               if('${cookie['style'].getValue()}' =='')
        	   {
               	   document.write('<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/madana.css?v='+ new Date()+'"/>');
        	   }
               else
            	   {
            	   document.write('<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/${cookie['style'].getValue()}.css?v='+ new Date()+'"/>');
            	   }
               </script>
 <%-- End css --%>


 <%-- Start scripts --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/jquery.js" /></script>
<script src="<%=request.getContextPath()%>/resources/material.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/moment.js" /></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/livestamp.js" /></script>

 <%-- End scripts --%>

 <%-- Start Widgets --%>
<jsp:include page="widgets/GoogleAnalytics.jsp" />
<jsp:include page="widgets/StatusPage.jsp" />
<jsp:include page="widgets/Jira.jsp" />
 <%-- End Widgets --%>




<style>
#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
	z-index: 900;
}

@media ( max-width : 767px) {
	.content h1 {
		font-size: 15vw;
	}
	.content  h2 {
		font-size: 8vw;
	}
	.content  h3 {
		font-size: 6vw;
	}
	.content  .mdl-card__title h2 {
		font-size: 6vw;
	}
	.content  .mdl-card__title h3 {
		font-size: 5vw;
	}
}

@media screen and (max-width: 800px) {
	.mobilehide {
		display: none;
	}
}

@media ( min-width : 767px) {
	.mobilehide {
		display: inline-block;
	}
	.mdl-button.mdl-button--colored {
		font-size: 0.7vw;
	}
}
</style>
</head>