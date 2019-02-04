<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>MADANA Community Hub</title>

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="196x196"
	href="https://www.madana.io/favicon-196x196.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="#b2d1ef">
<meta name="apple-mobile-web-app-title" content="MADANA Community Hub">
<link rel="apple-touch-icon-precomposed"
	href="https://www.madana.io/apple-touch-icon-152x152.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="https://www.madana.io/mstile-144x144.png">
<meta name="msapplication-TileColor" content="#b2d1ef">

<link rel="shortcut icon" href="https://www.madana.io/favicon-32x32.png">

<link href=€œhttps://fonts.googleapis.com/css?family=Montserrat€
	rel=€œstylesheet€>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="https://www.madana.io/assets/css/main.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/materials.css" />


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/styles.css" />
	


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
</style>
<link href=' https://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<link href=' https://fonts.googleapis.com/css?family=Montserrat'
	rel='stylesheet' type='text/css'>
<noscript id="loading-config">{ "phrases": ["Guiding the bits in your direction", "Spinning the cube", "Moving the satellite into position"], "options": { "typeSpeed": 50, "backSpeed": 50, "backDelay":	1000, "loop": true }, "timeout": 30000 }</noscript>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/loadingscreen.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js" /></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-106498074-4"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-106498074-4');
</script>
	
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/3c7b8ba2b9b6923997fd484e6a6c6162-T/-jyncwb/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=0e0352a0"></script>
<script type="text/javascript" src="https://intranet.madana.io/jira/s/96d54b25af8f37d3ebe0fab1198cff95-T/4z7lt3/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=c539491a"></script>

<script type="text/javascript">
	// safely use jquery here since the issue collector will load it for you

	window.ATL_JQ_PAGE_PROPS = $
			.extend(
					window.ATL_JQ_PAGE_PROPS,
					{

						// ==== feedback collector ====
						"c539491a" : {

							// === custom trigger function ===
								"triggerFunction" : function(showCollectorDialog) {
								//Requries that jQuery is available! 
								jQuery("#feedback-button").click(function(e) {
									e.preventDefault();
									showCollectorDialog();
								});
							}

							// === default and hidden field values ===
							,
							fieldValues : {
								versions:'0.1',

								// hidden field value
								priority : '2',
								components: 'Community Hub'
									

							}

						}

						// ==== bug collector ====
						,
						"0e0352a0" : {
							// === custom trigger function ===

							"triggerFunction" : function(showCollectorDialog) {
								//Requries that jQuery is available! 
								jQuery("#bug-button").click(function(e) {
									e.preventDefault();
									showCollectorDialog();
								});
								jQuery("#mainbug-button").click(function(e) {
									e.preventDefault();
									showCollectorDialog();
								});
							}

						// === default and hidden field values ===
						,
						fieldValues : {
							versions:'0.1',

							// hidden field value
							priority : '2',
							components: 'Community Hub'
								

						}

					}


					});
</script>
	<script async src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style>
@media  (max-width: 767px) 
{

	.content h1
	{
	font-size: 15vw;
	}
	.content  h2
	{
	font-size: 8vw;
	}
	.content  h3
	{
	font-size: 6vw;
	}
	.content  .mdl-card__title h2
	{
	font-size: 6vw;
	}
	.content  .mdl-card__title h3
	{
	font-size: 5vw;
	}

}
@media screen and (max-width: 800px)
 {
	
	.mobilehide {
		display:none;
	}
}
@media  (min-width: 767px) 
{
.mobilehide {
		display:block;
	}
	.mdl-button.mdl-button--colored
	{
	font-size: 0.7vw;
	}


}
</style>
</head>