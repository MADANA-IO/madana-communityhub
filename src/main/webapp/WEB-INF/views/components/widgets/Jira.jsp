<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://madana.atlassian.net/s/d41d8cd98f00b204e9800998ecf8427e-T/rzvw4p/b/23/a44af77267a987a660377e5c46e0fb64/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=de-DE&collectorId=0e0352a0"></script>
<script type="text/javascript" src="https://madana.atlassian.net/s/d41d8cd98f00b204e9800998ecf8427e-T/rzvw4p/b/23/a44af77267a987a660377e5c46e0fb64/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?locale=de-DE&collectorId=8cb698c9"></script>



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
				versions : '0.1',

				// hidden field value
				priority : '2',
				components : 'Community Hub'

			}

		}

	});
</script>