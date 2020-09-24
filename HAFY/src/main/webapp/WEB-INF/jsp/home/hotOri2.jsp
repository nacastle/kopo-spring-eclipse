<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/wow/css/libs/animate.css">
    
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

@-webkit-keyframes fadeOutUp {
  0% {
    opacity: 1;
  }

  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
}

@keyframes fadeOutUp {
  0% {
    opacity: 1;
  }

  100% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
}

.fadeOutUp {
  -webkit-animation-name: fadeOutUp;
  animation-name: fadeOutUp;
}


</style>


</head>
<body>
  <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;">
   		<div style="float: left;">
<!--     	  <a href="#" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a> -->
    	  <span  style="font-size: 1.25rem; position:relative; top:0.2rem; /* left: 4rem; */ font-weight: bold; color:black;">홈</span>
  	 	</div>
  	 	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      			<a href="${pageContext.request.contextPath}/aucSearch" style="float: right; color:black;" ><i class="fa fa-search fa-lg" aria-hidden="true"></i></a>
      			&nbsp;&nbsp;&nbsp;
      			<a href="#" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a>
		</div>
      
    </nav>
    
    <nav class="na-nav">
    	<div>
    		<a class="top-on" href="#" onclick="showHot()"><span>인기 경매</span></a>
    		<a  href="#" onclick="showRecent()"><span>최신 경매</span></a>
    		<span></span>
    	</div>
    
    </nav>


	<table id="hotAuc" class="table table-hover" style="margin-top: 0.7rem;">
		<tbody id ="hotAucBody" class="wow bounceInUp"  >
			
		</tbody>

<!-- 		<tbody> -->
<!-- 			<tr id="loadingHot"> -->
<!-- 				<td colspan="2" style="color:turquoise; text-align: center;"> -->
<!-- 					<i class="fa fa-spinner fa-spin fa-2x fa-fw"></i> -->
<!-- 					<span class="sr-only">Loading...</span> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
	</table>
	
	
	<table id="recentAuc" class="table table-hover" style="display:none; margin-top: 0.7rem;">
		<tbody id="recentAucBody"  class="wow bounceInUp" >
		
		</tbody>
<!-- 		<tbody> -->
<!-- 			<tr id="loadingRecent"> -->
<!-- 				<td colspan="2" style="color:turquoise; text-align: center;"> -->
<!-- 					<i class="fa fa-spinner fa-spin fa-2x fa-fw"></i> -->
<!-- 					<span class="sr-only">Loading...</span> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
	</table>

	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>


    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script>
  <script type="text/javascript">
  
		new WOW().init();
		
		
		const loadCnt = 10; 
		let hotScrollCnt = 1;
		let recentScrollCnt = 1;
		let hotTrCnt = 0;
		let recentTrCnt = 0;
		
		// 화면뜨자마자 로드되는 인기경매목록
		function loadHotAucs() {	
			
			$.ajax({
				url : "${pageContext.request.contextPath}/loadHotAucs/" + hotScrollCnt  + "/" + loadCnt,
				type : 'get',
				success: function(data) {
// 					console.log(data)
					
					$("#hotAucBody").append(data)
					hotScrollCnt += 1;
					console.log("hotScrollCnt " + hotScrollCnt )
					
				}
			})
		}
		
		
		$(document).ready(function() {
			loadHotAucs()
		})
		
		window.addEventListener('scroll', () => {
			let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
			let windowHeight = window.innerHeight; // 스크린 창
			let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x
			console.log("fullHeight" +fullHeight)
			console.log(scrollLocation + windowHeight )
			
			hotTrCnt = $("#hotAucBody tr").length
			
			if (${hotTotalCnt} == hotTrCnt ) {
				
				setTimeout(function() {
// 					$("#loadingHot").show()
				$("#loadingHot").hide()
// 					 console.log("hot tr 개수: " + hotTrCnt)
				}, 
				500);
				console.log("끝끝끈")
//					$("#loadingHot").fadeOutUp( 'slow' )
				 
			 } else
			if(scrollLocation + windowHeight == fullHeight){
				console.log('끝')
				
				setTimeout(function() {
// 					$("#loadingHot").show()
					loadHotAucs()
// 					 console.log("hot tr 개수: " + hotTrCnt)
				}, 
				500);
			}
		})
		

function showHot() {
	$("#hotAuc").show()
	$("#recentAuc").hide()
	
}

//최신경매 로드하는 함수
function loadRecentAucs() {
	
	$.ajax({
		url : "${pageContext.request.contextPath}/loadRecentAucs/" + recentScrollCnt + "/" + loadCnt,
		type : 'get',
		success: function(data) {
			
			$("#loading").show
			$("#recentAucBody").append(data)
			recentScrollCnt += 1;
			console.log("recentScrollCnt " + recentScrollCnt )
		}
	})
}
		
function showRecent() {
	$("#hotAuc").hide()
	$("#recentAuc").show()
// 	let recentScrollCnt = 1;
	
	// 첫 로드
	$.ajax({
		url : "${pageContext.request.contextPath}/loadRecentAucs/" + recentScrollCnt + "/" + loadCnt,
		type : 'get',
		success: function(data) {
// 				console.log(data)
			$("#recentAucBody").append(data)
			recentScrollCnt += 1;
			console.log("recentScrollCnt " + recentScrollCnt )
		}
	})
	
	
	window.addEventListener('scroll', () => {
			let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
			let windowHeight = window.innerHeight; // 스크린 창
			let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x
			
			recentTrCnt = $("#recentAucBody tr").length
			
			if (${hotTotalCnt} == recentTrCnt ) {
				
				setTimeout(function() {
// 					$("#loadingHot").show()
				$("#loadingRecent").hide()
// 					 console.log("hot tr 개수: " + hotTrCnt)
				}, 
				500);
// 				console.log("끝끝끈")
//					$("#loadingHot").fadeOutUp( 'slow' )
				 
			 } else
			if(scrollLocation + windowHeight == fullHeight){
				console.log('끝')
				setTimeout(function() {  
					loadRecentAucs()
				}, 
				500);
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