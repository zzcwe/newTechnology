<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html> 
<html>
<head>
	<title>경매사이트</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="/spring/resources/js/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="<c:url value='/resources/js/summernote-bs4.min.js'></c:url>"></script>
	<!--<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script> -->
</head>
<style>
.tap{margin: 30px 0 10px 0;}	
}
</style>
<body>
	<tiles:insertAttribute name="header"/>
	<div class="tap"></div>
    <tiles:insertAttribute name="body"/>
    <div class="tap"></div>
    <tiles:insertAttribute name="footer" />
</body>
</html>