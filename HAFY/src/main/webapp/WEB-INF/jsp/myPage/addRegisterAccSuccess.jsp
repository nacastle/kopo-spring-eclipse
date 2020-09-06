<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/product/product.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/sticky-footer/sticky-footer.css" rel="stylesheet">

</head>
<body>

   <nav class="site-header sticky-top py-1" style="background: #27b2a5">
      <div class="container d-flex flex-column flex-md-row justify-content-between">
      	<h5 class="masthead-brand" style="font-weight:bold; margin-top:2%; color: white;">계좌 등록</h5>
      </div>
    </nav>
    
    <div class="container-fluid" style="text-align: center; padding-top: 8rem; color: #27b2a5;">
    	<p style="font-weight: bold; font-size: 1.4rem;">${mAccountVO.bank}은행<br>(${mAccountVO.accountNo })<br>계좌 등록이 완료되었습니다.</p>
    	
    </div>
    <div class="container-fluid" style="text-align: center; padding-top: 2rem; color: #27b2a5;">
<!--     	<p style="font-weight: bold; font-size: 1rem;">회원가입이 모두 완료되었습니다.<br>이제 경매를 즐겨보세요!</p> -->
    	
    </div>
    
    
     	<footer class="footer" style="background: white;  bottom: 4rem;">
      		<div class="container" style="text-align: center;">
            	<button class="btn btn-primary btn-lg" onclick="goMain()" style="border:#27b2a5; background: #27b2a5; color: white;">경매 참여하러 가기</button>
            	<button class="btn btn-success btn-lg" onclick="goMyPage()" style="">마이 페이지</button>
            	
      		</div>
    	</footer>
    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script>
    
    function goMyPage() {
    	location.href = "${pageContext.request.contextPath}/myPage"
	}
    
    function goMain() {
    	location.href = "${pageContext.request.contextPath}/hot"
	}
    
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
</body>
</html>