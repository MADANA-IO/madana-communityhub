<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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