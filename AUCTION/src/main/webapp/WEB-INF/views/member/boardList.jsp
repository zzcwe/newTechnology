<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

 
<style>
 	.container{
 		height: 1000px;
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
	 .modal_layer5 .modal_content3 {
        display: block;
        width:600px;
        height: 650px;
        background:#fff;
        border:1px solid #666;
        box-sizing: border-box;
        border-radius: 20px;
        overflow: hidden;
        padding: 30px; opacity: 0.9;
    }
    .modal_layer {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
        height: 100%;
        background:rgba(0, 0, 0, 0.5);
        z-index:1;
    }
    #modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index:2;
    }
    #modal_close_btn5{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 30px; font-weight: bold; cursor: pointer;
        border-radius: 5px;
    }
    #modal_confirm_btn5{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 30px; font-weight: bold; cursor: pointer;
        border-radius: 5px;
    }
</style>       
<div class="container">
	<div class="container-h1">
		<h1>배송지 리스트</h1>
	</div>
	<form action="<c:url value='/board/delete'></c:url>" method="post" class="board_delete">
	<div class="container-table">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>배송지명</th>
					<th>도로명 주소</th>
					<th>상세주소</th>		
				</tr>
			</thead>
			<tbody class="board">
				<c:forEach items="${boardList}" var="bl" varStatus="vs">
					<tr>
	              		<td>
	                		<input type="checkbox" id="delivery_num" name="bl_num" value="${bl.bl_num}">
					        	${bl.bl_name}
	                	</td>
	                	<td class="m2">${bl.bl_road_name} </td>
						<td class="m3">${bl.bl_detail_address} </td>
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
		<button type="button" class="plus_btn" style="border-radius: 10px;" id="plus_btn">배송지 추가</button>
		<button type="submit" class="delete_btn" style="border-radius: 10px;">배송지 삭제</button>
	</div>
	</form>
</div>
<form action="<c:url value='/board/plus'></c:url>" method="post" class="board_plus">
        <div class="modal_layer modal_layer5">
            <div id="modal">
                <div class="modal_content3">
                		<div class="form-group">
				    		<input class="form-control" style="top: 5px;" placeholder="배송지명" name="bl_name"  type="text">
						</div>
                        <div class="form-group">                   
							<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="bl_post_num" id="addr1" type="text" readonly="readonly">
				  			<button type="button" class="btn btn-default" onclick="execPostCode();" style="border: solid 1px; margin: 0 0 4px 4px; color: #28a745;"><i class="fa fa-search" style="font-style: normal;">우편번호 찾기</i></button>                               
						</div>
						<div class="form-group">
				    		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="bl_road_name" id="addr2" type="text" readonly="readonly">
						</div>
						<div class="form-group">
				    		<input class="form-control" placeholder="상세주소" name="bl_detail_address" id="addr3" type="text">
						</div>
                        <input type="hidden" name="bl_me_id" value="${user.me_id}">
                        <button type="button" id="modal_close_btn5" class="close_btn2">닫기</button>
                		<button type="submit" id="modal_confirm_btn5" class="confirm_btn2">저장</button>
                </div>
            </div>
        </div>
</form>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/e411ce92be.js" crossorigin="anonymous"></script>
<script>
$('.board_plus').validate({
		rules:{
			bl_name : {
				required : true
			},
			bl_post_num : {
				required : true
			},
			bl_road_name : {
				required : true
			},
			bl_detail_address : {
				required : true,
				regex : /^[0-9a-zA-Zㄱ-ㅎ가-힣\s]{1,}$/
			}
		},
		messages:{
			bl_name : {
				required : '필수 항목입니다.'
			},
			bl_post_num : {
				required : '필수 항목입니다.'
			},
			bl_road_name : {
				required : '필수 항목입니다.'
			},
			bl_detail_address : {
				required : '필수 항목입니다.',
				regex : '올바른 주소형식이 아닙니다.(한글, 영어만 입력해주세요.)'
			}
		}
});
$.validator.addMethod(
		"regex",
		function(value, element, regexp) {
			var re = new RegExp(regexp);
			return this.optional(element) || re.test(value);
		},
		"Please check your input."
);
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr2').value = fullRoadAddr;
           
           console.log(data.zonecode);
           
           console.log(fullRoadAddr);
           
           console.log(document.getElementById('addr2').value);
           
       }
    }).open();
}
$(function(){
    const modal1 = document.querySelector('.modal_layer5')
    function modalOn() {
    modal1.style.display = "flex"
    }
    function modalOff1() {
    modal1.style.display = "none"
    }
    
    const btnModal = document.getElementById("plus_btn")
    btnModal.addEventListener("click", e => {
        modalOn()
    })
    const closeBtn = modal1.querySelector("#modal_close_btn5")
    closeBtn.addEventListener("click", e => {
        modalOff1()
    })
    /*const closeBtn1 = modal1.querySelector("#modal_confirm_btn5")
    closeBtn1.addEventListener("click", e => {
        modalOff1()
        alert("주소가 저장되었습니다.")
    })*/
})
$('.board_delete').submit(function(){
	
	if(!boardCheck){
		alert('삭제할 배송지명을 선택해주세요.');
		return false;
	}
})
$('[name=bl_num]').change(function(){
	boardCheck = true;
});
let boardCheck = false;
</script>