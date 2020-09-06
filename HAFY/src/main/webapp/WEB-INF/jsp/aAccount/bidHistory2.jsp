<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
<style type="text/css">
a {
	text-decoration: none !important;
}

body {
	min-height: 0;
 	padding-top: 3rem; 
 	padding-bottom: 4rem; 
	
}

.na-nav {
	position: relative;
	left: 0;
	top: 0.5rem;
	width: 100%;
	background: #fff;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, .5);
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
	width: 33.33%;
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
	left: 33.33%;
	opacity: 1;
}

.na-nav div a:nth-child(3).top-on ~ span {
	left: 66.66%;
	opacity: 1;
}

.na-nav2 {
	height: 3rem;

}

.na-nav2 a {
	font-size: 0.7rem;
	width: 25%;
	color: black;
	text-align: center;
	padding: .3rem !important;
/* 	height: 3rem; */
}

.na-nav2 a.bottom-on {
	color: white;
}

 
 
 .na-content {
 margin: 0rem 1rem;
/*  text-align: center; */
position: relative;
 }
 
 table {
/*  	margin-top: 0.7rem; */
/*  	font-size: 0.7rem; */
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
	border-collapse: collapse;
 
 }
 
 
 table th {
	width: 15%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: center;
	vertical-align: middle;
	font-weight: bold;
/*  	padding: 0.1rem; */
/*  	border: 0; */
/* 	background: rgb(22, 160, 133); */
/* 	color: white; */
}
 table td {
/* 	width: 73%; */
	height: 1.8rem;
/* 	padding-left: 3%; */

	text-align: right; 
	vertical-align: middle;
 	padding: 0.1rem;
 	padding-left: 0.5rem;
/*  	border: 0; */
/* 	background:white; */
}

/* 
table th img {
	max-width: 100%;
	max-height: 100%;
} */

  hr { width: 100%; margin: 0.5rem 0;   }   
 
 label { margin: 0; }
 


.btn-like {

	padding:0; border: 0; margin-right: 3%; 

}

.btn-dislike {
	padding:0; border: 0; margin-right: 3%; 

}

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 12rem;
}

</style>	
<title>하피 - 모두를 위한 경매</title>
</head>
<body>
  <body style="    padding-bottom: 0rem;">
  
   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/bidForm/${aucNo}" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <a  href="#" style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;">경매모임통장</a>
  	 	</div>
  	 	<div class="col-4 d-flex justify-content-end align-items-right"
			style="margin-top: 0.5rem; margin-right: -1rem;">
			<%-- 				<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a>  --%>
			<a href="${pageContext.request.contextPath}/hot" style="float: right; color: black;">
				<i class="fa fa-home fa-lg" aria-hidden="true"></i>
			</a>
		</div>
      
    </nav>
    
  
    <div class="na-content" style="margin-top: 2rem;">
    	<div style="float: right;">경매번호 : ${aucNo }</div>
    	<div style="text-decoration: underline;"><div>최고입찰가</div></div>
    	<div style="font-size: 1.5rem; font-weight: bold;">${highestBid } 원</div>
	</div>
	
	<nav class="na-nav">
			<div>
				<a class="top-on" href="#"><span>입/출금</span></a> 
				<a href="#"><span>경매참여자</span></a> 
				<a href="#"><span>경매결과</span></a> 
				<span></span>
			</div>

	</nav>
		<table class="table table-hover" style="margin: 0 auto; width: 96%; margin-top: .5rem;margin-bottom: 3.5rem; ">
			<tbody>
			
				<c:forEach items="${aTranzList }" var="aTranzVO">
					<c:set value="${aTranzVO.tranzDate }" var="tranzDate" scope="page"></c:set>
				<tr>
					<th scope="row" style="padding: 0.75rem 0rem;">${fn:substring(tranzDate,5,10) }</th>
					<td style="width: 40%;">
						<div style="font-weight: bold;">${aTranzVO.tranzMemberNick }</div>
						<div style="font-size:0.8rem; color:#8f8f8f">${fn:substring(tranzDate,11,16) } | ${aTranzVO.tranzType }</div>
					</td>
					<td>
					<c:choose>
						<c:when test="${aTranzVO.tranzType == '입금' }">
						<div style="color: green;">+ ${aTranzVO.tranzMoney } 원</div>
						</c:when>
						<c:otherwise>
						<div style="color: rgb(243, 156, 18);">- ${aTranzVO.tranzMoney } 원</div>
						</c:otherwise>
					</c:choose>
						<div style="font-size:0.8rem; color:#8f8f8f">${aTranzVO.memberBalance } 원</div>
					</td>
				</tr>
					
				</c:forEach>
				
				
			</tbody>
		</table>

	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm "
		style="display: unset; background: white; padding: .6rem 1rem; text-align: center;">

<!-- 		<button type="button" class="btn btn-warning btn-sm" -->
<!-- 			style="font-weight: bold; width: 45%;">출금</button> -->
<!-- 		&nbsp;&nbsp;&nbsp;&nbsp; -->
		<button type="button" class="btn btn-success btn-sm" onclick="goBid()"
			style="background: rgb(22, 160, 133); font-weight: bold; width: 45%;">입찰</button>
	</nav>





    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script type="text/javascript">
  
	
// 	  $("div i").click(function() {
// 			$(this).toggle();
// 			$(this).siblings().toggle();
// 		})
	  function goBid() {
	location.href = "${pageContext.request.contextPath}/bidForm/"+${aucNo};
		
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