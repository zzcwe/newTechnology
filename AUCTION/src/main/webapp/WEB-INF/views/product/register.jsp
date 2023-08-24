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
#intro{
	height: 300px; overflow: scroll; text-align: left;
}

.container3{
   height: 1500px;
}
.container3-box1{
    font-size: 13px; color: #28a745; margin: 30px 0 50px 0;
}
.container3-box1-box{
    width: 1000px; margin-left: auto; margin-right: auto;
}
.container3-box1-row:first-child {
    padding-left: 20px;
}
.fa-house{
    margin-left: -20px; width: 20px;
}
.container3-box1-row > a{ 
    color: #337ab7; text-decoration: none; background-color: transparent;
}
.fcBlue{
    color: #114da5 !important;
}
strong{
    font-weight: bold;
}
/* 2번 카테고리 선택 */
.container3-box2::after{
    clear: both; content: ''; display: block;
}
.container3-box2-box{
    width: 1000px; margin-left: auto; margin-right: auto;
}
.containerbox2-category, container-box3-category{
    margin-top: 10px !important;
}

h3{
    font-size: 24px;
}
.container-box2-list{
    margin-left: -5px; margin-right: -5px; margin-top: 20px;
}
.container-box2-list > div{
    float: left; width: 23%; padding: 0 10px;
}
.container-box2-list > div > select{
    width: 100%; font-size: 14px; padding: 0;
}
.form-control{
    display: block; width: 100%; height: 34px; padding: 6px 12px; font-size: 14px;
    line-height: 1.42857143; color: #555; background-color: #fff; background-image: none;
    border: 1px solid #dbdbdb; vertical-align: baseline;
}
.container-box2-list > div > select option{
    padding: 10px 15px; word-break: break-all;
}
option {
    font-weight: normal; display: block; white-space: nowrap; min-height: 1.2em; padding: 0px 2px 1px;
}
.container-box2-list::after{
    clear: both; content: ''; display: block; 
}
/* 3번 물품 정보 */
.container3-box3-box{
    width: 1000px; margin-left: auto; margin-right: auto; margin-top: 40px !important;
}
table{
    background-color: transparent;
}
table{
    border-spacing: 0; border-collapse: collapse;
}
table{
    display: table; border-collapse: separate; box-sizing: border-box;
    text-indent: initial; border-spacing: 2px; border-color: grey;
}
colgroup {
    display: table-column-group;
}
col{
    display: table-column;
}
tbody {
    display: table-row-group; vertical-align: middle; border-color: inherit;
}
tr{
    display: table-row; vertical-align: inherit; border-color: inherit;
}
button, input, optgroup, select, textarea {
    margin: 0; font: inherit; color: inherit;
}
* {
    -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;
}
.container3-box3-th {
    background: #f8f8f8; color: #444444; font-weight: bold; height: 45px;
    text-align: center; width: 200px; padding: 7px 25px; vertical-align: middle; border-bottom: 1px solid #ddd;
    border-left: 1px solid #ddd; font-size: 15px;
}
.container3-box3-th::before, .container4-box4-th::before {
    content: "* "; color: #28a745; 
}
.container3-box3-td{
    font-size: 14px; padding: 7px 25px; vertical-align: middle; border-bottom: 1px solid #ddd;
    border-left: 1px solid #ddd; height: 45px; border-right: 1px solid #ddd;
}
.container3-box3-th, .container3-box3-td
{
padding: 7px 25px; vertical-align: middle; border-bottom: 1px solid #ddd;
border-left: 1px solid #ddd; height: 45px;
}
.container3-box3-list > table{
    width: 100%; border-top: 1px solid #111 !important;
}
.container3-textarea{
     height: 300px; position: relative; margin: 0; padding: 0; width: 100%;
}
.ct{
     text-align: center; 
}
.container3-box3-bts{
     height: 30px; margin-top: 10px !important;
}
.container3-box3-bts > div::after{
     clear: both; content: ''; display: block; 
}
.select-td{
     width: 450px;
}
/* 첨부 파일 */   
.file-box{
     width : 150px; height : 200px;
     border : 1px solid #ddd; font-size : 50px;
     text-align: center; line-height: 200px; font-weight: 300;
     border-radius: 5px; float: left; cursor: pointer;
}
#image>div::after{
    display: block; content: ''; clear: both;
}
#image [type=file]{
    display: none;
}
#image>div>div{
    float:left; margin-right: 20px;
}
.camera{
     font-size: 30px; margin-top: 80px;
}
.btn-submit{
width: 1000px; margin-left: auto; margin-right: auto; margin-top: 40px !important;
}
.btn-blue{
	background: #28a745; border-radius: 10px; float: right; color: #fff;
	font-size: 15px !important; padding: 10px 16px; width: 10% !important; font-weight: bold;
}
.finish:after{
display: block; content: ''; clear: both;
}
</style>
<body>
<c:if test="${store == null}">		
	<h1 style="text-align: center;">스토어를 먼저 개설해주세요.</h1>
	<div class="container">
	<form action="<c:url value='/create/store'></c:url>" method="post" class="">
		<div class="form-group">
			<label for="id">스토어명:</label>
			<input type="text" class="form-control" id="name" name="st_name" placeholder="스토어명을 입력해주세요.">
		</div>
		<button class="btn btn-outline-success col-12 btn-check-id" type="button">스토어명 중복체크</button>
		<div id="common">
			<div class="form-group">
				<label for="content">내용:</label>
			</div>
			<textarea id="content" name="st_intro"></textarea>
		</div>
		
			<input type="hidden" class="form-control" id="" name="st_me_id" value="${user.getMe_id()}">

		<button class="btn btn-outline-success col-12">스토어 개설하기</button>
	</form>
