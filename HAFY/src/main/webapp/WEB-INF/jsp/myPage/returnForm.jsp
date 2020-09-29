<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">

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
</style>


</head>
<body>

   <form class="needs-validation" action="${pageContext.request.contextPath}/returnRequest" 
   				name="dForm" method="post" enctype="multipart/form-data">
     <div class="col-md-8 order-md-1">
     	<div style="margin-top: 1rem;"> 
     		경매 번호 : ${aucNo }
     		<input type="hidden" class="form-control" name="aucNo" value="${aucNo }" >
     		
     	</div>
    	<div class="row" style="margin-top: .6rem;">
              <div class="col-md-6 mb-3" style="margin-bottom: 0!important;">
<!--                 <label for="lastName">상품명</label> -->
                <input type="text" class="form-control" name="title" placeholder="제목" value="" required autocomplete="off">
                <div class="invalid-feedback">
                  Valid 제목 is required.
                </div>
              </div>
         </div>
         
         <hr>
         

			<div class="form-group">
			
				<input type="file" name="photo">
				<input type="file" name="photo2">
				<input type="file" name="photo3">
<!-- 				<div class="input-group input-file"  name="Fichier1"> -->
<!-- 					<span class="input-group-btn"> -->
<!-- 						<button class="btn btn-default btn-choose" type="button"><i class="fa fa-picture-o fa-lg" aria-hidden="true"></i></button> -->
<!-- 					</span>  -->
<!-- 						<input type="text" class="form-control" -->
<!-- 							placeholder='사진 올리기' /> <span class="input-group-btn"> -->
<!-- 						<button class="btn btn-danger" type="button">삭제</button> -->
<!-- 					</span> -->
<!-- 				</div> -->
			</div>
            <hr>
			<textarea class="form-control" name="detail" placeholder="상세 설명" rows="8"></textarea>

        </div>
        
        		<!-- 매입확정창 -->
<div id="returnModal" class="modal fade"  tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 10rem;">
   <div class="modal-dialog"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-body" style="text-align: center; margin: 1rem;">
           환불요청을 완료하시겠습니까?
         </div>
        
         <div class="modal-footer" style="border-top:0; padding:0; ">
          	<table style="margin-bottom: 0; width: 100%;    border-top: 0.1rem solid rgb(224, 224, 224);">
			<tr>
				<td class="yn" id="yesReturn" data-dismiss="modal" style="border-right: 0.1rem solid rgb(224, 224, 224);">예</td>
				<td class="yn" id="noReturn" data-dismiss="modal" >아니오</td>
			</tr>
		</table>
         </div>
      </div>
   </div>
</div>
        
        <br>
        
    	 <nav class="navbar fixed-top" style=" background:white; color:black; height:3rem; padding: .1rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="javascript:history.go(-1)" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <span  style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;">환불요청</span>
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      		
<!--       		<a href="http://www.naver.com" style="float: right; font-weight: bold; font-size: 1.25rem; color:black;">완료</a> -->
      		<a class="material-ripple" style="float: right; font-weight: bold; font-size: 1.25rem; color:black;"
      			onclick="openReturnModal()">완료</a>
<!--       		<input type="submit" class="form-control" value="완료" style="border:0; float: right; font-weight: bold; font-size: 1.25rem; color:black;" > -->
      			
		</div>
    </nav>
    
     </form>
    
	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>



    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    
	<script type="text/javascript">
	
	  function openReturnModal(aucNo) {
			$("#yesReturn").css("background","white")
		  	$("#noReturn").css("background","white")
//	 	  	$(".modal").modal("show")
		  	$("#returnModal").modal("show")
		  	console.log("환불요청할 경매번호: "+aucNo)
		  	
		  	$("#yesReturn").click(function() {
		  	  	$("#yesReturn").css("background","rgb(224, 224, 224)")
				document.dForm.submit();
		})

		
		$("#noReturn").click(function() {
		  	  	$("#noReturn").css("background","rgb(224, 224, 224)")
				$("#returnModal").modal("hide")
			})
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