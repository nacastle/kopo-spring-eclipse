<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
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
/* nav div a:nth-child(3).on ~ span {	left: 200px; opacity: 1;} */
/* nav div a:nth-child(4).on ~ span {	left: 300px; opacity: 1;} */
/* nav div a:nth-child(5).on ~ span {	left: 400px; opacity: 1;} */

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
 
 
 .ttitle {
/*      margin-left: 4%; */
     font-weight: bold;
 }
 
  hr { width: 90vw  }   
 
 label { margin: 0; }
 
/*  input[type="date"]:not(.has-value):before{ */
/*   color: lightgray; */
/*   content: attr(placeholder); */
/* } */

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

table {
width: 100%;
}

tr {
	border: 0.1rem solid rgb(190, 190, 190);
	border-left: 0;
    border-right: 0;
}

th {
	padding-left: 1rem;
	height: 5rem;
	
}

td {
 text-align: right;
 padding-right: 1rem;
}


</style>
</head>
<body>

<nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/myPage" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
<!--     	  <a href="javascript:history.back()" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a> -->
    	  <span style="font-size: 1.25rem; position:relative; top:0.1rem; left: 3.5rem; font-weight: bold; color:black;">내 계좌</span>
    	  
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      			<a style="float: right; font-weight: bold; font-size: 1.25rem; color:black;margin-top: -0.3rem;"
      			href="${pageContext.request.contextPath}/myAccountMng">관리</a>
		</div>
    </nav>
    

<div class="na-content">

	<div style="font-size: 1.2rem; font-weight: bold; margin-bottom: 0.5rem; ">${memberVO.name } 님의 계좌</div>

	<table class="table-hover">
		<c:forEach items="${mAccountList }" var="mAccount">
		<tr>
			<th>
				<div>${mAccount.bank }은행</div>
				<div>${mAccount.accountNo }</div>
			</th>
			
			<td>
				<div>${mAccount.balance } 원</div>
			</td>
		</tr>
		</c:forEach>
	</table>

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
      
      function goMyInfo() {
    	  location.href = "${pageContext.request.contextPath}/myInfo"
		
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