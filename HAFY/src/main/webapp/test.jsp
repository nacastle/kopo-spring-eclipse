<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/wow/css/libs/animate.css">
	
</head>
<body>
<div style="height: 10rem; background: aqua;">asd</div>
<div style="height: 10rem;background:black;">asd</div>
<div style="height: 10rem;background:blue;">asd</div>
<div style="height: 10rem;background:fuchsia;">asd</div>
<div style="height: 10rem;background:green;">asd</div>
<div style="height: 10rem;background:olive;">asd</div>
<div style="height: 10rem;background:purple;">asd</div>
<div style="height: 10rem; background: aqua;">asd</div>
<div style="height: 10rem;background:black;">asd</div>
<div style="height: 10rem;background:blue;">asd</div>
<div style="height: 10rem;background:fuchsia;">asd</div>
<div style="height: 10rem;background:green;">asd</div>
<div style="height: 10rem;background:olive;">asd</div>
<div style="height: 10rem;background:purple;">asd</div>


<!-- <div class="wow bounceInRight" style="font-size: 100px; margin: 80px">테스트</div> -->
<!-- <div class="wow bounceInUp" style="font-size: 100px; margin: 80px">테스트</div> -->
<!-- <div class="wow flipInX" style="font-size: 100px; margin: 80px">테스트</div> -->
<!-- <div class="wow fadeInUp" style="font-size: 100px; margin: 80px">테스트</div> -->
<!-- <div class="wow wobble" style="font-size: 100px; margin: 80px">테스트</div> -->




	<jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>'
	<script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script>
	
	<script>
		new WOW().init();
		
		// Supports all major browsers
		document.documentElement.scrollTop;
		document.querySelector('html').scrollTop;
		
		window.addEventListener('scroll', () => {
			let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
			let windowHeight = window.innerHeight; // 스크린 창
			let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x
// 			console.log("windowHeight " + windowHeight )
// 			console.log("scrollLocation " + scrollLocation )
// 			console.log(scrollLocation + windowHeight )
// 			console.log("fullHeight " + fullHeight )
			
			if(scrollLocation + windowHeight >= fullHeight - 300){
				console.log('끝')
			}
		})
		
// 		$(window).scroll(function () { 
// 			var scrollValue = $(document).scrollTop(); 
// 			console.log(scrollValue); 
// 		});

	</script>
	


</body>
</html>