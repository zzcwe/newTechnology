<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<style>
	.form-control{
		width: 500px;, 
	}
	.btn-success{
		margin-top: 20px; margin-bottom: 20px;
	}
	.form-group{
		margin-top: 20px;
	}
	.au_limitbidtime{
		margin-left: 20px;
	}
</style>
<body>
<c:if test="${registerPossibleProductList == null}">		
	<h1 style="text-align: center;">경매등록 가능한 상품이 없습니다.</h1>
</c:if>
<c:if test="${registerPossibleProductList != null}">		
	<div class="container">
		<form action="<c:url value='/auction/register'></c:url>"  method="POST">	
			<div class="form-group">
				<label for="type">경매카테고리</label>
				<select class="form-control" name="au_ac_num" id="type" >
					<option value="0">게시판을 선택하세요.</option>
					<option value="1">일반경매</option>
					<option value="2">실시간경매</option>
					<option value="3">직거래경매</option>
					<option value="4">인원수제한경매</option>
					<option value="5">VIP경매</option>
					<option value="6">역경매</option>
				</select>
			</div>
			<div class="form-group">
				<label for="product">경매상품</label>
				<select class="form-control" name="au_pr_code" id="product">
						<option value="-1">상품을 선택하세요.</option>
					<c:forEach items="${registerPossibleProductList}" var="p" varStatus="vs">
						<option value="${p.pr_code}">${p.pr_name}</option>
					</c:forEach>
				</select>
			</div>	
			<label for="startDate">경매 시작일:</label>
				<input class="form-control" type="datetime-local" id="startDate" name="au_start_date" @bind="@from" @bind:format="yyyy-MM-ddTHH:mm:ss"> <br>	 
			<label for="endDate" id="endDateLabel">경매 종료일:</label>
				<input class="form-control" type="datetime-local" id="endDate" name="au_final_date" @bind="@to" @bind:format="yyyy-MM-ddTHH:mm:ss"> <br>	  
			<label for="calculation">경매 시작가</label>
				<input class="form-control" type="number" id="calculation" name="au_calculation"> <br>	
		 	<label for="immediate">즉시가</label>
				<input class="form-control" type="number" id="immediate" name="au_immediate"> <br>
			<label for="deliveryway">배송방법</label>
				<input class="form-control" type="text" id="deliveryway" name="au_delivery_way" placeholder="택배 or 직거래"> <br>
	 		<div id="limitbidtime" style="display:none">
				입찰제한시간
				<input type="radio" class="au_limitbidtime" id="one" name="au_limit_bid_time" value="15" checked>15초
				<input type="radio" class="au_limitbidtime" id="two" name="au_limit_bid_time" value="30" >30초
				<input type="radio" class="au_limitbidtime" id="three" name="au_limit_bid_time" value="60" >1분	
				<input type="radio" class="au_limitbidtime" id="four" name="au_limit_bid_time" value="120" >2분	
				<input type="radio" class="au_limitbidtime" id="five" name="au_limit_bid_time" value="180" >3분		
			</div>
			<input type="hidden" name="au_me_id" value="${user.me_id}">	
		  	<button type="submit" class="btn btn-success">전송</button>
		</form>
	</div>
</c:if>
</body>
<script>
$(document).ready(function() {
	
	  $("#type").change(function() {
		    var selectedValue = $(this).val();
		    if (selectedValue == "2") {
	    	  $("#limitbidtime").show();
	    	  $("#endDate").hide();
	    	  $("#endDateLabel").hide();
		    } 
		    else {
		      $("#limitbidtime").hide();
		      $("#endDate").show();
		      $("#endDateLabel").show();
		    }
 		});
	  	
});
	$('form').submit(function(){
		let au_ac_num = $('[name=au_ac_num]').val();
		if(au_ac_num  == 0){
			alert('게시판을 선택하세요.');
			$('[name=au_ac_num]').focus();
			return false;
		}
		let au_pr_code = $('[name=au_pr_code]').val();
		if(au_pr_code  == -1){
			alert('상품을 선택하세요.');
			$('[name=au_pr_code]').focus();
			return false;
		}
		let au_start_date = $('[name=au_start_date]').val();
		if(au_start_date  == 0){
			alert('경매 시작일을 선택하세요.');
			$('[name=au_start_date]').focus();
			return false;
		} 
		let au_final_date = $('[name=au_final_date]').val();
		if(au_final_date  == 0 && au_ac_num != 2 ){
			alert('경매 종료일을 선택하세요.');
			$('[name=au_final_date]').focus();
			return false;
		} 
		let au_calculation = $('[name=au_calculation]').val();
		if(au_calculation  == 0){
			alert('경매 시작가를 입력하세요.');
			$('[name=au_calculation]').focus();
			return false;
		}  
		let au_delivery_way = $('[name=au_delivery_way]').val();
		if(au_delivery_way  == 0){
			alert('배송방법을 입력하세요.');
			$('[name=au_delivery_way]').focus();
			return false;
		}
		
	});

	//시작일 input 엘리먼트 가져오기
	const startDateInput = document.getElementById("startDate");
	const now = new Date();
	//시작일 input 값이 변경될 때마다 실행될 함수
	startDateInput.addEventListener("change", function() {
		// 시작일 input 값 가져오기
		const startDate = new Date(startDateInput.value);
		// 시작일이 현재 시간보다 이전인 경우 경고창 표시
		if (startDate < now) {
		 alert("현재 시간보다 빠른 시작일을 선택해주세요.");
		 startDateInput.value = ""; // input 값을 비워서 다시 선택하도록 함
		}
	});
	// 종료일 input 엘리먼트 가져오기
	const endDateInput = document.getElementById("endDate");
	// 시작일 input 값이 변경될 때마다 실행될 함수
	startDateInput.addEventListener("change", function() {
	  checkEndDate();
	});
	// 종료일 input 값이 변경될 때마다 실행될 함수
	endDateInput.addEventListener("change", function() {
	  checkEndDate();
	});
	// 시작일과 종료일을 비교하여 경고창을 표시하는 함수
	function checkEndDate() {
	  const startDate = new Date(startDateInput.value);
	  const endDate = new Date(endDateInput.value);
	  if (endDate < startDate) {
	    alert("경매 종료일을 경매 시작일보다 뒤로 설정해주세요.");
	    endDateInput.value = ""; // input 값을 비워서 다시 선택하도록 함
	  }
	}
</script>
