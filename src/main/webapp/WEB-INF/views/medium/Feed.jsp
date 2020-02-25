<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<c:if test="${not empty MEDIUM_FEEDURL}">
		<div  class ="mdl-grid mdl-cell--12-col" id="medium"></div>
    <script type="text/javascript">
    $(function() {
        var $content = $('#medium');
        var data = {
            rss_url: '<c:out value="${MEDIUM_FEEDURL}"/>'
        };
$.get('https://api.rss2json.com/v1/api.json', data, function(response) {
            if (response.status == 'ok') 
            {
                
                var output = '';
$.each(response.items, function(k, item) {
                output += '<div class="mdl-cell mdl-cell--12-col" style="padding:20px;margin-bottom: 40px;width:100%;color:#274863;background:white">';
				output += '<div style="color:#274863;" class=""><header style="position: relative">';
			  	output += '<h4 style=" background-color: #f3f3f6;font-family: Raleway;  position: absolute; margin-top:-10px; padding: 10px; text-align: center; font-weight: 500;  z-index: 9; color: #274863">' + moment(item.pubDate).format("DD<br>MMM")+ "</h4>";
				var tagIndex = item.description.indexOf('<img'); // Find where the img tag starts
				var srcIndex = item.description.substring(tagIndex).indexOf('src=') + tagIndex; // Find where the src attribute starts
				var srcStart = srcIndex + 5; // Find where the actual image URL starts; 5 for the length of 'src="'
				var srcEnd = item.description.substring(srcStart).indexOf('"') + srcStart; // Find where the URL ends
				var src = item.description.substring(srcStart, srcEnd); // Extract just the URL
				output += '<div style ="text-transform: uppercase;text-align:center"><a target="_blank" style="text-transform: uppercase;letter-spacing: 1px; color:#274863"href="'+ item.link + '"><img class="img-responsive" src="' + src + '" width="100%" style="max-height:450px"></a></div></header>';
				output += '<div style="padding: 15px 28px; border: 1px ;solid #f5f5f5"><h4><a style="color:#4d7da2" target="_blank" href="'+ item.link + '">' + item.title + '</a></h4>';
				output += '<div style=" text-transform: uppercase; margin-bottom: 18px; padding-bottom: 10px; font-size: 12px; border-bottom: 1px solid #F5F5F5"><span style="color:#b2d1ef">By ' + item.author + '</span></div>';
  
				var yourString = item.description.replace(/<img[^>]*>/g,""); //replace with your string.
				var maxLength = 1500 ;// maximum number of characters to extract
				//trim the string to the maximum length
				var trimmedString = yourString.substr(0, maxLength);
				//re-trim if we are in the middle of a word
				trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
				output += '<p style="line-height: 22px;color:#274863">' + trimmedString + '...</p>';
				output += '</div></div><a target="_blank"  href="'+ item.link + '"><button class="mdl-button  mdl-js-button mdl-js-ripple-effect" style="width: 100%;">  <i class="material-icons">forward</i> Read the full article</button> </a></div>';
    return k<8
                });
$content.html(output);
}
});
});
</script>
				
</c:if>