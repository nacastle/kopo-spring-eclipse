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
    
    <div class="container-fluid" style="text-align: center;"> <!--  style="text-align: center; padding-top: 8rem; color: #27b2a5;"> -->
    	<p style="font-weight: bold; font-size: 1rem; margin-top: 4rem;">새로운 비밀번호를 입력해주세요.<br>(숫자 4자리 + 영문 1자리)</p>
    	
    	<div class="mb-3" style="text-align: center;">
<!--               <label for="address">상위주소</label> -->
			<form action="${pageContext.request.contextPath }/changePwdSuccess" name="pForm" method="post">
              <input name="tranzPwd" style="margin: 0 auto; width: 18rem; text-align: center;" type="password" maxlength="5" class="form-control" onkeyup="autoSubmit()">
              </form>
              <div class="invalid-feedback">
                Please enter your 입금 암호.
              </div>
            </div>
    	
    	
    </div>
    
    
    
    

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script>
    
    
    
    function autoSubmit() {
    	let pwdLength = document.pForm.tranzPwd.value.length; 
    	if(pwdLength == 5) {
//     		alert("읽긴읽나?")
    		document.pForm.submit();
    		
    	}
		
	}
    
// })
    
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
  </body>
</html>