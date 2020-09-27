<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
}

.na-nav {
	position: fixed;
	left: 0;
	top: 2.7rem;
	width: 100%;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, .5);
	z-index: 9998;
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

.table th {
	width: 40%;
	height: 5rem;
 	vertical-align: middle; 
 	padding: 0; 
	text-align: center;
}

.table td {

padding: 0.3rem;
padding-top: 0.5rem;

}

 
 table th img {
	max-width: 100%;
	max-height: 100%;
/* 	width: 100%; */
	padding: 0.3rem;
}

.ongoing {
background: rgb(26, 188, 156);
}

.waiting {
background: rgb(243, 156, 18);
}

.urgent {
background: rgb(231, 76, 60);
}

.closed {
background: rgb(190, 190, 190);
}

.confirmed {
background: rgb(142, 68, 173);
color: white;

}
.returning {
background: rgb(190, 190, 190);
}
.returned {
background: rgb(190, 190, 190);
}



.fa-bell-o {
    position: absolute;
    z-index: 9998;
    right: 1rem;
    top: .25rem;
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
  <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/myPage" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <span  style="font-size: 1.25rem; position:relative; top:0.2rem;  left: 4rem;  font-weight: bold; color:black;">낙찰내역</span>
  	 	</div>
<!--   	 	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;"> -->
<%--       			<a href="${pageContext.request.contextPath}/aucSearch" style="float: right; color:black;" ><i class="fa fa-search fa-lg" aria-hidden="true" style="position: fixed;right: 2.7rem; top: 1.2rem;"></i></a> --%>
<!--       			&nbsp;&nbsp;&nbsp; -->
<%--       			<a href="${pageContext.request.contextPath}/noticeContent" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i> --%>
      			
<%--       			<c:if test="${unreadNotiCnt != 0 }"> --%>
<%-- 	      			<span id="noticeCnt" style="background: red; color: white;">${unreadNotiCnt }</span> --%>
<%--       			</c:if> --%>
<!--       			</a> -->
<!-- 		</div> -->
      
    </nav>
    
    <nav class="na-nav">
    	<div>
    		<a class="top-on" href="#" onclick="showWinAuc()"><span>낙찰</span></a>
    		<a href="#" onclick="showConfirmAuc()"><span>매입확정</span></a>
    		<a  href="#" onclick="showReturn()"><span>환불</span></a>
    		<span></span>
    	</div>
    
    </nav>


	<table id="winAuc" class="table table-hover" style="margin-top: 0.7rem;">
	
		<tbody>
		
		<c:forEach items="${winAucMap}" var="auc">
			<tr onclick="goDetail(${auc.value.no})">
				<th scope="row">
<!-- 					<span class="ongoing" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 진행중 </span> -->
<%-- 					<img src="<%=request.getContextPath()%>/upload/${auc.key}"> --%>
				<c:choose>
					<c:when test="${auc.value.startDate > nowTime }">
						<span class="waiting" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 대기중 </span>
					</c:when>
					<c:when test="${auc.value.startDate <= nowTime and  auc.value.endDate > nowTime  }">
						<span class="ongoing" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 진행중</span>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '확정' }">
						<span class="confirmed" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 확정 </span>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불요청중' }">
						<span id="returningTag${auc.value.no}" class="returning" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 환불중 </span>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불완료' }">
						<span id="returnedTag${auc.value.no}" class="returning" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 환불완료 </span>
					</c:when>
					<c:when test="${auc.value.endDate <= nowTime }">
						<span id="closedTag${auc.value.no}" class="closed" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 마감 </span>
					</c:when>
				</c:choose>

					<span id="confirmedTag${auc.value.no}" class="confirmed" style="display: table; display:none; font-size: 0.8rem; margin-left: 0.4rem;" > 확정 </span>
					<span id="returningTag${auc.value.no}" class="returning" style="display: table; display:none; font-size: 0.8rem; margin-left: 0.4rem;" > 환불중 </span>
					<img src="${pageContext.request.contextPath }/upload/${auc.key}">

				</th>
				<td>
					<div style="font-weight: bold; font-size: 1rem;">${auc.value.name }</div>
					<div style="display:table; font-size:0.8rem; background: rgb(224, 224, 224);">마감: ${auc.value.endDate }</div>
<%-- 					<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ${like.value.winningBid } 원</div> --%>
					<c:choose>
						<c:when test="${auc.value.endDate <= nowTime }">
							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;background: black;display: inline-block;color: wheat;">낙찰가: <fmt:formatNumber value="${auc.value.winningBid }" pattern="#,###"/> 원</div>
						</c:when>
						<c:otherwise>
						<c:choose>
							<c:when test="${auc.value.winningBid == 0}">
								<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: <fmt:formatNumber value="${auc.value.startPrice }" pattern="#,###"/>원</div>
							</c:when>
							<c:otherwise>
								<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: <fmt:formatNumber value="${auc.value.winningBid }" pattern="#,###"/> 원</div>
							</c:otherwise>
						</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${auc.value.purchaseConfirm == '미확정' }">
						<td id="confirm${auc.value.no}" colspan="2" style="text-align:center; border-top: 0rem;">
