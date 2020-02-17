<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<link rel="icon" sizes="196x196"
	href="https://cdn.madana.io/commonvisuals/favicons/favicon-196x196.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="#b2d1ef">
<meta name="apple-mobile-web-app-title" content="MADANA Community Hub">
<link rel="apple-touch-icon-precomposed"
	href="https://cdn.madana.io/commonvisuals/favicons/apple-touch-icon-152x152.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="https://cdn.madana.io/commonvisuals/favicons/mstile-144x144.png">
<meta name="msapplication-TileColor" content="#b2d1ef">

<link rel="shortcut icon"
	href="https://cdn.madana.io/commonvisuals/favicons/favicon-32x32.png">

<link href=€œhttps://fonts.googleapis.com/css?family=Montserrat€
	rel=€œstylesheet€>
	
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" type='text/html'
	href="https://www.madana.io/assets/css/main.css">

<link rel="stylesheet" type='text/css'
	href="<%=request.getContextPath()%>/resources/materials.css" />


<link rel="stylesheet" type='text/css'
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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js" /></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-106498074-4"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-106498074-4');
</script>

<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/d41d8cd98f00b204e9800998ecf8427e-CDN/-9l2e2/802000/179d75d9d7ce5d6b662322e8424eb023/2.2.4.6/_/download/batch/com.atlassian.plugins.jquery:jquery/com.atlassian.plugins.jquery:jquery.js?collectorId=310fbd12"></script>
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/57d9dd941d81787075f5df502cd5a087-T/-9l2e2/802000/179d75d9d7ce5d6b662322e8424eb023/3.0.7/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=310fbd12"></script>
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/d41d8cd98f00b204e9800998ecf8427e-CDN/-9l2e2/802000/179d75d9d7ce5d6b662322e8424eb023/2.2.4.6/_/download/batch/com.atlassian.plugins.jquery:jquery/com.atlassian.plugins.jquery:jquery.js?collectorId=8cb698c9"></script>
<script type="text/javascript"
	src="https://intranet.madana.io/jira/s/57d9dd941d81787075f5df502cd5a087-T/-9l2e2/802000/179d75d9d7ce5d6b662322e8424eb023/3.0.7/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=en-UK&collectorId=8cb698c9"></script>

<script type="text/javascript">
	// safely use jquery here since the issue collector will load it for you

	window.ATL_JQ_PAGE_PROPS = $.extend(window.ATL_JQ_PAGE_PROPS, {

		// ==== feedback collector ====
		"8cb698c9" : {

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
				versions : '0.1',

				// hidden field value
				priority : '2',
				components : 'Community Hub'

			}

		}

		// ==== bug collector ====
		,
		"310fbd12" : {
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
				versions : '0.1',

				// hidden field value
				priority : '2',
				components : 'Community Hub'

			}

		}

	});
</script>
<script async src="https://code.getmdl.io/1.3.0/material.min.js"></script>

<style>
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