<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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

.na-nav2 {
	height: 3rem;

}

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

 
/* .table { */
/* 	margin-bottom: 2.9rem; */
/* } */


/*
.table td, .table th {
    padding-left: 3%;
    vertical-align: middle;
    border-top: 1px solid #dee2e6;
}

 */
 
 .na-content {
 margin: 1rem 1rem;
/*  text-align: center; */
 display: flow-root;
 
 }
 
 table {
 	font-size: 0.8rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
	border-collapse: unset;
	border-top: 0.1rem solid rgb(224, 224, 224);
	margin-bottom: 1rem;
	border-collapse: collapse;
	
 
 }
 
 .ttitle {
     margin-left: 4%;
     font-weight: bold;
 }
 
 
 table th {
	width: 27%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: center;
	vertical-align: middle;
 	padding: 0.1rem;
/*  	border: 0; */
	background: rgb(22, 160, 133);
	color: white;
}
 table td {
/* 	width: 73%; */
	height: 2rem;
  	padding-left: 7%;  
	text-align: left;
	vertical-align: middle;
/*  	padding: 0.1rem; */
/*  	padding-left: 0.5rem; */
 	border-bottom: 0.1rem solid rgb(224, 224, 224);
/*  	border: 0; */
/* 	background: rgb(224, 224, 224); */
}

/* 
table th img {
	max-width: 100%;
	max-height: 100%;
} */

  hr { width: 90vw  }   
 
 label { margin: 0; }
 
/*  input[type="date"]:not(.has-value):before{ */
/*   color: lightgray; */
/*   content: attr(placeholder); */
/* } */

input[type="datetime-local"]::before {
	color: #999999;
	content: attr(placeholder);
}
input[type="datetime-local"] {
	color: #ffffff;
}
input[type="datetime-local"]:focus,
input[type="datetime-local"]:valid {
	color: #666666;
}
input[type="datetime-local"]:focus::before,
input[type="datetime-local"]:valid::before {
	content: "" !important;
}

