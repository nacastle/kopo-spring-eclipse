<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
<link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
<style type="text/css">
    .form-control {
    text-align: center;
    }
    
    .btn {
    }
 </style>

</head>
 <body class="text-center" style="background: #27b2a5;">
    <form class="form-signin" action="${pageContext.request.contextPath}/login" method="post">
<!--       <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
<!--       <h1 class="h3 mb-3 font-weight-normal" style="color: white;">Welcome<br>H A F Y</h1> -->
	<div style="padding-bottom: 1rem; color: white;">
      <h5>모두를 위한 경매 플랫폼</h5>
      <h2>H A F Y</h2>
    </div>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="text" id="inputEmail" class="form-control" name="nickname" placeholder="ID" autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" id="inputPassword" class="form-control" name="tranzPwd" placeholder="Password" >
      <div class="checkbox mb-3">
<!--         <label> -->
<!--           <input type="checkbox" value="remember-me"> Remember me -->
<!--         </label> -->
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit" style="background: #177e6a; border: #177e6a;">로그인</button>
      <p class="mt-5 mb-3 text-muted"><a style="color: #6c757d;" href="${pageContext.request.contextPath}/signUp">회원가입</a></p>
    </form>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    </body>
</html>