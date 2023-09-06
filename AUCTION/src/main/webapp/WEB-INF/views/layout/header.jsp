<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.navbar navbar-expand-sm bg-dark navbar-dark{
width: 100%
}

</style>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- Brand/logo -->
	<a class="navbar-brand" href="<c:url value='/'></c:url>">
		<img src="<c:url value='/resources/img/auction1.jpg'></c:url>" alt="logo" style="width:100px;">
	</a>
	
	<!-- Links -->
	<ul class="navbar-nav">
		<c:if test="${user == null}">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='/signup'></c:url>">회원가입</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='/login'></c:url>">로그인</a>
			</li>
		</c:if>
		<c:if test="${user != null }">
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='#'></c:url>">일반경매</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='/auction/list'></c:url>">실시간경매</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='#'></c:url>">직거래경매</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='#'></c:url>">인원수제한경매</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='#'></c:url>">VIP경매</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='#'></c:url>">역경매</a>
		</li>
		</c:if>
		<c:if test="${user != null }">
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='/product/list'></c:url>">상품리스트</a>
		</li>
		</c:if>
		<c:if test="${user != null }">
		    <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
				  물품/경매 등록
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="<c:url value='/product/register'></c:url>">상품등록</a>
					<a class="dropdown-item" href="<c:url value='/auction/register'></c:url>">경매등록</a>
				</div>
		    </li>
	    </c:if>
		<c:if test="${user != null }">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='/board/list'></c:url>">주소록 등록</a>
			</li>
		</c:if>
		<c:if test="${user != null }">
		<li class="nav-item">
			<a class="nav-link" href="<c:url value='/charge'></c:url>">계좌충전</a>
		</li>
		</c:if>
		<c:if test="${user != null }">
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='/logout'></c:url>">로그아웃</a>
			</li>
		</c:if>
		<c:if test="${user != null && user.me_authority >= 9}">
		    <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
				  관리자 메뉴
				</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="<c:url value='/admin/category'></c:url>">카테고리 관리</a>
					<a class="dropdown-item" href="<c:url value='/admin/membership/level'></c:url>">등급 관리</a>
					<a class="dropdown-item" href="#">입찰단위 관리</a>
				</div>
		    </li>
	    </c:if>
	</ul>
	<c:if test="${user != null }">
		<div style="color: green; margin-left: 15px;">
		${user.getMe_name()}님 환영합니다.
		</div>
	</c:if>
</nav>