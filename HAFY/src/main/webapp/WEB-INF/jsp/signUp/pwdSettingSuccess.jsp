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
      	<h5 class="masthead-brand" style="font-weight:bold; margin-top:2%; color: white;">암호 설정</h5>
      </div>
    </nav>
    
    <div class="container-fluid" style="text-align: center; padding-top: 8rem; color: white;">
    	<p style="font-weight: bold; font-size: 1.4rem;">${memberVO.name} 고객님의<br>경매 암호가 설정되었습니다.</p>
    </div>
    
     	<footer class="footer" style="background: #177e6a;">
      		<div class="container" style="    margin-top: -1rem;">
            	<button class="btn btn-primary btn-lg btn-block" onclick="goRegisterAcc()" style="font-weight:bold; border:#27b2a5; background: white; color: rgb(22, 160, 133);">계좌 등록하러 가기</button>
      		</div>
    	</footer>
    


  <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script>
    
    function goRegisterAcc() {
    	location.href = "${pageContext.request.contextPath}/registerAccForm"
		
	}
    
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
  </body>    
</html>