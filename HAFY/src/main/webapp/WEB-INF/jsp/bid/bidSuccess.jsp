<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/sticky-footer/sticky-footer.css" rel="stylesheet">
    
<style type="text/css">
a {
	text-decoration: none !important;
}

body {
	min-height: 0;
 	padding-top: 3rem; 
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
	width: 25%;
	color: black;
	text-align: center;
	padding: .3rem !important;
/* 	height: 3rem; */
}

.na-nav2 a.bottom-on {
	color: white;
}

 
 
 .na-content {
 margin: 0rem 1rem;
/*  text-align: center; */
position: relative;
 }
 
 table {
 	margin-top: 0.7rem;
 	font-size: 0.7rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
	border-collapse: unset;
 
 }
 
 
 table th {
	width: 35%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: center;
	vertical-align: middle;
 	padding: 0.1rem;
/*  	border: 0; */
	background: rgb(22, 160, 133);
	color: white;
}
 table td {
	width: 73%;
	height: 1.8rem;
/* 	padding-left: 3%; */
	text-align: left;
	vertical-align: middle;
 	padding: 0.1rem;
 	padding-left: 0.5rem;
/*  	border: 0; */
	background: rgb(224, 224, 224);
}

/* 
table th img {
	max-width: 100%;
	max-height: 100%;
} */

  hr { width: 100%; margin: 0.5rem 0;   }   
 
 label { margin: 0; }
 


.btn-like {

	padding:0; border: 0; margin-right: 3%; 

}

.btn-dislike {
	padding:0; border: 0; margin-right: 3%; 

}

.bootstrap-select:not([class*=col-]):not([class*=form-control]):not(.input-group-btn) {
    width: 12rem;
}

</style>

</head>
 <body style="padding-bottom: 0rem;">
  
   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/bidForm/${aucNo}" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
<!--     	  <a  href="#" style="font-size: 1.25rem; position:relative; top:0.2rem; left: 4rem; font-weight: bold; color:black;"></a> -->
  	 	</div>
  	 		<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
<%-- 				<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a>  --%>
      			<a href="${pageContext.request.contextPath}/hot" style="float: right; color:black;" >
      				<i class="fa fa-home fa-lg" aria-hidden="true" style="font-size: 2rem;"></i>
      			</a>
<!--       			&nbsp;&nbsp;&nbsp; -->
<!--       			<a href="#" style="float: right; color:black;" ><i class="fa fa-bell-o fa-lg" aria-hidden="true"></i></a> -->
		</div>
		
      
    </nav>
    
  
              <div class="na-content" style="text-align: center;">
              
              <img style="width: 8rem; margin-top: 5rem; margin-bottom: .5rem; " src="${pageContext.request.contextPath}/resources/img/hafy.png">
              <div style="margin-bottom:1rem; font-size: 1.6rem;">
              <div style="margin-bottom: 0.7rem;">
              <fmt:formatNumber value="${bidMoney }" pattern="#,###"/> 원으로<br>
              입찰에 성공하셨습니다.
              </div>
              <div>
              현재 최고 입찰자가<br>
              되셨습니다.
              </div>
               </div>
	</div>
	
	<footer class="footer" style="text-align: center; bottom: 3rem; background: none; position: static;">
			<button type="button" class="btn btn-success" onclick="goAAcount(${aucNo})"
				style="background: rgb(22, 160, 133); font-weight: bold;">경매모임계좌 보러가기</button>
	</footer>
	



    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>

  <script type="text/javascript">
  
  function goAAcount(aucNo) {
	  console.log("경매번호: " + aucNo)
	  location.href = "${pageContext.request.contextPath}/bidHistory/"+aucNo;
	
}
	
// 	  $("div i").click(function() {
// 			$(this).toggle();
// 			$(this).siblings().toggle();
// 		})
	  
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