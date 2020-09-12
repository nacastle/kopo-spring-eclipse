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
 	padding-top: 3rem; 
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
    margin-top: 0.4rem;
 }
 
 table {
 	margin-top: 0.7rem;
 	font-size: 0.9rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
	border-collapse: unset;
 
 }
 
 
 table th {
	width: 35%;
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

</head>
  <body style="    padding-bottom: 0rem;">
  
   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
<%--     	  <a href="${pageContext.request.contextPath}/goodsDetail/${aucGoodsVO.no}" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a> --%>
    	  <a href="javascript:history.go(-1)" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <span style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;">입찰하기</span>
  	 	</div>

		<div class="col-4 d-flex justify-content-end align-items-right"
			style="margin-top: 0.5rem; margin-right: -1rem;">
			<%-- 				<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a>  --%>
			<a href="${pageContext.request.contextPath}/hot"
				style="float: right; color: black;"><i class="fa fa-home fa-lg"
				aria-hidden="true"></i></a>
			<!--       			&nbsp;&nbsp;&nbsp; -->
			<!--       			<a href="#" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a> -->
		</div>


	</nav>
  
              <div class="na-content">
              	입찰 상품
              	<form action="${pageContext.request.contextPath}/bidConfirm/${aucGoodsVO.no}" 
              	name ="bForm" method="post" onsubmit="return checkBidMoney(${aucGoodsVO.winningBid},${aucGoodsVO.startPrice})">
              	<table>
              		<tr>
              			<th>경매번호</th>
						<td>${aucGoodsVO.no }</td>
					</tr>
              		<tr>
              			<th>상품명</th>
						<td> ${aucGoodsVO.name }</td>
					</tr>	              		
              		<tr>
              			<th>경매마감일자</th>
						<td> ${aucGoodsVO.endDate }
						</td>
					</tr>	              		
              		<tr>
              			<th>시작가 </th>
						<td> ${aucGoodsVO.startPrice} 원&nbsp;
						</td>
					</tr>	              		
              		<tr>
              			<th> 입찰방식	</th>
						<td>${aucGoodsVO.method }</td>
					</tr>	              		
              			              		
              	</table>
              	<br>
              	
              	입찰하기
		<table>
			<tr>
				<th>현 최고입찰가</th>
				<td style="font-weight: bold;">${aucGoodsVO.winningBid} 원</td>
			</tr>
			
			<tr>
				<th>입찰금액</th>
				<td style="padding: 0.6rem">
				
				<c:choose>	
					<c:when test="${pastBidMoney != 0 }">			
				현재까지 입찰하신 금액은<br>
				<strong>${pastBidMoney}</strong> 원 입니다.
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${aucGoodsVO.winningBid == 0}">
								현재 시작가인 <strong>${aucGoodsVO.startPrice}</strong> 원부터 <br>	입찰하실 수 있습니다.
							</c:when>
							<c:otherwise>
								현재 <strong>${aucGoodsVO.winningBid}</strong> 원부터 <br>	입찰하실 수 있습니다.
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
					
						<div class="input-group" style="padding-top: 0.6rem;">
							<!-- 				<span class="input-group-addon">\</span>  -->
							<input type="number" name="bidMoney" class="form-control" style="width: 80%; "
								placeholder="입찰가" onkeypress="modifyBid()"> &nbsp;&nbsp; 
								<span style="margin-top: 1rem;">원</span>
						</div>
					
				</td>
			</tr>
		</table>
		
		<div id="startBidError" style="color: orange; display: none; text-align: right;">시작가 이상의 금액을<br> 입찰하셔야합니다.</div>
		<div id="bidError" style="color: orange; display: none; text-align: right;">최고입찰가를 초과하는 금액을<br> 입찰하셔야합니다.</div>
		
		<div style="margin-top:1.5rem; text-align: center;">
			<select style=" margin-bottom: 2%;" name="bidAccount" class="selectpicker">
			<c:forEach items="${mAccountList }" var="mAccount"> 
				<option>${mAccount.bank }은행 | ${mAccount.accountNo }</option>
			</c:forEach>	
			</select> &nbsp;에서 출금
		</div>

		<div style="width: 100%; text-align:center; ">
			<button type="submit" class="btn btn-outline-success " style="width:35%; margin-top:1rem; margin-bottom: 1rem;">입찰하기</button>
		</div>
		</form>


	</div>


    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    
    <script type="text/javascript">
  
	function checkBidMoney(winningBid, startPrice) {
		
		let bidMoney = document.bForm.bidMoney.value
		
		if (winningBid == 0) {
			if (parseInt(bidMoney) < startPrice) {
				$("#startBidError").show();
				return false;
			}	
		} else {
			if (parseInt(bidMoney) + ${pastBidMoney} <= winningBid) {
				$("#bidError").show();
				return false;
			}
	}
	return true;
}
	
	function modifyBid() {
		$("#startBidError").hide();
		$("#bidError").hide();
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