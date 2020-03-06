<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<c:if test="${not empty GOOGLEANALYTICS_TRACKINGID}">
<script src="https://www.googletagmanager.com/gtag/js?id=<c:out value="${GOOGLEANALYTICS_TRACKINGID}"/>"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', '<c:out value="${GOOGLEANALYTICS_TRACKINGID}"/>');
</script>
</c:if>