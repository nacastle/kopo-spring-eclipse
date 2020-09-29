<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
<!-- 	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->
<!-- 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"  -->
<!--         type="text/javascript" language="javascript"> </script> -->
<%--     <script src="${pageContext.request.contextPath }/resources/multiFile/jquery.MultiFile.min.js"></script> --%>

<style type="text/css">
a {
	text-decoration: none !important;
}

body {
	min-height: 0;
	padding-top: 3.2rem;
	padding-bottom: 4rem;
}

.na-nav {
	position: fixed;
	left: 0;
	top: 2.7rem;
	width: 100%;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, .5);
}

.na-nav div {
	position: relative;
	display: flex;
	width: 100%;
	margin: 0 auto;
}

.na-nav div a {
	flex: 1;
	display: block;
	height: 40px;
	line-height: 40px;
	text-align: center;
	color: #8f8f8f;
	font-weight: bold;
}

.na-nav div a.top-on {
	color: #000;
}

.na-nav div>span {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 50%;
	height: 3px;
	background: #27b2a5;
	opacity: 0;
	transition: all .5s;
}

.na-nav div a:nth-child(1).top-on ~ span {
	left: 0;
	opacity: 1;
}

.na-nav div a:nth-child(2).top-on ~ span {
	left: 50%;
	opacity: 1;
}
/* nav div a:nth-child(3).on ~ span {	left: 200px; opacity: 1;} */
/* nav div a:nth-child(4).on ~ span {	left: 300px; opacity: 1;} */
/* nav div a:nth-child(5).on ~ span {	left: 400px; opacity: 1;} */
.na-nav2 a {
	font-size: 0.7rem;
	width: 20%;
	color: black;
	text-align: center;
	padding: .3rem !important;
}

.na-nav2 i {
	margin-bottom: 0.3rem;
}

.na-nav2 a.bottom-on {
	color: white;
}

.table {
	margin-bottom: 2.9rem;
}

.table td, .table th {
	padding-left: 3%;
	vertical-align: middle;
	border-top: 1px solid #dee2e6;
}

table th {
	width: 40%;
	height: 5rem;
	padding-left: 3%;
	vertical-align: middle;
	padding: 0;
}

table th img {
	max-width: 100%;
	max-height: 100%;
}

hr {
	width: 90vw
}

label {
	margin: 0;
}

input[type="datetime-local"]::before {
	color: #999999;
	content: attr(placeholder);
}

input[type="datetime-local"] {
	color: #ffffff;
}

input[type="datetime-local"]:focus, input[type="datetime-local"]:valid {
	color: #666666;
}

input[type="datetime-local"]:focus::before, input[type="datetime-local"]:valid::before
	{
	content: "" !important;
}


.col-md-6 {
	flex: none;
	max-width: 100%;
}

.yn {
 	width: 50%; 
/* 	border: 0.1rem solid rgb(224, 224, 224); */
	text-align: center;
	padding: 0;
	font-size: 1rem;
	height: 2.4rem;
/* 	float: left; */
}
/* .preview_img{ */
/*   width: 50px; */
/*   height: 50px; */
/*   margin-right: .2rem; */
/* } */

#imgPreview img {
	width: 4rem;
	height: 4rem;
  margin-right: .3rem;
}



</style>




</head>
<body>

   <form class="needs-validation" action="${pageContext.request.contextPath}/displayLoading" 
   				name="dForm" method="post" enctype="multipart/form-data">
     <div class="col-md-8 order-md-1">
          <h5 class="mb-3"> </h5>
            <div class="row">
              <div class="col-md-6 mb-3" style="margin-bottom: 0!important;">
                <label for="firstName" style="color: rgb(158, 158, 158);">입찰방식</label>
                &nbsp;&nbsp;&nbsp;
                <label class="radio-inline">
				  <input type="radio" name="method" id="methodOpen" value="공개"> 공개 입찰
				</label>
				&nbsp;
				<label class="radio-inline">
	  				<input type="radio" name="method" id="methodClosed" value="비공개"> 비공개 입찰
				</label>
                <div class="invalid-feedback">
                  Valid 입찰방식 체크 is required.
                </div>
              </div>
              </div>
