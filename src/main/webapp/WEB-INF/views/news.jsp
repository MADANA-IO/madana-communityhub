<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<jsp:include page="components/header.jsp" />
<body>
<!-- Latest compiled and minified CSS -->

	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<div class="mdl-layout__content content" style="height: 100%">
<div class="mdl-grid mdl-cell mdl-cell--12-col ">
</div>

			<div class="mdl-grid mdl-cell mdl-cell--12-col ">
			<div  class ="row" id="medium"></div>
			</div>

		</div>
	</div>

	<jsp:include page="components/footer.jsp" />
	    <script src="https://momentjs.com/downloads/moment.min.js"></script>
    <script type="text/javascript">
    $(function() {
        var $content = $('#medium');
        var data = {
            rss_url: 'https://blog.madana.io/feed/'
        };
$.get('https://api.rss2json.com/v1/api.json', data, function(response) {
            if (response.status == 'ok') 
            {
                
                var output = '';
$.each(response.items, function(k, item) {
                output += '<div class="col-sm-4" style="padding:10px;margin-bottom: 40px;color:#274863"">';
				output += '<div style="background-color:white;" class=""><header style="position: relative">';
			  	output += '<h4 style=" background-color: #f3f3f6;font-family: Raleway;  position: absolute; margin-top:-10px; padding: 10px; text-align: center; font-weight: 500;  z-index: 9; color: #274863">' + moment(item.pubDate).format("DD<br>MMM")+ "</h4>";
				var tagIndex = item.description.indexOf('<img'); // Find where the img tag starts
				var srcIndex = item.description.substring(tagIndex).indexOf('src=') + tagIndex; // Find where the src attribute starts
				var srcStart = srcIndex + 5; // Find where the actual image URL starts; 5 for the length of 'src="'
				var srcEnd = item.description.substring(srcStart).indexOf('"') + srcStart; // Find where the URL ends
				var src = item.description.substring(srcStart, srcEnd); // Extract just the URL
				output += '<div style ="text-transform: uppercase;;"><a target="_blank" style="text-transform: uppercase;letter-spacing: 1px; color:#274863"href="'+ item.link + '"><img class="img-responsive" src="' + src + '" width="100%" height="240px"></a></div></header>';
				output += '<div style="padding: 15px 28px; border: 1px ;solid #f5f5f5"><h4><a style="color:#274863" target="_blank" href="'+ item.link + '">' + item.title + '</a></h4>';
				output += '<div style=" text-transform: uppercase; margin-bottom: 18px; padding-bottom: 10px; font-size: 12px; border-bottom: 1px solid #F5F5F5"><span style="color:#b2d1ef">By ' + item.author + '</span></div>';
  
				var yourString = item.description.replace(/<img[^>]*>/g,""); //replace with your string.
				var maxLength = 250 // maximum number of characters to extract
				//trim the string to the maximum length
				var trimmedString = yourString.substr(0, maxLength);
				//re-trim if we are in the middle of a word
				trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
				output += '<p style="line-height: 22px;color:#274863">' + trimmedString + '...</p>';
				output += '</div></div></div>';
    return k<8
                });
$content.html(output);
}
});
});
</script>
</body>
</html>