<!-- 							<button type="button" class="btn btn-primary btn-block" style="margin-top: -0.5rem;  -->
<%-- 								margin-bottom: 0.2rem;" onclick="confirmPurchase(${winAuc.value.no})">매입확정</button> --%>
							<button type="button" class="btn btn-primary" style="width:49%; margin-top: -0.5rem; 
								margin-bottom: 0.2rem;" onclick="openConfirmModal(${auc.value.no}, '${auc.value.memberNick }',${auc.value.winningBid })">매입확정</button>
							<button type="button" class="btn btn-primary" style="background:orangered; border:orangered; width:49%;margin-top: -0.5rem; 
								margin-bottom: 0.2rem;" onclick="goReturnForm(${auc.value.no})">환불요청</button>
						</td>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '확정' }">
						<td colspan="2" style="border-top: 0rem;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">매입확정 완료</button>
						</td>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불요청중' }">
						<td colspan="2" style="border-top: 0rem;">
							<button onclick="goReturnDetail(${auc.value.no})" type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불요청중 (글보기)</button>
						</td>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불완료' }">
						<td colspan="2" style="border-top: 0rem;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불완료</button>
						</td>
					</c:when>
				</c:choose>
				<td id="confirmed${auc.value.no}" colspan="2" style="border-top: 0rem; display: none;">
					<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">매입확정 완료</button>
				</td>
				<td id="returning${auc.value.no}" colspan="2" style="border-top: 0rem; display: none;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불요청중</button>
				</td>
				<td id="returned${auc.value.no}" colspan="2" style="border-top: 0rem; display: none;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불완료</button>
				</td>
			</tr>
			</c:forEach>
			
		</tbody>

	</table>
	
		<!-- 매입확정창 -->
<div class="modal fade"  tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 10rem;">
   <div class="modal-dialog"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-body" style="text-align: center; margin: 1rem;">
            정말 매입을 확정하시겠습니까?
         </div>
        
         <div class="modal-footer" style="border-top:0; padding:0; ">
          	<table style="margin-bottom: 0; width: 100%;    border-top: 0.1rem solid rgb(224, 224, 224);">
			<tr>
				<td class="yes yn" id="yes" data-dismiss="modal" style="border-right: 0.1rem solid rgb(224, 224, 224);">예</td>
				<td class="no yn" id="no" data-dismiss="modal" >아니오</td>
			</tr>
		</table>
         </div>
      </div>
   </div>
</div>
		

		
	
	
	<table id="confirmAuc" class="table table-hover" style="display:none; margin-top: 0.7rem;">
	</table>

	<table id="returnAuc" class="table table-hover" style="display:none; margin-top: 0.7rem;">
	
	</table>

	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>


    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
  <script type="text/javascript">
  

  function goReturnDetail(aucNo) {
	location.href = "${pageContext.request.contextPath}/returnDetail/" + aucNo
}
  function goReturnForm(aucNo) {
	  location.href = "${pageContext.request.contextPath}/returnForm/" + aucNo
}
  let tempAucNo;
	let tempSellerNick;
	let tempWinBidMoney;
	
  function openConfirmModal(aucNo, sellerNick, winBidMoney) {
	  	tempAucNo = aucNo;
	  	tempSellerNick = sellerNick;
	  	tempWinBidMoney = winBidMoney;
	  	console.log("-매입확정할 경매번호: "+tempAucNo)
// 	  	console.log("-매입확정할 경매번호: "+aucNo)
// 		console.log("-판매자: " + sellerNick)
// 		console.log("-낙찰액: " + winBidMoney)
		
		$(".yes").css("background","white")
	  	$(".no").css("background","white")
// 	  	$(".modal").modal("show")
	  	$(".modal").modal("show")
// 	  	console.log("매입확정된 경매번호: "+aucNo)
// 	  	console.log("판매자: " + sellerNick)
// 	  	console.log("낙찰액: " + winBidMoney)
	  	
	  	$(".yes").click(function() {
	  	  	$(".yes").css("background","rgb(224, 224, 224)")
	  	  	
	  	  	
	  	  	console.log("++매입확정된 경매번호: "+tempAucNo)
// 	 	 		console.log("++판매자: " + sellerNick)
// 	  			console.log("++낙찰액: " + winBidMoney)
	  	  	
	 		$.ajax({
  		url : "${pageContext.request.contextPath}/confirmPurchase",
  		type : 'post',
  		data : {
  			aucNo : tempAucNo,
  			sellerNick : tempSellerNick,
  			winBidMoney : tempWinBidMoney 
  		},
  		success : function() {
				console.log("성공")
				console.log("매입확정된 경매번호: "+tempAucNo)
// 	 	 		console.log("판매자: " + sellerNick)
// 	  			console.log("낙찰액: " + winBidMoney)
				$("#confirm"+tempAucNo).hide();
				$("#confirmed"+tempAucNo).show()
				$("#closedTag"+tempAucNo).hide()
				$("#confirmedTag"+tempAucNo).show()
				$("#confirmedTag"+tempAucNo).css("display","table")
				
				
			},
			error : function() {
				console.log("실패")
			}
  		
  	})
  	
	})
		
		$(".no").click(function() {
	  	  	$(".no").css("background","rgb(224, 224, 224)")
			$(".modal").modal("hide")
		})
}
		
function showWinAuc() {

	$("#winAuc").show()
	$("#confirmAuc").hide()
	$("#returnAuc").hide()
	
}

function showConfirmAuc() {
	$("#winAuc").hide()
	$("#returnAuc").hide()
	$("#confirmAuc").show()
	$("#confirmAuc").empty()
	
	$.ajax({
		url : "${pageContext.request.contextPath}/loadConfirmAuc",
		success: function(data) {
			$("#confirmAuc").append(data);
		}
	})
	
	
}

function showReturn() {
	$("#winAuc").hide()
	$("#confirmAuc").hide()
	$("#returnAuc").show()
	$("#returnAuc").empty()
	
		$.ajax({
		url : "${pageContext.request.contextPath}/loadReturnAuc",
		success: function(data) {
			$("#returnAuc").append(data);
		}
	})
	
	
}
  
  function goDetail(aucNo) {
	  location.href= "${pageContext.request.contextPath}/goodsDetail/"+ aucNo;
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