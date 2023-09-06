<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
<style>
 	.container{
 		height: auto;
 	}
 	.container-h1{
 		margin-top: 40px; margin-bottom: 30px;
 	}
 	.container-table{
 		width: 1200px; height: auto; text-align:  center;
	}
	.product{
		 text-align: center; max-width: 50px; overflow: hidden;
	}
	tbody td{	
		max-width: 80px; overflow: hidden;  white-space: nowrap; text-overflow: ellipsis;
	}
	.m2{
		max-width: 150px; overflow: hidden;  white-space: nowrap; text-overflow: ellipsis;
	} 
</style>       
<div class="container">
	<div class="container-h1">
		<h1>상품 리스트</h1>
	</div>
	<div class="container-table">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품소개</th>
					<th>상품상태</th>
					<th>상세정보</th>
					<th>상품위치</th>
					<th>반품수용여부</th>
					<th>반품수용기간</th>
					<th>환불가능조건</th>
					<th>경매시작가격</th>
					<th>원산지</th>
					<th>물품크기</th>		
				</tr>
			</thead>
			<tbody class="product">
				<c:forEach items="${productList}" var="vo">
					<tr>
	              		<td>
	                		<a href="<c:url value='/product/detail/${vo.pr_code}'></c:url>" class="auction">${vo.pr_code}</a>
	                	</td>
						<td class="m2">${vo.pr_name } </td>
						<td>${vo.pr_intro }</td>
						<td>${vo.pr_condition }</td>
						<td>${vo.pr_detail }</td>
						<td>${vo.pr_location }</td>
						<td>${vo.pr_refund_ok }</td>
						<td>${vo.pr_refund_date }</td>
						<td>${vo.pr_refund_reason }</td>
						<td>${vo.pr_start_price } <span>원</span></td>
						<td>${vo.pr_origin }</td>
						<td>${vo.pr_size }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/product/list?page=${pm.startPage-1}&search=${pm.cri.search}&type=${pm.cir.type}'></c:url>">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
				<li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
					<a class="page-link" href="<c:url value='/product/list?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">${i}</a>
				</li>
			</c:forEach>	
			<c:if test="${pm.next}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/product/list?page=${pm.endPage+1}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
	<div style="text-align: center;">
		<form action="<c:url value='/product/list'></c:url>" method="post" >
			<select name="searchCategory" id="searchCategory" style="height: 30px; border-radius: 10px;">
				<option value="1">상품명
				<option value="2">상품소개
				<option value="3">상품위치
			</select>
			<input name="searchName" id="searchName" style="border-radius: 10px;">
			<button type="submit" class="search_btn" style="border-radius: 10px;">검색</button>
		</form>
	</div>
</div>