.modal {
	padding : 0;
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




	<nav class="navbar fixed-top" style=" background:white; color:black; padding: .1rem 1rem; height: 3rem; border-bottom: 0.1rem solid rgb(224, 224, 224) ">
   		<div style="float: left;">
<!--     	  <a href="#" style="color: black; margin-right: -3rem;">출품완료</a> -->
    	  <a  href="#" style="font-size: 1.25rem; position:relative; top:0.2rem; left: 0rem; font-weight: bold; color:black;">MY</a>
  	 	</div>
  	 	
  	 	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      		<a href="#" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a>
		</div>
    </nav>



	<div class="na-content">

		<div style="float: left; font-weight: bold;">

			<i class="fa fa-user-circle fa-4x" style="float: left;"
				aria-hidden="true"></i>
			<div style="float: left; text-align: center; margin-left: 0.4rem; margin-top: 0.5rem;">
				${memberVO.name }<br> (${memberVO.nickname})
			</div>
		</div>

		<div style="float: right; text-align: center;   margin-top: 0.4rem;">
			경매지수<br> <i class="fa fa-star" aria-hidden="true"></i> 4.5 / 5.0
		</div>
	</div>
	
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">
  모달창 연습
</button>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
      </div>
      <div class="modal-body">
        Modal 내용
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>
  

	<div style="margin-top: 1rem;">

		<div class="ttitle">경매</div>
		<table class="table-hover">
			<tr>
				<a href="${pageContext.request.contextPath}"><td>입찰내역</td></a>
			</tr>
			<tr>
				<td>판매내역</td>
			</tr>
			<tr>
				<td>관심경매</td>
			</tr>
		</table>

		<div class="ttitle">상품</div>
		<table class="table-hover">
			<tr>
				<td>낙찰확정</td>
			</tr>
			<tr>
				<td>환불하기</td>
			</tr>
		</table>

		<div class="ttitle">회원</div>
		<table class="table-hover">
			<tr onclick="goMyInfo()">
				<td>회원정보 보기</td>
			</tr>
			<tr onclick="goMyModify()">
				<td>회원정보 수정</td>
			</tr>
			<tr>
				<td>회원탈퇴</td>
			</tr>
			<tr>
				<td data-toggle="modal" data-target="#myModal">로그아웃</td>
			</tr>
		</table>
		
		<!-- 로그아웃 모달창 -->
		                <!-- 모달 창 -->  
		                
		                <div class="modal fade" id="myModal">
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"></div> -->
<!--       <div class="modal-body" onclick="no()" id="no"> -->
<!--         Hello! Webisfree.com -->
<!--       </div> -->
<!--       <a href="#close-modal" rel="modal:close" class="close-modal ">Close</a> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->






<!--      <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" -->
<!--      		style="height: 25%;"> -->
<!--       <div class="modal-dialog" role="document"> -->
<!--          <div class="modal-content" style="text-align: center;"> -->
<!--             <div class="modal-header"> -->
<!--                <h6 class="modal-title" id="exampleModalLabel"><strong>추가 상담 예약</strong></h6> -->
<!--                <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                <button class="close" type="button" data-dismiss="modal" aria-label="Close"> </button> -->
<!--             </div> -->
<!--             <div class="modal-body" id="no" onclick="no()">예약하실 날짜를 선택해주세요</div> -->
<!--             <input type="datetime-local" name="date" style="align-self: center ;width: 20rem" value="reserveDate" > -->
<!--             <hr>     -->
<!--             <div style="text-align: center; margin-bottom: 1.8rem;"> -->
<!--                 <input type="submit" id="enrollmentBtn" class="btn btn-outline-light text-dark" value="접수" style="width: 20%;  align:center;"> -->
<!--                 <input type="button" onclick="closeModal()" class="btn btn-outline-light text-dark" value="취소" style="width: 20%;  align:center;"> -->
<!--             </div> -->
<!--          </div> -->
<!--         </div> -->
<!--         </div> -->
       
       
<!-- 	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" -->
<!-- 		aria-labelledby="myModalLabel" aria-hidden="true" -->
<!-- 		style="height: 25%; text-align: center; font-size: 1rem;"> -->
<!-- 		<div style="margin: 1.4rem 0;">정말 로그아웃 하시겠습니까?</div> -->
<!-- 		<table > -->
<!-- 			<tr> -->
<!-- 				<td class="yn" id="yes" onclick="yes()" style="border-right: 0.1rem solid rgb(224, 224, 224);">예</td> -->
<!-- 				<td class="yn" id="no" onclick="no()">아니오</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</div> -->

		<div class="ttitle">계좌</div>
		<table class="table-hover">
			<tr>
				<td>내 계좌 보기</td>
			</tr>
			<tr>
				<td>계좌 등록</td>
			</tr>
			<tr>
				<td>내 계좌 삭제</td>
			</tr>
		</table>

	</div>

    
	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
      <script type="text/javascript">
      
      
// //   $(".close-modal").hide()
      
//    $('#openLogoutModal').click(function(e){
//    e.preventDefault(); 
// //   $('#logoutModal').modal("show");
//   $('#myModal').modal("show");
//   $(".fade").css("opacity",1)
// });
   
//    function yes() {
// 	  	$("#yes").css("background","rgb(224, 224, 224)")
	   
// 		$('.modal').modal("hide");
// }
   
//    function no() {
// 	  	$("#no").css("background","rgb(224, 224, 224)")
// // 	  	 $("#modal").fadeOut(300);
// // 		$('.modal').modal("hide");
// 		$('#myModal').modal("hide");
// }
// //    function closeModal() {
// // 	   $(".modal").modal("hide")
// // 	}
      
// //       function openLogoutModal() {
// //     	  $("#logoutModal").modal("show")
// // 	}
      
      function goMyInfo() {
    	  location.href = "${pageContext.request.contextPath}/myInfo"
	}
      function goMyModify() {
    	  location.href = "${pageContext.request.contextPath}/myModify"
	}
      
	  $('.na-nav a').on('click',function(){
		 $(this).addClass('top-on');
		 $(this).siblings().removeClass('top-on');
		});
	  $('.na-nav2 a').on('click',function(){
		 $(this).addClass('bottom-on');
		 $(this).siblings().removeClass('bottom-on');
		});
  
  </script>    
</body>
</html>