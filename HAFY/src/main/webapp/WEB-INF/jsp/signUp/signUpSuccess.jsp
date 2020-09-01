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
      	<h5 class="masthead-brand" style="font-weight:bold; margin-top:2%; color: white;">본인 인증</h5>
      </div>
    </nav>
    
    <div class="container-fluid" style="text-align: center; padding-top: 8rem; color: #27b2a5;">
    	<p style="font-weight: bold; font-size: 1.4rem;">본인 인증이 완료되었습니다.<br><br>반갑습니다 ${memberVO.name} 고객님!</p>
    </div>
    
    
<!--     <main role="main" class="inner cover"> -->
<!--         <h3 class="cover-heading">본인 인증이 완료되었습니다.</h3> -->
<!--         <h3 class="cover-heading">반갑습니다 ${name} 고객님!</h3> -->
<!--         <p class="lead">Hana Auction For You</p> -->
<!--         <p class="lead"> -->
<!--           <a href="#" class="btn btn-lg btn-secondary">Learn more</a> -->
<!--         </p> -->
<!--       </main> -->
    
     
     
     	<footer class="footer" style="background: white;">
      		<div class="container">
            	<button class="btn btn-primary btn-lg btn-block" onclick="goPwdSetting()" style="font-weight:bold; border:#27b2a5; background: #27b2a5; color: white;">경매 암호 설정하러 가기</button>
      		</div>
    	</footer>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script type="text/javascript">
    	function goPwdSetting() {
			location.href="${pageContext.request.contextPath}/pwdSetting"
		}
    </script>
</body>
</html>