<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스토어</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
</head>
<style>
.product-intro{
    width: 12%;
    margin-top: 50px;
    margin-left: 10px;
    margin-bottom: 50px;
    border: 2px solid black;
    border-radius: 10px;
    height: 500px;
    float: left;
}
h1{
	color: green;
}
.container{
 		height: auto; 
 	}
 	
.container-table{
		width: 1300px; height: auto; text-align:  center; 
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
<body>
    		
        	<h1>Seller Store</h1>
        	<div class="intro_container">
            <div class="product-intro" style="padding: 1px ;">
                이 곳은 seller회원님의 개인 스토어 입니다.
            </div>
          	</div>
			<div class="container">
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
								<a class="page-link" href="<c:url value='/userStore/${user.getMe_id()}?page=${pm.startPage-1}&search=${pm.cri.search}&type=${pm.cir.type}'></c:url>">이전</a>
							</li>
						</c:if>
						<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
							<li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
								<a class="page-link" href="<c:url value='/userStore/${user.getMe_id()}?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">${i}</a>
							</li>
						</c:forEach>	
						<c:if test="${pm.next}">
							<li class="page-item">
								<a class="page-link" href="<c:url value='/userStore/${user.getMe_id()}?page=${pm.endPage+1}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">다음</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
    
    
    
    <script src="https://code.jquery.com/jquery-latest.min.js"></script><!--제이쿼리를 쓰기 위해 스크립트 참조-->
    
    <script>
        function mouseOver(obj){ //css에서 :hover를 이용해서 표현할 수도 있음.
            obj.style.fontSize = "20px"
            obj.style.fontWeight = "bold"
        }
        function mouseOut(obj){
            obj.style.fontSize =""
            obj.style.fontWeight =""
        }
        function mouseOver1(obj){
            obj.style.fontWeight = "bold"
        }
        function mouseOut1(obj){
            obj.style.fontWeight =""
        }
        function mouseOver2(obj){
            obj.style.color = "grey"
        }
        function mouseOut2(obj){
            obj.style.color =""
        }
    </script>
</body>
</html>