</div>
</c:if>
<c:if test="${store != null}">		
<div class="finish">
	<form action="<c:url value='/product/register'></c:url>" method="post" class="form2" enctype="multipart/form-data">
	 	<div class="container3">
			<div class="container3-box1">
				<div class="container3-box1-box">
					<div class="container3-box1-title">
							<h2>물품등록</h2>
					</div>	
				</div>
			</div>
			<div class="container3-box2">
				<div class="container3-box2-box">
					<div class="container-box2-category">
						<h3 class="subTitle-h3">카테고리 선택</h3>
					</div>
					<div class="container-box2-list">
						<div>
							<select class="form-control" id="category1" size="6" style="height:250px;" name="">
                               <c:forEach items="${largeCategory}" var="l" varStatus="vs">
									<option value="${l.plc_num}">${l.plc_name}</option>
								</c:forEach>
							</select>
						</div>
						<div>
	                        <select class="form-control" id="category2" size="6" style="height:250px; display: none;" onchange="changeRemove()" name="">
	                            
	                    	</select>
						</div>
						<div>
	                        <select class="form-control" id="category3" size="6" style="height: 250px; display: none;" name="">
	                  			
	                        </select>
						</div>
	                    <div>
	                        <select class="form-control" id="category4" size="6" style="height: 250px; display: none;" name="pr_pc_num">
	                            
	                        </select>
						</div>
					</div>	
				</div>    
			</div>
		    <div class="container3-box3">
		    	 <div class="container3-box3-box">
		    	 	<div class="container-box3-category">
	                    <h3 class="subTitle-h3">물품 정보</h3>
	                </div>
	                <div class="container3-box3-list">
                		<table>
               				<tr>
								<td class="container3-box3-th">상품명</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control" id="name" name="pr_name">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품소개</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="intro" name="pr_intro">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품상태</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="condition" name="pr_condition">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상세정보</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="detail" name="pr_detail">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품위치</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="location" name="pr_location">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">반품수용여부</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="refund_ok" name="pr_refund_ok">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">반품수용기간</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="refund_date" name="pr_refund_date">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">환불가능조건</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="refundreason" name="pr_refund_reason">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">경매시작가격</td>
								<td colspan="2" class="container3-box3-td">
										<input type="number" class="form-control"  id="start_price" name="pr_start_price">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">원산지</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="origin" name="pr_origin">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품크기</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="size" name="pr_size">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">이미지</td>
                                <td colspan="3" class="container3-box3-td">
                                    <div id="image">
                                        <div class="form-group mt-3">
                                            <div>
                                                <div class="file-box"><i class="fa-solid fa-camera camera"></i></div>
                                                <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
                                                <img class="preview" height="200" width="auto">
                                            </div>
                                            <div>
                                                <div class="file-box"><i class="fa-solid fa-camera camera"></i></div>
                                                <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
                                                <img class="preview" height="200" width="auto">
                                            </div>
                                            <div>
                                                <div class="file-box"><i class="fa-solid fa-camera camera"></i></div>
                                                <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
                                                <img class="preview" height="200" width="auto">
                                            </div>
                                        </div>
                                    </div> 
                           	 	</td>
							</tr>
						</table>
						<input type="hidden" name="pr_st_num" value="${store.st_num}">
						<div class="btn-submit">
							<button type="submit" class="btn-blue">등록하기</button>			
						</div>
                	</div>	
		    	 </div>   
		    </div>
		</div>
	</form>
