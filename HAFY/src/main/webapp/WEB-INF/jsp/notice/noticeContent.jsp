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
/* 	margin-bottom: 2.9rem; */
}

.table th {
	width: 25%;
	height: 5rem;
	vertical-align: middle;
	padding: 0;
	text-align: center;
}

.table td {
	padding: 0.5rem;
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

.unRead{
background: rgb(235, 235, 235)
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
<body style="padding-top: 3rem;">

   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; 
   padding: .5rem 1rem; border-bottom: 0.1rem solid rgb(224, 224, 224);">
   		<div style="float: left;">
    	  <a href="javascript:history.go(-1)" style="color: black; ">
    	  	<i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i>
    	  </a>
    	  <span style="font-size: 1.25rem; font-weight: bold;top: 0.1rem;
    	  position: relative;margin-left: .4rem;">알림</span>
  	 	</div>
  	 	<div class="material-ripple" data-color="27b2a5"; onclick="readAll()"  style="float: right; font-weight: bold;top: 0.1rem;">
  	 		모두 읽음
  	 	</div>
    </nav>


	<table id="noticeTable" class="table table-hover" >
		
	</table>
	

<!-- 	마감 알림시간 설정완료 안내 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 10rem;">
   <div class="modal-dialog"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-body" style="text-align: center; margin: 1rem;">
            안 읽은 메세지를 전부 읽음 처리하시겠습니까?
         </div>
        
         <div class="modal-footer" style="border-top:0; padding:0; ">
          		<table style="margin-bottom: 0; width: 100%;">
			<tr style="border-top: 0.1rem solid rgb(224, 224, 224);">
				<td class="yn material-ripple" id="yes" onclick="yes()" data-dismiss="modal" style="width:50%; border-right: 0.1rem solid rgb(224, 224, 224);">예</td>
				<td class="yn material-ripple" id="no" data-dismiss="modal" style="width:50%;" onclick="no()">아니오</td>
			</tr>
		</table>
         </div>
      </div>
   </div>
</div>
		   

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
     <script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script>
    <script type="text/javascript">
    
    new WOW().init();
    
    
    
    const loadCnt = 10; 
	let notiScrollCnt = 1;
	let notiScrollLocation = 0;
	
	// 화면뜨자마자 로드되는 인기경매목록
	function loadNotice() {	
		
		$.ajax({
			url : "${pageContext.request.contextPath}/loadNotice/" + notiScrollCnt  + "/" + loadCnt,
			type : 'get',
			success: function(data) {
//					console.log(data)
						$("#noticeTable").append(data)
						notiScrollCnt += 1;
						console.log("notiScrollCnt " + notiScrollCnt )
			}
		})
	}
	
	
	$(document).ready(function() {
		
		// 맨 처음 n개 데이터 로드
		loadNotice()
		
		// 스크롤이 일정 위치에 도달했을때 n개 데이터 로드 (반복)
		window.addEventListener('scroll', () => {
//				hotScrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
		notiScrollLocation = $(window).scrollTop(); // 현재 스크롤바 위치
		console.log("notiScrollLocation " + notiScrollLocation )
		let windowHeight = window.innerHeight; // 스크린 창
		let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x
		
		if (Math.ceil(notiScrollLocation + windowHeight) >= fullHeight) {
			console.log('끝')
			
			setTimeout(function() {
//					$("#loadingHot").show()
				loadNotice()
				
//					 console.log("hot tr 개수: " + hotTrCnt)
			}, 
			500);
		}
	})
	})
	
	
    function readAll() {
    	$(".modal").modal("show")
	}
    
    function yes() {
		
    $.ajax({
		url: "${pageContext.request.contextPath}/readAllNotice",
		type: 'get',
		success : function() {
			console.log("성공")
			if ($("tr").hasClass("unRead")) {
				$(".unRead").removeClass("unRead")
			}
		},
		error : function() {
			console.log("실패")
			
		}
	})
}
    
    function no() {
    	$(".modal").modal("hide")
	}
    
    function goDetail(type, contentNo, notiNo) {
    	location.href = "${pageContext.request.contextPath}/" + type + "/" + contentNo;
    	
    	$.ajax({
    		url : "${pageContext.request.contextPath}/readNotice/" + notiNo,
    		type: 'get',
    		success: function() {
				console.log("성공");
			},
			error: function() {
				console.log("미쳐버림");
			}
    		
    	})
    	
	}
    

    
    
    
    
  </script>    
</body>
</html>