<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
label.error{color:red;}
.btn-default:hover {
	background-color: #28a745;
}
.fa-search:hover {
	color: white;
}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'></c:url>">
<div class="container">
	<h1>회원가입</h1>
	<form action="<c:url value='/signup'></c:url>" method="post">
		<div class="form-group">
			<label for="id">아이디:</label>
			<input type="text" class="form-control" id="id" name="me_id">
		</div>
		<button class="btn btn-outline-success col-12 btn-check-id" type="button">아이디 중복체크</button>
		<div class="form-group">
			<label for="pw">비밀번호:</label>
			<input type="password" class="form-control" id="pw" name="me_pw">
		</div>
		<div class="form-group">
			<label for="pw2">비밀번호 확인:</label>
			<input type="password" class="form-control" id="pw2" name="me_pw2">
		</div>
		<div class="form-group">
			<label for="name">이름:</label>
			<input type="text" class="form-control" id="name" name="me_name">
		</div>
		<div class="form-group">
			<label for="email">이메일:</label>
			<input type="text" class="form-control" id="email" name="me_email">
		</div>
		<div class="form-group">
			<label for="phone">휴대전화:</label>
			<input type="text" class="form-control" id="phone" name="me_phone">
		</div>
		<div class="form-group">
			<label for="birthday">생년월일</label>
			<input type="text" class="form-control" id="birthday" name="me_birth">
		</div>
		<div class="form-group">                   
			<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="me_post_num" id="addr1" type="text" readonly="readonly">
  			<button type="button" class="btn btn-default" onclick="execPostCode();" style="border: solid 1px; margin: 0 0 4px 4px; color: #28a745;"><i class="fa fa-search" style="font-style: normal;">우편번호 찾기</i></button>                               
		</div>
		<div class="form-group">
    		<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="me_road_name" id="addr2" type="text" readonly="readonly">
		</div>
		<div class="form-group">
    		<input class="form-control" placeholder="상세주소" name="me_detail_address" id="addr3" type="text">
		</div>
		
		<button class="btn btn-outline-success col-12">회원가입</button>
	</form>
</div>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$('form').validate({
		rules:{
			me_id : {
				required : true,
				regex : /^[a-zA-Z][a-zA-Z0-9!@#$]{4,12}$/
			},
			me_pw : {
				required : true,
				regex : /^[a-zA-Z0-9!@#$]{8,20}$/
			},
			me_pw2 : {
				equalTo : pw
			},
			me_name : {
				required : true,
				regex : /^[a-zA-Zㄱ-ㅎ가-힣]{1,40}$/
			},
			me_email : {
				required : true,
				email : true
			},
			me_phone : {
				required : true,
				regex : /^[0-9]{11}$/
			},
			me_birth : {
				required : true,
				date : true
			},
			me_post_num : {
				required : true
			},
			me_road_name : {
				required : true
			},
			me_detail_address : {
				required : true,
				regex : /^[0-9a-zA-Zㄱ-ㅎ가-힣\s]{1,}$/
			}
		},
		messages:{
			me_id : {
				required : '필수 항목입니다.',
				regex : '아이디는 영문자로 시작하며, 영문,숫자,!@#$를 이용하여 5~13까지 가능합니다.'
			},
			me_pw : {
				required : '필수 항목입니다.',
				regex : '비번은 영문,숫자,!@#$를 이용하여 8~20까지 가능합니다.'
			},
			me_pw2 : {
				equalTo : '비번과 일치하지 않습니다.'
			},
			me_name : {
				required : '필수 항목입니다.',
				regex : '이름은 영문과 한글만 가능하며, 40자로 제한됩니다.'
			},
			me_email : {
				required : '필수 항목입니다.',
				email : '이메일 형식이 아닙니다.'
			},
			me_phone : {
				required : '필수 항목입니다.',
				regex : '올바른 휴대전화 형식이 아닙니다.(11개 숫자만 입력해주세요.)'
			},
			me_birth : {
				required : '필수 항목입니다.',
				date : '날짜 형식이 아닙니다.'
			},
			me_post_num : {
				required : '필수 항목입니다.'
			},
			me_road_name : {
				required : '필수 항목입니다.'
			},
			me_detail_address : {
				required : '필수 항목입니다.',
				regex : '올바른 주소형식이 아닙니다.(한글, 영어만 입력해주세요.)'
			}
		},
		submitHandler: function(form) {
			if(!idCheck){
				alert('아이디 중복체크를 하세요.');
				return false;
			}
			return true;
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
	$( function() {
	    $( "#birthday" ).datepicker({
	    	dateFormat : 'yy-mm-dd'
	    });
	});
	$('.btn-check-id').click(function(){
		let me_id = $('[name=me_id]').val();
		let obj = {
				me_id : me_id
		}
		$.ajax({
			async:true,
			type:'POST',
			data: JSON.stringify(obj),
			url: '<c:url value="/check/id"></c:url>',
			dataType:"json",
			contentType:"application/json; charset=UTF-8",
			success : function(data){
			    if(data.res){
			    	alert('사용 가능한 아이디입니다.');
			    	idCheck = true;
			    }else{
			    	alert('이미 사용중인 아이디입니다.')
			    }
			},
			error : function(a,b,c){
				
			}
		});
	});
	$('[name=me_id]').change(function(){
		idCheck = false;
	});
	let idCheck = false;
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
</script>