<!--              </div> -->
              <hr>
<!--               </div> -->

			
				<input id="photos" type="file"  multiple="multiple" maxlength="5" style="display: none;" name="photos" accept="image/*" > 
				 <div>
				 <label class="material-ripple" style="overflow: unset;" for="photos" onclick="{photos.click}">
    				<i  class="fa fa-camera-retro fa-3x" style='margin-left:1rem; color:darkgray; cursor:pointer' aria-hidden="true"></i>
    			</label>
    				<span style="position:absolute; margin-top:.6rem; margin-left:.6rem; "> 상품 이미지를 업로드해주세요.</span>
 				</div>
 				   			
				<div id="imgPreview" style=" background:rgb(230, 230, 230); border:.1rem solid rgb(200, 200, 200);  display:none; padding:.3rem; margin-top: .3rem;"></div>
				<i id="deleteAll" onclick="deleteAllFiles()" class="fa fa-times fa-2x" style="margin-left:.6rem; display: none" aria-hidden="true"></i>

<!-- <input id="myInput" type="file" style="display:none" onchange="myFunc.onFileSelect(event)" multiple="multiple"> -->
<!--     <label for="myInput" onclick="{myInput.click}"> -->
<!--     <i class="fa fa-camera-retro fa-3x" style='margin-right:1rem; cursor:pointer' aria-hidden="true"></i> -->
<!--     </label> -->
<!--     <div class="results" style="display: inline-block;"> -->
    
<!-- 				<input type="file" name="photo2"> <i onclick="cancelFile2()" class="fa fa-times" aria-hidden="true"></i> -->
<!-- 				<input type="file" name="photo3"> <i onclick="cancelFile3()" class="fa fa-times" aria-hidden="true"></i> -->
<!-- 				<div class="input-group input-file"  name="Fichier1"> -->
<!-- 					<span class="input-group-btn"> -->
<!-- 						<button class="btn btn-default btn-choose" type="button"><i class="fa fa-picture-o fa-lg" aria-hidden="true"></i></button> -->
<!-- 					</span>  -->
<!-- 						<input type="text" class="form-control" -->
<!-- 							placeholder='사진 올리기' /> <span class="input-group-btn"> -->
<!-- 						<button class="btn btn-danger" type="button">삭제</button> -->
<!-- 					</span> -->
<!-- 				</div> -->
			
			<hr>


			<div class="row">
              <div class="col-md-6 mb-3" style="margin-bottom: 0!important;">
<!--                 <label for="lastName">상품명</label> -->
                <input type="text" class="form-control" name="name" id="lastName" placeholder="상품명" value="" required autocomplete="off">
                <div class="invalid-feedback">
                  Valid 상품명 is required.
                </div>
              </div>
            </div>
            <hr>

			<select class="selectpicker" name="category" title="카테고리">
					<option>---------------------</option>
				<c:forEach items="${goodsCategory }" var="category" begin="2">
					<option value="${category.uriName }">${category.codeName }</option>
				</c:forEach>
			</select>
			<hr>

			<div class="input-group">
<!-- 				<span class="input-group-addon">\</span>  -->
			  <input type="number" class="form-control" style="width: 90%;" name="startPrice" placeholder="경매 시작가"> &nbsp;&nbsp;
				<span style="margin-top: 1rem;">원</span>
			</div>
			
			<hr>
			
			<input type="datetime-local" class="form-control" name="startDate" style="margin-bottom: 0.5rem;" placeholder="경매 시작일시" required="required">
			<input type="datetime-local" class="form-control" name="endDate" style="margin-bottom: 0.5rem;" placeholder="경매 마감일시" required="required">
			
            <hr>

			<textarea class="form-control" name="detail" placeholder="상품 상세 설명" rows="5"></textarea>

        </div>
        
        <br>
        
    	 <nav class="navbar fixed-top" style=" background:white; color:black; height:3rem; padding: .1rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/hot" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <span  style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;">출품하기</span>
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      		
<!--       		<a href="http://www.naver.com" style="float: right; font-weight: bold; font-size: 1.25rem; color:black;">완료</a> -->
      		<a class="material-ripple" data-color="27b2a5"; style="float: right; font-weight: bold; font-size: 1.25rem; color:black;"
      			onclick="openSubmitModal()">완료</a>
