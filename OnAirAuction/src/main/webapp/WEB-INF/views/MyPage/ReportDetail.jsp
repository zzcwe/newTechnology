<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="<c:url value='/resources/css/summernote-bs4.css'></c:url>" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="<c:url value='/resources/js/summernote-bs4.js'></c:url>"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<style>

	.body{
        height: 700px; width: 1900px;
	}
	.body .body-left{
		float:left; width: 250px; height:700px; border-right: 1px solid black;
	}
	.body .body-left .nav-ul{
		margin-top: 5px;
	}
    .body .body-left .nav-ul .list-li:nth-child(1){
        width: 250px; height: 180px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(2){
        width: 250px; height: 120px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(3){
        width: 250px; height: 90px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(4){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(5){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(6){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold;
    }
	.body .body-left .nav-ul .list-li .item-a{
		display: inline-block; padding-top: 2px; color:black; margin-top: 6px; font-weight: normal;
	}
    .body .body-middle{
		float:left; width: 1400px; height: 700px; border-right: 1px solid black;
	}
    .swiper {
        width: 100%; height: 200px;
    }
    .swiper-slide {
        text-align: center; font-size: 18px; background: #fff; display: flex; justify-content: center; align-items: center;
    }
    .swiper-slide2 img {
        display: block; width: 100%; height: 100%; object-fit: cover;
    }
    .body .body-middle .btn-list{
        margin-top: 50px; margin-left: 600px;
    }
    .body .body-middle button{
        margin-left: 50px; 
    }
    
</style>

<!-- 문의 사항 상세 보기 -->

<div class="body">
        <div class="body-left">		
			<ul class="nav-ul">		
				<li class="list-li">구매자<br>
					<a href="<c:url value='/MyPage/participateAuctionList'></c:url>" class="item-a">경매 참가 내역</a><br>
                    <a href="<c:url value='/MyPage/heldAuctionList'></c:url>" class="item-a">경매 개최 내역</a><br>
                    <a href="<c:url value='/MyPage/OrderAuctionList'></c:url>" class="item-a">주문 내역</a><br>
                    <a href="<c:url value='/MyPage/RefundList'></c:url>" class="item-a">환불 내역</a>
				</li>
				<li class="list-li">판매자<br>
					<a href="<c:url value='/MyPage/participateAuctionList'></c:url>" class="item-a">경매 참가 내역</a><br>
                    <a href="<c:url value='/MyPage/heldAuctionList'></c:url>" class="item-a">경매 개최 내역</a><br>
				</li>	
				<li class="list-li">후기<br>
					<a href="<c:url value='/MyPage/ReviewInsert'></c:url>" class="item-a">후기 작성</a><br>
                    <a href="<c:url value='/MyPage/ReviewList'></c:url>" class="item-a">후기 조회</a>	
				</li>	
				<li class="list-li">신고<br>
					<a href="<c:url value='/MyPage/ReportInsert'></c:url>" class="item-a">신고 작성</a><br>
                    <a href="<c:url value='/MyPage/ReportList'></c:url>" class="item-a">신고 조회</a>	
				</li>	
				<li class="list-li">문의 사항<br>	
					<a href="<c:url value='/MyPage/InquiryInsert'></c:url>" class="item-a">문의 사항 등록</a><br>
                    <a href="<c:url value='/MyPage/InquiryList'></c:url>" class="item-a">문의 사항 조회</a>
				</li>
				<li class="list-li">회원<br>
					<a href="<c:url value='/MyPage/MemberUpdate/${user.me_id}'></c:url>" class="item-a">회원 정보 수정</a><br>
				</li>
			</ul>		
		</div>
        <div class="body-middle">
                <div class="selectProduct">
                	<label for="productName">신고자</label>
                	<div class="form-control">${report.re_me_id}</div>
                </div>
                <div class="form-group">
                    <label for="title">내용</label>
                    <div class="form-control">${report.re_content}</div>
                </div>
                <c:if test="${report.re_report_id != null}">
                	<div class="form-group">
                    	<label>신고 당한 사람</label>
                    	<div class="form-control">${report.re_report_id}</div>
                	</div>
                </c:if>
                <c:if test="${report.re_report_id == null}">
                	<div class="form-group">
                    	<label>제품 명</label>
                    	<div class="form-control">${report.pr_name}</div>
                	</div>
                </c:if>
                <div class="form-group">
                    <label for="title">신고일</label>
                    <div class="form-control">${report.re_date_str}</div>
                </div>
                
                <div id="image" style="margin-left: 10px;">
			<div class="form-group mt-3">
				<label>이미지</label>
				<div class="swiper mySwiper">
				  <div class="swiper-wrapper">
				  		<c:forEach items="${files}" var="file">
				  		<div class="swiper-slide">
							<img src="<c:url value='/download${file.fi_save_name}'></c:url>" height="200" width="auto">
						</div>
						</c:forEach>
				  </div>
				  <div class="swiper-button-next"></div>
				  <div class="swiper-button-prev"></div>
				  <div class="swiper-pagination"></div>
				</div>
			</div>
			</div>
			
				<div class="btn-list">
            		<a href="<c:url value='/MyPage/ReportUpdate/${report.re_num}'></c:url>">
						<button class="btn btn-outline-primary btn-update">수정</button>
					</a>
					<a href="<c:url value='/MyPage/ReportDelete/${report.re_num}'></c:url>">
						<button class="btn btn-outline-primary btn-delete">삭제</button>
					</a>
            	</div>
            
       </div>
      </div>
      
	<script>
	
	
	var swiper = new Swiper(".mySwiper", {
		  navigation: {
		    nextEl: ".swiper-button-next",
		    prevEl: ".swiper-button-prev"
		  },
		  pagination: {
		      el: ".swiper-pagination",
		  },
		  loop: true,
		});
	
	</script>