<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
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

 .na-content {
 margin: 0rem 1rem;
 text-align: center;
 }
 
 table {
 	margin-top: 0.7rem;
 	font-size: 0.7rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
	border-collapse: unset;
 
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
	width: 73%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: left;
	vertical-align: middle;
 	padding: 0.1rem;
 	padding-left: 0.5rem;
/*  	border: 0; */
	background: rgb(224, 224, 224);
}

  hr { width: 90vw  }   
 
 label { margin: 0; }
 

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
</style>
</head>
<body>

    <nav class="navbar fixed-top" style=" background:white; color:black; padding: .1rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224); height: 3rem;" >
   		<div style="float: left;">
    	  <a  href="#" style="font-size: 1.25rem; position:relative; top:0.2rem; left: 0rem; font-weight: bold; color:black;">출품완료</a>
  	 	</div>
    </nav>
    
              <div class="na-content">
              	<div style="width: 5rem; padding-left: 0.5rem; margin-top: .5rem;">출품 내역
              		<hr style="width: 100%; margin-top: 0.2rem; margin-bottom: 0.3rem">
              	</div>
              	
              		<div style="font-size:0.8rem; text-align: right;">
					등록일시 : ${aucGoodsVO.regDate}              		
              	
              		</div>

					<table>
						<tbody>
							<tr>
								<th>경매번호</th>
								<td>${aucGoodsVO.no }</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>${aucGoodsVO.name }</td>
							</tr>
							<tr>
								<th>경매 시작일자</th>
								<td>${aucGoodsVO.startDate }</td>
							</tr>
							<tr>
								<th>경매 마감일자</th>
								<td>${aucGoodsVO.endDate }</td>
							</tr>
							<tr>
								<th>시작가</th>
								<td><fmt:formatNumber value="${aucGoodsVO.startPrice }" pattern="#,###"/> 원</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td>${aucGoodsVO.category }</td>
							</tr>
							<tr>
								<th>입찰방식</th>
								<td>${aucGoodsVO.method }</td>
							</tr>
							<tr>
								<th>출품자</th>
								<td>${aucGoodsVO.memberNick }</td>
							</tr>
						</tbody>
					</table>
					
<!-- 					<button type="button" class="btn btn-outline-success btn-small" style="margin-left:22%; margin-top:0.8rem;">내 경매글 보러가기</button> -->
					<button type="button" class="btn btn-outline-success btn-small" onclick="goDetail(${aucGoodsVO.no })" style="width:60%; margin-top:3rem;">내 경매글 보러가기</button>
<!-- 					<button type="button" class="btn btn-outline-success btn-small" style="width:60%; margin-top:0.8rem;">출품 확정하기</button> -->
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
    
    function goDetail(aucNo) {
    	location.href = "${pageContext.request.contextPath}/goodsDetail/"+aucNo
//     	location.href = "${pageContext.request.contextPath}/displayDetail/"+aucNo
		
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