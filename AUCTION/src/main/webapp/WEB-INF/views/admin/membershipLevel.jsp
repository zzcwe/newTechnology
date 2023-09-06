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
		<div class="box" style=" width: 410px;">
			<h2 style="">회원등급 추가하기</h1>
			<form action="<c:url value='/admin/membership/level'></c:url>" method="post" class="form1">
				<div class="form-group">
					<label for="ml_name">등급 이름:</label>
					<input type="text" class="form-control" id="ml_name" name="ml_name" style="width: 400px">
				</div>
				<div class="form-group">
					<label for="ml_expense">수수료:</label>
					<input type="number" class="form-control" id="ml_expense" name="ml_expense" style="width: 400px">
				</div>
				<div class="form-group">
					<label for="ml_up_count">등업 거래횟수:</label>
					<input type="number" class="form-control" id="ml_up_count" name="ml_up_count" style="width: 400px">
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
		ml_name : {
			required : true
		},
		ml_expense : {
			required : true
		},
		ml_up_count : {
			required : true
		}
	},
	messages:{
		ml_name : {
			required : '등급이름을 입력해주세요.'
		},
		ml_expense : {
			required : '수수료(%제외)를 입력해주세요.'
		},
		ml_up_count : {
			required : '등업 거래횟수를 입력해주세요.'
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
</body>
