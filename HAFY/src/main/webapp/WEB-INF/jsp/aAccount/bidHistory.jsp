<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/wow/css/libs/animate.css">

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
  <body style="padding-bottom: 0rem;">
  
 
   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/goodsDetail/${aucNo}" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <a  href="#" style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;">경매모임통장</a>
  	 	</div>
  	 	<div class="col-4 d-flex justify-content-end align-items-right"
			style="margin-top: 0.5rem; margin-right: -1rem;">
			<%-- 				<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a>  --%>
			<a href="${pageContext.request.contextPath}/hot" style="float: right; color: black;">
				<i class="fa fa-home fa-lg material-ripple" aria-hidden="true"></i>
			</a>
		</div>
      
    </nav>
    
     <div class="na-content" style="margin-top: 2rem;">
    	<div style="float: right;">경매번호 : ${aucNo }</div>
    	
    <c:choose>
    <%--    입찰내역된 적이 없으면 --%>
	     	<c:when test="${aucGoodsVO.winningBid == 0 }">
	     			<div style="text-decoration: underline;"><div>경매시작가</div></div>
	    			<div style="font-size: 1.5rem; font-weight: bold;">&nbsp;<fmt:formatNumber value="${aucGoodsVO.startPrice }" pattern="#,###"/> 원 </div>
	     	</c:when>
	    <c:otherwise>
     
		     <c:forEach items="${bidResult}" var="result" end="0">
			     	<%-- 마감전이면 최고입찰가 / 후면 낙찰가 --%>
			    	<c:choose>
			    		<c:when test="${nowTime < aucGoodsVO.endDate }">
			    			<div style="text-decoration: underline;"><div>최고입찰가</div></div>
			    			<div style="font-size: 1.5rem; font-weight: bold;">&nbsp;<fmt:formatNumber value="${result.memberBalance }" pattern="#,###"/> 원 (${result.tranzMemberNick }) </div>
			    		</c:when>
			    		<c:otherwise>
			    			<div style="text-decoration: underline;"><div>낙찰가</div></div>
			    			<div style="font-size: 1.5rem; font-weight: bold; background: rgb(26, 188, 156); display: inline-block;">&nbsp;<fmt:formatNumber value="${result.memberBalance }" pattern="#,###"/> 원 (${result.tranzMemberNick })&nbsp;</div>
			    		</c:otherwise>
			    	</c:choose>
		    	</c:forEach>
	    </c:otherwise>	
     </c:choose>

	</div>
	
	<nav class="na-nav">
			<div>
				<a class="top-on material-ripple" href="#" onclick="showRank()"><span>경매참여자</span></a> 
				<a class="material-ripple" onclick="showHistory()" ><span>입/출금</span></a> 
				<a class="material-ripple" onclick="result()" ><span>경매결과</span></a> 
				<span></span>
			</div>

	</nav>
	
	
	 <c:choose>
    <%--    입찰내역된 적이 없으면 --%>
	     	<c:when test="${aucGoodsVO.winningBid == 0 }">
	     		<div class="history" style="text-align: center;margin-top: 1rem;">
	     		 	<img style="width: 6rem; margin-top: 6%; margin-bottom: .5rem; " src="${pageContext.request.contextPath}/resources/img/hafy.png">
	     			<div>아직 입찰 내역이 없습니다.</div>
	     			<div>해당 경매에 한번 입찰을 해보세요!</div>
	     		</div>
	     		<div class="rank" style="display: none;text-align: center;margin-top: 1rem;">
	     			<img style="width: 6rem; margin-top: 6%; margin-bottom: .5rem; " src="${pageContext.request.contextPath}/resources/img/hafy.png">
	     			<div>아직 입찰 내역이 없습니다.</div>
	     			<div>해당 경매에 한번 입찰을 해보세요!</div>
	     		</div>
	     		<div class="result" style="display: none;text-align: center;margin-top: 1rem;">
	     			<img style="width: 6rem; margin-top: 6%; margin-bottom: .5rem; " src="${pageContext.request.contextPath}/resources/img/hafy.png">
	     			<div>아직 진행 중인 경매입니다.</div>
	     		</div>
	     	</c:when>
	     	<c:otherwise>
	
	
<%-- 	입/출금내역 탭 --%>
		<table id="bidHistory" class="table table-hover history" style="display:none; margin: 0 auto; width: 96%; margin-top: .5rem;margin-bottom: 3.5rem; ">
			
		</table>

		<%-- 경매참여자 탭 --%>
		<table class="table table-hover rank" style="margin-bottom: 0rem; font-weight: bold; margin: 0 auto; width: 96%; margin-top: .5rem;">
			<tbody>
			 <c:forEach items="${bidderList}" var="bidder" varStatus="i">
				<tr>
					<th scope="row">${i.count }</th>
					<td style="width: 40%; text-align: center;">
						<div>${bidder.bidderNick }</div>
					</td>
					<td>
						<div style="color:rgb(39, 178, 165);"><fmt:formatNumber value="${bidder.bidMoney }" pattern="#,###"/> 원</div>
					</td>
				</tr>
	</c:forEach>
			</tbody>
		</table>
		
		
		<%-- 경매 결과 탭... 마감 전/후 --%> 
	<div class="result" style="display:none;">
		<c:choose>
			<c:when test="${nowTime < aucGoodsVO.endDate }">