<!--       		<input type="submit" class="form-control" value="완료" style="border:0; float: right; font-weight: bold; font-size: 1.25rem; color:black;" > -->
      			
		</div>
    </nav>
    </div>
     </form>
     
     <!-- 	마감 알림시간 설정완료 안내 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 10rem;">
   <div class="modal-dialog"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-body" style="text-align: center; margin: 1rem;">
            경매 출품을 완료하시겠습니까?
         </div>
        
         <div class="modal-footer" style="border-top:0; padding:0; ">
          		<table style="margin-bottom: 0; width: 100%;">
			<tr style="border-top: 0.1rem solid rgb(224, 224, 224);">
				<td class="yn material-ripple" id="yes" onclick="submit()" data-dismiss="modal" style="width:50%; border-right: 0.1rem solid rgb(224, 224, 224);">예</td>
				<td class="yn material-ripple" id="no" data-dismiss="modal" style="width:50%;" onclick="no()">아니오</td>
			</tr>
		</table>
         </div>
      </div>
   </div>
</div>
    
	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>



    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    
    
	<script type="text/javascript">
	
// 	var uploadPhotos = [];

// $('#photos').fileupload({
// maxNumberOfFiles: 6
// });
	
	$("#photos").change(function(event) {
		
		$("#deleteAll").show()
		$("#imgPreview").show()
		$("#imgPreview").css("display","inline-block")
		var imgFiles = event.target.files
		
// 		for (var i = 0; i < imgFiles.length; i++) {
		for (var image of event.target.files) {

// 			uploadPhotos.push(imgFiles[i])
			
			var reader = new FileReader();
			
			reader.onload = function(event) { 
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result);
				
// 				img.addEventListener('click',function(){
// 				img.remove();
// // 				uploadPhotos.splice(i-1,1)
// 		           })

				document.querySelector("#imgPreview").appendChild(img); 
				};
				
				reader.readAsDataURL(image);
		}

	})
	
	function deleteAllFiles() {
		$("#photos").val("")
		$("#imgPreview").html("")
		$("#deleteAll").hide()
		$("#imgPreview").hide()
		
		
		
	}
	
	
// 	$("#photo").change(function(event) {
// 		console.log(event.currentTarget)
// 		console.log(event)
// 		console.log(event.currentTarget.files)
		
// 		for (var i = 0; i < event.currentTarget.files.length; i++) {
			
// 			var reader = new FileReader();
			
// 			reader.onload = function(event) { 
// 				var img = document.createElement("img"); 
// 				img.setAttribute("src", event.target.result); 
// 				document.querySelector("div#image_container").appendChild(img); 
// 				};


// 			console.log(event.currentTarget.files[i].name)
// 			$("#uploadFile").append(event.currentTarget.files[i].name + '<i id="close' +i + '" class="close fa fa-times" style="float:right; margin-right:1.4rem;" aria-hidden="true"></i>' + "<br>")

// 			$('#close' + i ).click(function() {
// 			console.log("close" + i + "클릭 성공")
			
// 			})
// 		}

// 	})
	
// 			imgCnt = $(".close").length
// 		console.log("upload 개수: " + imgCnt);
		
// 		for (var i = 0; i < imgCnt; i++) {
// 			$('#close' + i ).click(function() {
// 			console.log("close" + i + "클릭 성공")
		
// 			})
		
// 	}
// 	var imgCnt;
	function openSubmitModal() {
		$(".modal").modal("show")
		
	}
	
	function submit() {
		document.dForm.submit();
		
	}
	 function no() {
	    	$(".modal").modal("hide")
		}
	
	
		$('.na-nav a').on('click', function() {
			$(this).addClass('top-on');
			$(this).siblings().removeClass('top-on');
		});
		$('.na-nav2 a').on('click', function() {
			$(this).addClass('bottom-on');
			$(this).siblings().removeClass('bottom-on');
		});
	</script>    
</body>
</html>