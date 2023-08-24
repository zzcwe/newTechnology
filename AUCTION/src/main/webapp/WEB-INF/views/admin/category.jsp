<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<c:url value='/resources/css/summernote-bs4.min.css'></c:url>" rel="stylesheet">
<style>
label.error{color:red;}
.btn-default:hover {
	background-color: #28a745;
}
.fa-search:hover {
	color: white;
}
#intro{
	height: 300px; overflow: scroll; text-align: left;
}
.container{
	margin-left: 10px; 
}
.box{margin-bottom:10px; border: solid black 1px; padding: 3px; border-radius: 5px;}
.container:after {
	display: block; content: ''; clear: both;
}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.min.css'></c:url>">
<body>
<div class="container">
	<c:if test="${user == null || user.me_authority < 9}">
			<h1 style="text-align: center;">해당 페이지에 권한이 없습니다.</h1>
	</c:if>
	<c:if test="${user != null && user.me_authority >= 9}">
		<div class="box">
			<h2 style="">상품 대분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/large'></c:url>" method="post" class="form1">
				<div class="form-group">
					<label for="largeCategory">상품 대분류:</label>
					<input type="text" class="form-control" id="largeCategory" name="plc_name" style="width: 400px">
				</div>
				<button class="btn btn-outline-success col-12" style="width: 400px">등록하기</button>
			</form>
			</div>
		<div class="box">
			<h2 style="">상품 중분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/middle'></c:url>" method="post" class="form2">
				<div class="form-group">
					<label for=largeCategory>상품대분류:</label>
					<select name="pmc_plc_num" id="largeCategory">
						<c:forEach items="${largeCategory}" var="l" varStatus="vs">
							<option value="${l.plc_num}">${l.plc_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="middleCategory">상품 중분류:</label>
					<input type="text" class="form-control" id="middleCategory" name="pmc_name" style="width: 400px">
				</div>
				<button class="btn btn-outline-success col-12" style="width: 400px">등록하기</button>
			</form>
		</div>
		<div class="box">
			<h2 style="">상품 소분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/small'></c:url>" method="post" class="form3">
				<div class="form-group">
					<label for=middleCategory>상품중분류:</label>
					<select name="psc_pmc_num" id="middleCategory">
						<c:forEach items="${middleCategory}" var="m" varStatus="vs">
							<option value="${m.pmc_num}">${m.pmc_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="smallCategory">상품 소분류:</label>
					<input type="text" class="form-control" id="smallCategory" name="psc_name" style="width: 400px">
				</div>
				<button class="btn btn-outline-success col-12" style="width: 400px">등록하기</button>
			</form>
		</div>
		<div class="box">
			<h2 style="">상품 세분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/final'></c:url>" method="post" class="form4">
				<div class="form-group">
					<label for=smallCategory>상품소분류:</label>
					<select name="pc_psc_num" id="smallCategory">
						<c:forEach items="${smallCategory}" var="s" varStatus="vs">
							<option value="${s.psc_num}">${s.psc_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="finalCategory">상품 세분류:</label>
					<input type="text" class="form-control" id="finalCategory" name="pc_name" style="width: 400px">
				</div>
				<button class="btn btn-outline-success col-12" style="width: 400px">등록하기</button>
			</form>
		</div>
	</c:if>
</div>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
<script type="text/javascript">
$('#content').summernote({
	placeholder: '스토어를 소개할 수 있는 글을 써주세요.',
	tabsize: 2,
	height: 400
});
$('.form1').validate({
	rules:{
		plc_name : {
			required : true
		}
	},
	messages:{
		plc_name : {
			required : '대분류명을 입력해주세요.'
		}
	}
});
$('.form2').validate({
	rules:{
		pmc_plc_num : {
			required : true
		},
		pmc_name : {
			required : true
		}
	},
	messages:{
		pmc_plc_num : {
			required : '대분류명을 먼저 선택해주세요.'
		},
		pmc_name : {
			required : '중분류명을 입력해주세요.'
		}
	}
});
$('.form3').validate({
	rules:{
		psc_pmc_num : {
			required : true
		},
		psc_name : {
			required : true
		}
	},
	messages:{
		psc_pmc_num : {
			required : '중분류명을 먼저 선택해주세요.'
		},
		psc_name : {
			required : '소분류명을 입력해주세요.'
		}
	}
});
$('.form4').validate({
	rules:{
		pc_psc_num : {
			required : true
		},
		pc_name : {
			required : true
		}
	},
	messages:{
		pc_psc_num : {
			required : '소분류명을 먼저 선택해주세요.'
		},
		pc_name : {
			required : '세분류명을 입력해주세요.'
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
$('.btn-check-id').click(function(){
	let st_name = $('[name=st_name]').val();
	let obj = {
			st_name : st_name
	}
	$.ajax({
		async:true,
		type:'POST',
		data: JSON.stringify(obj),
		url: '<c:url value="/check/store"></c:url>',
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
		    if(data.res){
		    	alert('사용 가능한 스토어명입니다.');
		    	idCheck = true;
		    }else{
		    	alert('이미 사용중인 스토어명입니다.')
		    }
		},
		error : function(a,b,c){
			
		}
	});
});

</script>
</body>
