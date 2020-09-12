<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
 	font-size: 0.9rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
/* 	border-collapse: unset; */
/* 	border-top: 0.1rem solid rgb(224, 224, 224); */
/* 	margin-bottom: 1rem; */
 	border-collapse: unset; 
	
 
 }
 
 .ttitle {
/*      margin-left: 4%; */
     font-weight: bold;
 }
 
 
 table th {
	width: 30%;
	height: 2rem;
/* 	padding-left: 3%; */
	text-align: center;
	vertical-align: middle;
 	padding: 0.1rem;
/*  	border: 0; */
 	background: rgb(127, 127, 127); 
 	color: white; 
}
 table td {
/* 	width: 73%; */
	height: 2rem;
/*   	padding-left: 3%;   */
	padding-right: 1rem;
	text-align: right;
	vertical-align: middle;
/*  	padding: 0.1rem; */
/*  	padding-left: 0.5rem; */
/*  	border-bottom: 0.1rem solid rgb(224, 224, 224); */
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

input {
text-align: right;
}


</style>
</head>
<body>





	<div class="na-content" style="    margin-bottom: 1.6rem;">

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

<form action="${pageContext.request.contextPath}/myModifyComplete" name="mForm" method="post">

<nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
<%--     	  <a href="${pageContext.request.contextPath}/myPage" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a> --%>
    	  <a href="javascript:history.back()" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <span style="font-size: 1.25rem; position:relative; top:0.1rem; left: 3.5rem; font-weight: bold; color:black;">수정</span>
    	  
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
				<button
					style="float: right; font-weight: bold; font-size: 1.25rem; color: black; margin-top: -0.3rem; border: 0; background: none;"
					type="submit">완료</button>
			</div>
    </nav>
    
		<table class="table-hover">
			<tr>
				<th>이름</th>
				<td>${memberVO.name }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<c:set value="${memberVO.resNo }" var="resNo"></c:set>
				<c:set value="${fn:substring(resNo,0,1) }" var="year"></c:set>
				<c:choose>
				<c:when test="${year == 0 } ">
				<td>20${fn:substring(resNo,0,2) }.${fn:substring(resNo,2,4) }.${fn:substring(resNo,4,6) } </td>
				</c:when>
				<c:otherwise>
				<td>19${fn:substring(resNo,0,2) }.${fn:substring(resNo,2,4) }.${fn:substring(resNo,4,6) } </td>
				</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>성별</th>
				<c:choose>
					<c:when test="${memberVO.sex == 1 or  memberVO.sex == 3}">
						<td>남</td>
					</c:when>
					<c:otherwise>
						<td>여</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
<%-- 			<c:set value="${memberVO.phone }" var="phone"></c:set> --%>
				<th>핸드폰 번호</th>
				<td id="phone">
					<input type="text" class="form-control" name="phone" 
					value="${memberVO.phone }">
				</td>
			</tr>
			<tr>
				<th>배송지</th>
			<td>
				<div>
					<input type="text" class="form-control" name="address1"
						value="${memberVO.address1 }">
				</div>
				<div>
					<input type="text" class="form-control" name="address2"
						value="${memberVO.address2}">

				</div>
			</td>
		</tr>
		
		</table>
</form>


    
	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>




    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
      <script type="text/javascript">
      
//       function complete() {
// 		let phone = document.mForm.phone.value
// 		let address1 = document.mForm.address1.value
// 		let address2 = document.mForm.address2.value
// 		console.log(phone);
// 		console.log(address1);
// 		console.log(address2);
    	  
//     	  $.ajax({
//       		url:"${ pageContext.request.contextPath }/myModifyComplete",
//       		type: "post",
//       		data: {
//       			phone : phone,
//       			address1 : address1,
//       			address2 : address2
      			
//       		}
//       		success : function() {
// 				console.log("성공")
      			
//       			$("#likeCnt").text(curLikeCnt+1);
// 				$(".btn-like").hide();
// 				$(".btn-dislike").show();
// 			},
// 			error : function(request, error) {
// 				console.log("실패");
// 				console.log("code: "+request.status + "\n" +"message: " + request.responseText + "\n"+"error: "+error)
// 			}
//       	})
// 	}
		
      
      
      
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