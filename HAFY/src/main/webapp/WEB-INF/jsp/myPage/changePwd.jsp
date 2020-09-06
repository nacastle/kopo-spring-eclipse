<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">

</head>
    <style type="text/css">
a {
	text-decoration: none !important;
}

body {
	min-height: 0;
	padding-top: 3.2rem;
	padding-bottom: 4rem;
	
}

.na-nav {
	position: fixed;
	left: 0;
	top: 2.7rem;
	width: 100%;
	background: #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, .5);
}

.na-nav div {
	position: relative;
	display: flex;
	width: 100%;
	margin: 0 auto;
}

.na-nav div a {
	flex: 1;
	display: block;
	height: 40px;
	line-height: 40px;
	text-align: center;
	color: #8f8f8f;
	font-weight: bold;
}

.na-nav div a.top-on {
	color: #000;
}

.na-nav div>span {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 50%;
	height: 3px;
	background: #27b2a5;
	opacity: 0;
	transition: all .5s;
}

.na-nav div a:nth-child(1).top-on ~ span {
	left: 0;
	opacity: 1;
}

.na-nav div a:nth-child(2).top-on ~ span {
	left: 50%;
	opacity: 1;
}

.na-nav2 {
	height: 3rem;

}

.na-nav2 a {
	font-size: 0.7rem;
	width: 20%;
	color: black;
	text-align: center;
	padding: .3rem !important;
}

.na-nav2 i {
	margin-bottom: 0.3rem;
}


.na-nav2 a.bottom-on {
	color: white;
}

 
 .na-content {
 margin: 1rem 1rem;
/*  text-align: center; */
 display: flow-root;
 
 }
 
 table {
 	font-size: 0.9rem;
 	width: 100%;
 	border-collapse: unset; 
	
 
 }
 
 .ttitle {
/*      margin-left: 4%; */
     font-weight: bold;
 }
 
 
 table th {
	width: 30%;
	height: 2rem;
/* 	padding-left: 3%; */
	text-align: center;
	vertical-align: middle;
 	padding: 0.1rem;
/*  	border: 0; */
 	background: rgb(127, 127, 127); 
 	color: white; 
}
 table td {
/* 	width: 73%; */
	height: 2rem;
/*   	padding-left: 3%;   */
	padding-right: 1rem;
	text-align: right;
	vertical-align: middle;
}


  hr { width: 90vw  }   
 
 label { margin: 0; }
 
input[type="datetime-local"]::before {
	color: #999999;
	content: attr(placeholder);
}
input[type="datetime-local"] {
	color: #ffffff;
}
input[type="datetime-local"]:focus,
input[type="datetime-local"]:valid {
	color: #666666;
}
input[type="datetime-local"]:focus::before,
input[type="datetime-local"]:valid::before {
	content: "" !important;
}

input {
/* text-align: right; */
}


</style>
</head>
<body>

<nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/myPage" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      		<a href="#" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a>
		</div>
    </nav>
    
    <div class="na-content">
    <div>
    	<div style="margin-bottom: 0.5rem;">비밀번호를 입력해주세요.</div>
    	<input type="password" class="form-control" style="margin-bottom: 0.5rem;" id="tranzPwd" onkeypress="inputAgain()">
    	<div>
    		<button class="btn btn-primary" style="margin-bottom: 2rem; float: right; background: #177e6a; border: #177e6a;" 
    		onclick="submitPwd()">제출</button>
    	</div>
<!--     	<input type="submit" class="form-control" value="제출" onclick="submitPwd()"> -->
    </div>
    
    <div id="errorMsg" style="color:red; display: none;">비밀번호가 틀렸습니다.</div>
    
<!--     <div id="confirmMsg" style="display:none; margin-top:5rem; text-align: center;"> -->
<!--     	<div style="margin-bottom: 0.5rem;">새로운 비밀번호를 입력하세요.</div> -->
<!--     	<input type="password" class="form-control" style="margin-bottom: 0.5rem;" id="newPwd"> -->
<!--     	<button class="btn btn-outline-success" onclick="cancelSignOut()">더 사용해볼래요</button>&nbsp;&nbsp; -->
<!--     	<button class="btn btn-outline-danger" onclick="confirmSignOut()">네, 삭제할게요</button> -->
<!--     </div> -->
    </div>
    
    
	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;">

		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a> 
		<a class="p-2" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a>
		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a>
		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a> 
		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a> 

    </nav>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
     <script type="text/javascript">
     
     function inputAgain() {
			$("#errorMsg").hide()
	}
     
      function submitPwd() {
    		var inputPwd = $("#tranzPwd").val()
    		
//     	  console.log(inputPwd)
			$.ajax({
				url: "${pageContext.request.contextPath}/checkPwd",
				type: 'post',
				data: {
					'inputPwd' : inputPwd
				},
				success: function(data) {
					console.log(data)
					if (data == '"correct"') {
						$("#tranzPwd").prop("disabled", true);
						location.href = "${pageContext.request.contextPath}/changePwdForm"
// 						$("#confirmMsg").show()
					} else {
						$("#errorMsg").show()
					}
				}
				
			})
	}
      
      function cancelSignOut() {
    	  location.href = "${pageContext.request.contextPath}/myPage"
	}
      
      function confirmSignOut() {
    	  $.ajax({
				url: "${pageContext.request.contextPath}/confirmSignOut",
				success: function() {
					console.log("성공")
					location.href = "${pageContext.request.contextPath}/login"
				},
				error: function() {
					console.log("실패")
				} 
			})
	}
      
      
	  $('.na-nav a').on('click',function(){
		 $(this).addClass('top-on');
		 $(this).siblings().removeClass('top-on');
		});
	  $('.na-nav2 a').on('click',function(){
		 $(this).addClass('bottom-on');
		 $(this).siblings().removeClass('bottom-on');
		});
  
  </script>    
</body>
</html>