<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/product/product.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/sticky-footer/sticky-footer.css" rel="stylesheet">


</head>
 <body style="background: #177e6a; color: white;">

   <nav class="navbar fixed-top" style="height:3rem; color:black; padding: .5rem 1rem;">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/bidForm/${aucNo}" style="color: white; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
    	  <a  href="#" style="font-size: 1.25rem; text-decoration:none; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:white;">암호 입력</a>
  	 	</div>
    </nav>
    
    <div class="container-fluid" style="text-align: center; margin-top: 10rem;"> <!--  style="text-align: center; padding-top: 8rem; color: #27b2a5;"> -->
    	<p style="font-weight: bold; font-size: 1.3rem; margin-top: 4rem;">비밀번호가 일치하면<br><fmt:formatNumber value="${bidMoney}" pattern="#,###"/> 원을 송금합니다.</p>
    	
    	<div class="mb-3" style="text-align: center;">
<!--               <label for="address">상위주소</label> -->
			<form action="${pageContext.request.contextPath}/bidSuccess/${aucNo}" method="post" name="pForm">
              <input style="margin: 0 auto; width: 18rem; text-align: center;" type="password" maxlength="5" class="form-control" name="tranzPwd" placeholder="" onkeydown="eraseError()"" onkeyup="autoSubmit()">
              </form>
              <span id="pwdError" style="color: white; display: none;">${msg }</span>  <!-- 비밀번호가 틀렸습니다. -->
              <div class="invalid-feedback">
                Please enter your 입금 암호.
              </div>
            </div>
    	
    	
    </div>



    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script>
    
//     function autoSubmit() {
//     	let pwdLength = document.pForm.tranzPwd.value.length; 
//     	let pwd = document.pForm.tranzPwd.value;
//     	if(pwdLength == 5) {
// //     		alert("읽긴읽나?")
// //     		alert("${memberVO.tranzPwd}" )
// 			if("${memberVO.tranzPwd}" == pwd) {
//     			document.pForm.submit();
// 			} else {
// 				alert("비번이 틀립니다")
// 			}
    		
//     	}
		
// 	}
	function eraseError() {
    		$("#pwdError").hide();
	}

    function autoSubmit() {
    	let pwdLength = document.pForm.tranzPwd.value.length; 
    	let pwd = document.pForm.tranzPwd.value;
    	if(pwdLength == 5) {
//     		$("#pwdError").show();
    			document.pForm.submit();
    	}
	}
    
      Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
      });
    </script>
</body>
</html>