</div>
</c:if>
<script src="<c:url value='/resources/js/jquery.validate.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/additional-methods.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/jquery-ui.min.js'></c:url>"></script>
<script src="https://kit.fontawesome.com/e411ce92be.js" crossorigin="anonymous"></script>
<script type="text/javascript">
$('#content').summernote({
	placeholder: '스토어를 소개할 수 있는 글을 써주세요.',
	tabsize: 2,
	height: 400
});

$('.form1').validate({
	rules:{
		st_name : {
			required : true,
			regex : /^[0-9a-zA-Zㄱ-ㅎ가-힣]{2,13}$/
		}
	},
	messages:{
		st_name : {
			required : '필수 항목입니다.',
			regex : '스토어명은 한글과 영어를 이용하여 2~13까지 가능합니다.'
		}
	},
	submitHandler: function(form) {
		if(!idCheck){
			alert('스토어명을 중복체크 하세요.');
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
$('[name=st_name]').change(function(){
	idCheck = false;
});
let idCheck = false;

</script>
<script>
$('.form2').submit(function(){
	
	let pr_pc_num = $('[name=pr_pc_num]').val();
	if(pr_pc_num == null){
		alert('세부 카테고리를 선택해주세요.');
		return false;
	}
	
	let pr_name = $('[name=pr_name]').val();
	if(pr_name.trim().length  == 0){
		alert('상품명을 입력하세요.');
		$('[name=pr_name]').focus();
		return false;
	}
	
	let pr_intro = $('[name=pr_intro]').val();
	if(pr_intro.trim().length  == 0){
		alert('상품소개를 입력하세요.');
		$('[name=pr_intro]').focus();
		return false;
	}
	let pr_condition = $('[name=pr_condition]').val();
	if(pr_condition.trim().length  == 0){
		alert('상품상태를 입력하세요.');
		$('[name=pr_condition]').focus();
		return false;
	}
	let pr_detail = $('[name=pr_detail]').val();
	if(pr_detail.trim().length  == 0){
		alert('상세정보를 입력하세요.');
		$('[name=pr_detail]').focus();
		return false;
	}	
	let pr_location = $('[name=pr_location]').val();
	if(pr_location.trim().length  == 0){
		alert('상품위치를 입력하세요.');
		$('[name=pr_location]').focus();
		return false;
	}
	let pr_refund_ok = $('[name=pr_refund_ok]').val();
	if(pr_refund_ok.trim().length  == 0){
		alert('반품수용여부를 입력하세요.');
		$('[name=pr_refund_ok]').focus();
		return false;
	}
	let pr_refund_date = $('[name=pr_refund_date]').val();
	if(pr_refund_date.trim().length  == 0){
		alert('반품수용기간을 입력하세요.');
		$('[name=pr_refund_date]').focus();
		return false;
	}
	let pr_refund_reason = $('[name=pr_refund_reason]').val();
	if(pr_refund_reason.trim().length  == 0){
		alert('환불가능조건을 입력하세요.');
		$('[name=pr_refund_reason]').focus();
		return false;
	}
	let pr_start_price = $('[name=pr_start_price]').val();
	if(pr_start_price.trim().length  == 0){
		alert('경매시작가격을 입력하세요.');
		$('[name=pr_start_price]').focus();
		return false;
	}
	let pr_origin = $('[name=pr_origin]').val();
	if(pr_origin.trim().length  == 0){
		alert('원산지를 입력하세요.');
		$('[name=pr_origin]').focus();
		return false;
	}
	let pr_size = $('[name=pr_size]').val();
	if(pr_size.trim().length  == 0){
		alert('상품크기를 입력하세요.');
		$('[name=pr_size]').focus();
		return false;
	}
	
	const images = image.querySelectorAll('input[type=file]');
	  let imageSelected = false;
	  
	  for (let i = 0; i < images.length; i++) {
	    if (images[i].files.length > 0) {
	      imageSelected = true;
	      break;
	    }
	  }
	  if (!imageSelected) {
	    alert('이미지를 1개 이상 선택하세요.');
	    return false;
	  }
	  return true;
	
});

	$('.file-box, .preview').click(function(){
	    $(this).siblings('input').click();
	});
	
	function readURL(input){
	    if(!input.files || !input.files[0]){
	        input.nextElementSibling.src ='';
	        input.previousElementSibling.style.display = 'block';
	        return;
	    }
	    let reader = new FileReader();
	    reader.onload = function(e){
	        input.previousElementSibling.style.display = 'none';
	        input.nextElementSibling.src = e.target.result;
	    }
	    reader.readAsDataURL(input.files[0]);
	}
</script>
<script>

    var category1 = document.getElementById("category1");
    var category2 = document.getElementById("category2");
    var category3 = document.getElementById("category3");
    var category4 = document.getElementById("category4");

    category1.addEventListener("change", function() {
    if (this.value == "") {
        category2.style.display = "none";
        category3.style.display = "none";
        category4.style.display = "none";
    } else {
        category2.style.display = "block";
        category3.style.display = "none";
        category4.style.display = "none";
       
        let plcNum = $('#category1').val();
        
        $.ajax({
			type: 'POST',
			url: '<c:url value="/select/middle/category"></c:url>',
			data: JSON.stringify(plcNum),
			dataType:"JSON",
			contentType:"application/json; charset=UTF-8",
			success: function(result){
				let str = '';
				let list = result.middleCategory;
				for(i = 0; i < list.length; i++){
					str +=
					'<option value=' + list[i].pmc_num + '>' + list[i].pmc_name + '</option>'
				}
				$('#category2').html(str);
			},
			error : function () {
				console.log("error");
			}
		});
        
    }
    });
    
    category2.addEventListener("change", function() {
    if (this.value == "") {
        category3.style.display = "none";
    } else {
        category3.style.display = "block";
        
		let pmcNum = $('#category2').val();
        
        $.ajax({
			type: 'POST',
			url: '<c:url value="/select/small/category"></c:url>',
			data: JSON.stringify(pmcNum),
			dataType:"JSON",
			contentType:"application/json; charset=UTF-8",
			success: function(result){
				let str = '';
				let list = result.smallCategory;
				for(i = 0; i < list.length; i++){
					str +=
					'<option value=' + list[i].psc_num + '>' + list[i].psc_name + '</option>'
				}
				$('#category3').html(str);
			},
			error : function () {
				console.log("error");
			}
		});
        
    }
    });
    
    category3.addEventListener("change", function() {
    if (this.value == "") {
        category4.style.display = "none";
    } else {
        category4.style.display = "block";
        
		let pscNum = $('#category3').val();
        
        $.ajax({
			type: 'POST',
			url: '<c:url value="/select/product/category"></c:url>',
			data: JSON.stringify(pscNum),
			dataType:"JSON",
			contentType:"application/json; charset=UTF-8",
			success: function(result){
				let str = '';
				let list = result.productCategory;
				for(i = 0; i < list.length; i++){
					str +=
					'<option value=' + list[i].pc_num + '>' + list[i].pc_name + '</option>'
				}
				$('#category4').html(str);
			},
			error : function () {
				console.log("error");
			}
		});
        
    }
    });
    
    function changeRemove(){
        $('#category4').hide();
    }
</script>
</body>
