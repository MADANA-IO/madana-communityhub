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
		class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="components/menu.jsp" />

		<div class="mdl-layout__content content" style="height: 100%">
<div class="mdl-grid mdl-cell mdl-cell--12-col ">
     <h2 style="background-color: #4d7da2;
    height: 50px;width:100%;
    ">News</h2>
</div>

		
				<jsp:include page="medium/Feed.jsp" />
	

		</div>
	</div>

	<jsp:include page="components/footer.jsp" />


</body>
</html>
