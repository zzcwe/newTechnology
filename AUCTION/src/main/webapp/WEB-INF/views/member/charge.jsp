<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/summernote-bs4.min.css'></c:url>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'></c:url>">
<style>
label.error{color:red;}
.btn-default:hover {
	background-color: #28a745;
}
.fa-search:hover {
	color: white;
}
.card-body{
		width: 1000px; height:1000px; margin-left: auto; margin-right: auto; margin-top: 50px;	
}
.card-footer{
	width: 600px; margin-left: auto; margin-right: auto; text-align: center;
}
.form-group{
	float: right;
}
.radio-group{
	display: flex; flex-wrap: wrap;
	}
.img-kakao{
	width:600px;
}
.box-radio-input {
 		float: left; width: 25%; box-sizing: border-box; padding: 10px;
}
.btn-custom{
	margin-top: 20px;	
}
.p{
	margin-top: 10px;	
}	
.form-control{
	width: 100px; height:100px;
}
</style>
<body>
<c:if test="${account == null}">		
	<h1 style="text-align: center;">가상계좌를 먼저 개설해주세요.</h1>
	<div class="container">
	<form action="<c:url value='/create/account'></c:url>" method="post" class="form1">
		<div class="form-group">
			<label for="va_pw">가상계좌 비밀번호:</label>
			<input type="password" class="form-control" id="va_pw" name="va_pw" placeholder="비밀번호를 설정해주세요.">
		</div>
			<input type="hidden" name= va_me_id value="${user.me_id}">
		<button class="btn btn-outline-success col-12">가상계좌 개설하기</button>
	</form>
</div>
</c:if>
<c:if test="${account != null}">		
	<div class="card-body bg-white">
 	<div class="card-footer">
	 	<a href="#">
	 		<img class="img-kakao" style="width: 400px; height: 400px;" src="<c:url value='/resources/img/kakao.jpg'></c:url>" alt="logo">
	 	</a> <br>
		<p style="font-weight: bold" class="p">카카오페이 현재 사용가능</p>
		<div class="radio-group">
			<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="100000"><span>100,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="200000"><span>200,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="500000"><span>500,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="1000000"><span>1,000,000원</span></label>
		</div>
		<p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 1,000,000원 입니다.</p>
		<button type="button" class="btn btn-custom" id="charge_kakao">충 전 하 기</button>
 	</div>
 </div>
</c:if>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$('.form1').validate({
	rules:{
		va_pw : {
			required : true,
			regex : /^[0-9a-zA-Zㄱ-ㅎ가-힣]{2,13}$/
		}
	},
	messages:{
		va_pw : {
			required : '필수 항목입니다.',
			regex : '비밀번호는 한글과 영어를 이용하여 2~13까지 가능합니다.'
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
</script>
<script>
    $('#charge_kakao').click(function () {
        var IMP = window.IMP;
        IMP.init('imp05164517');
        var money = $('input[name="cp_item"]:checked').val();
        const now = new Date();  // 현재 시간을 가져옵니다
        var userId = '${user.getMe_id()}'
        IMP.request_pay({
            pg: 'kakaopay',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '포인트 충전',
            amount: money,
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '수원시 영통구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '충전이 완료되었습니다.';         
                $.ajax({
                    type: "POST", 
                    async: false,
                    url: "<c:url value='/charge/insert'></c:url>",
                    data: {
                    	"ch_amount" : money,
                    	"ch_method" : "kakao",
                    	"ch_charge_date" : now,
                    	"ch_va_me_id" : userId
                   	},
    			    success: function() {
    					window.location.href = "<c:url value='/charge'></c:url>"; 
    					}
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
        });
    });
</script>
</body>