<%-- 				     				<img style="width: 6rem; margin-top: 1rem; margin-bottom: .5rem; " src="${pageContext.request.contextPath}/resources/img/hafy.png"> --%>
<!-- 				<div style="text-align: center;margin-top: 7rem;">아직 진행 중인 경매입니다.</div> -->
				<div style="text-align: center;margin-top: 1rem;">
	     			<img style="width: 6rem; margin-top: 6%; margin-bottom: .5rem; " src="${pageContext.request.contextPath}/resources/img/hafy.png">
	     			<div>아직 진행 중인 경매입니다.</div>
	     		</div>
			
			</c:when>
			<c:otherwise>
				<table class="table table-hover"  style="margin-bottom: 0rem; font-weight: bold; 
					margin: 0 auto; width: 96%; margin-top: .5rem;">
					<tbody>
					 <c:forEach items="${bidResult}" var="result" varStatus="j">
						<tr>
							<th scope="row">${j.count }</th>
							<c:choose>
								<c:when test="${j.count == 1 }">
									<td style="width: 40%;text-align: left; padding: 0; padding-top: 0.75rem;">
										<span style="background: rgb(243, 156, 18); color: white; padding: 0.1rem;float: left;
											margin-right: 0.2rem;font-size: 0.9rem;" >낙찰</span>
										<div style="text-align: center;">${result.tranzMemberNick } &nbsp;</div>
									</td>
								</c:when>
								<c:otherwise>
									<td style="width: 40%; text-align: center;">
										<div>${result.tranzMemberNick }</div>
									</td>
								</c:otherwise>
							</c:choose>
							<td>
								<div style="color:rgb(39, 178, 165);"><fmt:formatNumber value="${result.memberBalance }" pattern="#,###"/> 원</div>
							</td>
						</tr>
			</c:forEach>
					</tbody>
				</table>
			</c:otherwise>		
		</c:choose>
	</div>
	</c:otherwise>
	</c:choose>
		
	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm "
		style="display: unset; background: white; padding:0; padding-top:0.2rem; text-align: center;">


<%-- 			마감시간 전이면  / 후면--%>
		<c:choose>
			<c:when test="${nowTime < aucGoodsVO.endDate }">
				<button type="button" class="btn btn-success" onclick="goGoodsDetail()"
					style="background: rgb(46, 204, 113); border:rgb(46, 204, 113); font-weight: bold; width: 35%;">상품보기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-success" onclick="goBid()"
					style="background: rgb(22, 160, 133); font-weight: bold; width: 35%;">입찰하기</button>
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
				
		</c:choose>
	</nav>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
        <script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script>
    
    <script type="text/javascript">
    
	new WOW().init();

	function goGoodsDetail() {
		location.href= "${pageContext.request.contextPath}/goodsDetail/" + ${aucNo};
	}
	 	
	function result() {
		$(".history").hide();
		$(".rank").hide()
		$(".result").show();
		
	}
	
	let historyScrollCnt = 1;
	let loadCnt = 6;
	let historyScrollLocation = 0;
	
	function loadBidHistory() {
		
		$.ajax({
			url : "${pageContext.request.contextPath}/loadBidHistory/" + historyScrollCnt + "/" + loadCnt + "/" + ${aucNo},
			type : 'get',
			success: function(data) {
				
				$("#loading").show
				$("#bidHistory").append(data)
				historyScrollCnt += 1;
				console.log("historyScrollCnt " + historyScrollCnt )
			}
		})
	}
	function showHistory() {
		$(".history").show();
		$(".rank").hide()
		$(".result").hide();
		
		loadBidHistory()
		
		window.addEventListener('scroll', () => {
				historyScrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
				let windowHeight = window.innerHeight; // 스크린 창
				let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x
				console.log("historyScrollLocation " + historyScrollLocation )
				console.log("historyScrollLocation + windowHeight " + (historyScrollLocation + windowHeight ))
				console.log("fullHeight " + fullHeight )
				
				if(Math.ceil(historyScrollLocation + windowHeight) == fullHeight){
					console.log('끝')
					setTimeout(function() {  
						loadBidHistory()
					}, 
					500);
				}
			})
	}
	function showRank() {
		$(".history").hide();
		$(".rank").show();
		$(".result").hide();
		
	}
    
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