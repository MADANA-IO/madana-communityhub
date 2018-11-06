<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="status">   <a href="http://status.madana.io" target="_blank">
            <span class="color-dot"></span>
            <span class="color-description"></span>
          </a></div>
				
<style>
 #status {
    position: fixed;
    bottom: 0;
    right: 0;
  }
.color-dot {
  @include border-radius(99px);
  display:inline-block;
  width:10px;
  height:10px;
  margin-right:5px;

}
.maintenance
{
 background-color:#e74c3c;
}
.critical
{
 background-color:#e74c3c;
}
.major
{
 background-color:#e67e22;
}
.minor
{
 background-color:#f1c40f;
}
.none
{
 background-color:#2ecc71;
}
</style>

<script type="text/javascript"
	src=" https://cdn.statuspage.io/se-v2.js" /></script>
	   <!-- status information inserted here -->
      

 <script  type="text/javascript">
//notice the JS Library is imported already (click the gear next to JS)
//this script also assumes jQuery is already loaded on the page.

var sp = new StatusPage.page({ page: '41zg7lf9yvrd'});

sp.summary({
success: function(data) {
  // adds the text description to the dropdown
  $('.color-description').text(data.status.description);
  // appends the status indicator as a class name so we can use the right color for the status light thing
  $('.color-dot').addClass(data.status.indicator);
}
});
</script>




	