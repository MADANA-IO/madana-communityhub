<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
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

<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

<link href=“https://fonts.googleapis.com/css?family=Montserrat”
	rel=“stylesheet”>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
<link rel="stylesheet" href="http://www.madana.io/assets/css/main.css">

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
<link href=' http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>
<link href=' http://fonts.googleapis.com/css?family=Montserrat'
	rel='stylesheet' type='text/css'>
<noscript id="loading-config">{ "phrases": ["Guiding the bits in your direction", "Spinning the cube", "Moving the satellite into position"], "options": { "typeSpeed": 50, "backSpeed": 50, "backDelay":	1000, "loop": true } }</noscript>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/loadingscreen.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js" /></script>
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/3c7b8ba2b9b6923997fd484e6a6c6162-T/-jyncwb/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=0e0352a0"></script>
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/96d54b25af8f37d3ebe0fab1198cff95-T/4z7lt3/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=710a7e45"></script>
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/96d54b25af8f37d3ebe0fab1198cff95-T/4z7lt3/711000/124fd565435d239522ceadf76f2edbee/2.0.31/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=710a7e45"></script>



<script type="text/javascript">
	// safely use jquery here since the issue collector will load it for you

	window.ATL_JQ_PAGE_PROPS = $
			.extend(
					window.ATL_JQ_PAGE_PROPS,
					{

						// ==== feedback collector ====
						"710a7e45" : {

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

								// default values
								summary : 'Feedback for new website designs',
								description : 'The font doesn\'t quite look right'

								// hidden field value
								,
								priority : '2'

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
							}

							// === additional environment details ===
							,
							environment : function() {

								var env_info = {};

								if (window.ADDITIONAL_CUSTOM_CONTEXT) {
									env_info['Additional Context Information'] = window.ADDITIONAL_CUSTOM_CONTEXT;
								}

								return env_info;
							}
							// === default field values ===
							,
							fieldValues : function() {

								var values = {};

								var error_message = $('.error_message');
								if (error_message.length !== 0) {

									// record error message from the page context rather than asking the user to enter it
									values['summary'] = error_message.children(
											'.summary').text();
									values['description'] = error_message
											.children('.description').text();

								}

								return values;

							}

						}

					});
</script>


</head>