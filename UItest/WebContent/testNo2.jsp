<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<link href="na/css/style.css" rel="stylesheet">

<style type="text/css">
.screen {
	position: absolute;
	width: 100%;
	height: 100%;
	background: white;
	/* 	position: absolute; */
	text-align: center;
}

.top {
	color: #27b2a5;
	width: 100%%;
	height: 15%;
 	background: aqua; 

	/* 	margin-left: auto; */
	/* 	margin-right: auto; */
	/* 	margin-top: 50px; */
	/* 	font-size: 1.6rem; */

	/* 	margin: 0 auto; */
	/* 	text-align: center; */
	/* 	margin-left: 30%; */
	/* 	margin-top: 15%; */
	/* 	font-weight: bold; */
	/* 	transform: translate(-50%, -50%); */
	/*  	top: 15%;  */
	/* 	left: 30%; */
	/*  	position: absolute;  */
}

.downside {
	position: relative;
	top: 60%;

}

.content {
	width: 100%;
	height: 65%;
/* 	margin-top: 5%; */
 	background: gray;
}

.footer {
	width: 100%;
	height: 20%;
 	background: blue; 
	padding-top: 10%;
}




.img {
	top: 3%;
	width: 100%;
	height: 70%;
 	background: green; 
	padding-top: 10%;
}

.text {
	padding-top: 7%;
	width: 100%;
	height: 30%;
 	background: olive; 

}


</style>

</head>
<body>

	<div class="screen">
		<div class="top">
			<div class="downside">
			H A F Y
			</div>
<!-- 		탑입니다 -->
		
		
		</div>

		<div class="content">
		
			<div class="img">
				<img style="width: 60%; margin-left: 5%" id="hammer" src="img/hammer.png" /> 
				<img style="width: 24%; transform: skew(-15deg, 15deg); margin-bottom: 15%" id="hafy" src="img/hafy.png" />
			
			</div>
			<div class="text">
			 모두를 위한 경매 플랫폼<br>
			 <div style="font-size: 0.5rem">하피는 100원 단위 상품도 경매가 가능해요.<br>
			 언제 어디서든 간편하게 입찰을 해보세요!
			 </div>
			
			</div>
		
		</div>

		<div class="footer">
		<button>회원가입 후 시작하기</button>
		
		</div>



	</div>










</body>
</html>