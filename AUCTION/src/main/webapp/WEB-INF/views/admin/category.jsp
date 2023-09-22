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
		<div class="box box1" id="boxOne">
			<h2 style="">상품 대분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/large'></c:url>" method="post" class="form1">
				<div class="form-group">
					<label for="largeCategory">상품 대분류:</label>
					<input type="text" class="form-control" id="largeCategory" name="plc_name" style="width: 400px">
				</div>
				<button class="btn btn-outline-success col-12" style="width: 400px">등록하기</button>
			</form>
			</div>
		<div class="box box2" id="boxTwo">
			<h2 style="">상품 중분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/middle'></c:url>" method="post" class="form2">
				<div class="form-group">
					<label for=largeCategory>상품대분류:</label>
					<select name="pmc_plc_num" id="largeCategory">
					<option>대분류명 선택</option>
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
		<div class="box box3" id="boxThree" style="display: none;">
			<h2 style="">상품 소분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/small'></c:url>" method="post" class="form3">
				<div class="form-group">
					<label for=middleCategory>상품중분류:</label>
					<select name="psc_pmc_num" id="middleCategory">
						
					</select>
				</div>
				<div class="form-group">
					<label for="smallCategory">상품 소분류:</label>
					<input type="text" class="form-control" id="smallCategory" name="psc_name" style="width: 400px">
				</div>
				<button class="btn btn-outline-success col-12" style="width: 400px">등록하기</button>
			</form>
		</div>
		<div class="box box4" id="boxFour" style="display: none;">
			<h2 style="">상품 세분류명 등록하기</h1>
			<form action="<c:url value='/admin/category/final'></c:url>" method="post" class="form4">
				<div class="form-group">
					<label for=smallCategory>상품소분류:</label>
					<select name="pc_psc_num" id="smallCategory">
						
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
			required : true,
			regex : /^[0-9]{1,10}$/
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
			required : true,
			regex : /^[0-9]{1,10}$/
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
			required : true,
			regex : /^[0-9]{1,10}$/
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
	"분류명을 선택해주세요."
);


//대분류명 변경시 대분류명의 밸류값을 받아와서 중분류명의 카테고리명을 새로 AJAX를 통해서 불러옴

var category3 = document.getElementById("boxThree");
var category4 = document.getElementById("boxFour");

$('[name = pmc_plc_num]').change(function(){
		let plcNum = $('[name = pmc_plc_num]').val();
		
		if(plcNum == ""){
			category3.style.display = "none";
			category4.style.display = "none";
		}
		else{
			category3.style.display = "block";
			category4.style.display = "none";
			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/select/middle/category"></c:url>',
				data: JSON.stringify(plcNum),
				dataType:"JSON",
				contentType:"application/json; charset=UTF-8",
				success: function(result){
					let str = '<option>중분류명 선택</option>';
					let list = result.middleCategory;
					for(i = 0; i < list.length; i++){
						str +=
						'<option value=' + list[i].pmc_num + '>' + list[i].pmc_name + '</option>'
					}
					$('[name = psc_pmc_num]').html(str);
				},
				error : function () {
					console.log("error");
				}
			});
		}
	});
	
$('[name = psc_pmc_num]').change(function(){
	let pmcNum = $('[name = psc_pmc_num]').val();
	
	if(pmcNum == ""){
		category4.style.display = "none";
	}
	else{
		category4.style.display = "block";
		
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/select/small/category"></c:url>',
			data: JSON.stringify(pmcNum),
			dataType:"JSON",
			contentType:"application/json; charset=UTF-8",
			success: function(result){
				let str = '<option>소분류명 선택</option>';
				let list = result.smallCategory;
				for(i = 0; i < list.length; i++){
					str +=
					'<option value=' + list[i].psc_num + '>' + list[i].psc_name + '</option>'
				}
				$('[name = pc_psc_num]').html(str);
			},
			error : function () {
				console.log("error");
			}
		});
	}
});	
</script>
</body>
