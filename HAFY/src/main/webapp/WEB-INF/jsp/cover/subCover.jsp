<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="background: white;">
  <head>
    <jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
    <title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/cover/cover.css" rel="stylesheet">
    
    <script type="text/javascript">
    
    function goSignUp() {
    	location.href = "${pageContext.request.contextPath}/signUpForm"
		
	}
    
    </script>
    
  </head>

  <body class="text-center" style="background: white; display:grid; box-shadow: none;">
  
 	 <div style="height: 20%; color:#27b2a5; font-weight: bold; font-size: 2.5rem; padding-top: 1.7rem;">
 	 	H A F Y
 	 </div>
  
 	 <div style="height: 40%;     margin-top: -3rem; ">
 	 <div style="position: absolute; z-index: 2;">
			<img class="img-responsive center-block" style="width: 14rem; margin-left: -1rem" id="hammer" src="${pageContext.request.contextPath }/resources/img/hammer.png" />
			</div>
			<div style="position: relative; z-index: 2; float: right; margin-right: -1rem;">
			<img class="img-responsive center-block" style="width: 6rem; transform: skew(-15deg, 15deg); margin-bottom: 15%; padding-left: 1rem;" id="hafy" src="${pageContext.request.contextPath }/resources/img/hafy.png" />
			</div> 
 	 </div>
  
 	 <div style="height: 15%; color: black;margin-bottom: -3rem;">
 	 	<h4>모두를 위한 경매 플랫폼</h4>
 	 	<div style="font-size: 0.8rem;">하피는 100원 단위 상품도 경매가 가능해요.<br>언제 어디서든 간편하게 경매를 즐겨보세요!</div>
 	 </div>
  
 	 <div>
 	    <button class="btn btn-lg btn-secondary" onclick="goSignUp()" style="background:#27b2a5; color: white; margin-bottom: -2rem;">회원가입 후 시작하기</button>
  	</div>
 	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
  </body>
</html>
