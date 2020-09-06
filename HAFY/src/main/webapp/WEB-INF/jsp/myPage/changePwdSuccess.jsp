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
  <body style="background: #177e6a; color: white;">

    <nav class="site-header sticky-top py-1" style="background: #177e6a;">
      <div class="container d-flex flex-column flex-md-row justify-content-between">
      	<h5 class="masthead-brand" style="font-weight:bold; margin-top:2%; color: white;">비밀번호 재설정</h5>
      </div>
    </nav>
    
    <div class="container-fluid" style="text-align: center; padding-top: 8rem; color: white;">
    	<p style="font-weight: bold; font-size: 1.4rem;">${memberVO.name} 고객님의<br>비밀번호가 재설정되었습니다.</p>
    </div>
    
     	<footer class="footer" style="background: #177e6a; bottom: 4rem;">
      		<div class="container" style="text-align:center;    margin-top: -1rem;">
            	<button class="btn btn-primary btn-lg" onclick="goAutcion()" style="font-weight:bold; border:#27b2a5; background: white; color: rgb(22, 160, 133);">경매 참여하러 가기</button>
            	<button class="btn btn-success btn-lg" onclick="goMyPage()" style="font-weight:bold;">마이 페이지</button>
      		</div>
    	</footer>
    


  <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script>
    
    function goMyPage() {
    	location.href = "${pageContext.request.contextPath}/myPage"
	}
    
    function goAutcion() {
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