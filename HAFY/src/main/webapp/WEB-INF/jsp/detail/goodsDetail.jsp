<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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

.bx-wrapper {
    position: relative;
    margin-bottom: 2.2rem;
    padding: 0;
    *: ;
    zoom: 1;
    -ms-touch-action: pan-y;
    touch-action: pan-y;
}


 ul { width: 700px; } 
 li { list-style: none;} 
 
 .bxslider li img {
 width: 22rem;
 margin-left: 0;
 }
 
/*  .bxslider li  { */
/*  text-align: center; */
/*  } */

</style>

</head>
<body>

    	<c:forEach items="${aucMap}" var="auc">

  <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/hot" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      	
      		<c:choose>
      			<c:when test="${isLike == false }">
      		<i class="btn-like fa fa-heart-o fa-lg" onclick="like(${auc.key.no},${auc.key.likeCnt })" aria-hidden="true"></i>
      		<i class="btn-dislike fa fa-heart fa-lg" onclick="dislike(${auc.key.no},${auc.key.likeCnt })" style="display: none;" aria-hidden="true"></i>
      			</c:when>
      			<c:otherwise>
      		<i class="btn-like fa fa-heart-o fa-lg" onclick="like(${auc.key.no},${auc.key.likeCnt })" style="display: none;" aria-hidden="true"></i>
      		<i class="btn-dislike fa fa-heart fa-lg" onclick="dislike(${auc.key.no},${auc.key.likeCnt })" aria-hidden="true"></i>
      			
      			</c:otherwise>
      		</c:choose>
		</div>
    </nav>
    <ul class="bxslider">
		<c:forEach items="${auc.value }" var="photo">
			<<li><a href="${pageContext.request.contextPath}/upload/${photo.saveName}"><img src="${pageContext.request.contextPath}/upload/${photo.saveName}"></a></li>
		</c:forEach>
    </ul>
              <div class="na-content">
              
              	<div style="font-size: 0.8rem;">
              		<span>판매자 | ${auc.key.memberNick}</span> <span style="float: right;">신용도 <i class="fa fa-star" aria-hidden="true"></i> 4.6/5.0</span>
              	</div>
              	<hr>
              	
              	<div style="font-size: 1.4rem; font-weight: bold;">
              		${auc.key.name}
              	</div>
              	<div style="color:rgb(94, 94, 94); font-size: 0.7rem; margin-bottom: 0.5rem;">
              		${auc.key.category} | 마감: ${auc.key.endDate} | 시작가: ${auc.key.startPrice} 원
              	</div>
              	
              	<div style="  white-space:pre-line;  margin-bottom: 0.6rem;">
					${auc.key.detail }
              	
              	</div>
              	
              	<div style="color:rgb(94, 94, 94); font-size: 0.8rem;">
              		관심 <span id="likeCnt">${auc.key.likeCnt }</span>  | 조회 ${auc.key.viewCnt}
              	</div>
              	
             </div>

    
    <nav class="na-nav2 navbar fixed-bottom navbar-expand-sm " style="display:unset; background: #27b2a5; padding: .6rem 1rem;">
    
    <div>
    	<span style="font-size: 0.6rem;">현재가 </span><strong>${auc.key.startPrice} 원</strong> | <span style="color: red;">[needed]명 입찰중&nbsp;&nbsp;</span>
			<button class="btn btn-warning " onclick="goBidForm(${auc.key.no })"
				style="margin-right: -1%; margin-top: -0.2rem; float: right; color: white; font-weight: bold; background: orange; border: orange; vertical-align: middle;">입찰하기</button>
		</div>

		<!-- 		<a class="p-2 bottom-on" href="#"> <div><i class="fa fa-home fa-lg"></i></div> 홈</a>  -->
<!-- 		<a class="p-2" href="#" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>  -->
<!-- 		<a class="p-2" href="#" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a>  -->
<!-- 		<a class="p-2" href="#" ><div><i class="fa fa-user fa-lg"></i></div>MY</a>  -->
    </nav>
    
    </c:forEach>



    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
<!--     <script src="https://code.jquery.com/jquery-3.4.1.js"></script> -->
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    
      <script type="text/javascript">
      
      function goBidForm(aucNo) {
    	  location.href = "${pageContext.request.contextPath}/bidForm/"+aucNo
		
	}
      
      $('.bxslider').bxSlider({
          auto: false, // 자동으로 애니메이션 시작
          speed: 500,  // 애니메이션 속도
//           pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
          mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
//           autoControls: true, // 시작 및 중지버튼 보여짐
          pager: true, // 페이지 표시 보여짐
//           captions: true, // 이미지 위에 텍스트를 넣을 수 있음
      });
      
      
      function like(aucNo, likeCnt) {
//     	  console.log("경매번호: "+aucNo);
//     	  console.log(aucNo+1);
		let curLikeCnt = parseInt($("#likeCnt").text());

    	  
    	  $.ajax({
      		url:"${ pageContext.request.contextPath }/incrementLike/"+aucNo,
      		type: "put",
      		success : function() {
				console.log("성공")
      			
      			$("#likeCnt").text(curLikeCnt+1);
				$(".btn-like").hide();
				$(".btn-dislike").show();
			},
			error : function(request, error) {
				console.log("실패");
				console.log("code: "+request.status + "\n" +"message: " + request.responseText + "\n"+"error: "+error)
			}
      	})
	}
      
      function dislike(aucNo, likeCnt) {
//     	  console.log("경매번호: "+aucNo);
//     	  console.log(aucNo+1);

			let curLikeCnt = parseInt($("#likeCnt").text());
    	  
    	  $.ajax({
      		url:"${ pageContext.request.contextPath }/decrementLike/"+aucNo,
      		type: "put",
      		success : function() {
				console.log("성공")
				$(".btn-dislike").hide();
				$(".btn-like").show();
      			$("#likeCnt").text(curLikeCnt - 1);
			},
			error : function(request, error) {
				console.log("실패");
				console.log("code: "+request.status + "\n" +"message: " + request.responseText + "\n"+"error: "+error)
			}
      	})
	}
      
	
      
      
//   	$("div i").click(function() {
// 			$(this).toggle();
// 			$(this).siblings().toggle();
// 		})
	  
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