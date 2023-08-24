<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<style>
.container{
  height: 100%; width:100%; 
}
.welcome{font:sans-serif; font-weight: bold;}
.w1{font-size: 100px; text-align: center;}
.w2{font-size: 80px; text-align: center;}
</style>
<body>
<div class="container">
<img src="<c:url value='/resources/img/auction3.jpg'></c:url>" alt="logo" style="width:100%; height: 100%; border-radius: 15px">
<h1 class="welcome w1">Welcome!</h1>
<h2 class="welcome w2">Start Auction Right Now!</h2>
</div>
</body>
</html>
