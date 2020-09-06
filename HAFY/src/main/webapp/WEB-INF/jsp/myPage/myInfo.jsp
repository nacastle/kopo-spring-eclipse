<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">s
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
    <style type="text/css">



</style>
</head>
<body>

<nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/myPage" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
      			<a style="float: right; font-weight: bold; font-size: 1.25rem; color:black;margin-top: -0.3rem;"
      			href="${pageContext.request.contextPath}/myModify">수정</a>
		</div>
    </nav>



	<div class="na-content" style="    margin-bottom: 1.6rem;">

		<div style="float: left; font-weight: bold;">

			<i class="fa fa-user-circle fa-4x" style="float: left;"
				aria-hidden="true"></i>
			<div style="float: left; text-align: center; margin-left: 0.4rem; margin-top: 0.5rem;">
				${memberVO.name }<br> (${memberVO.nickname})
			</div>
		</div>

		<div style="float: right; text-align: center;   margin-top: 0.4rem;">
			경매지수<br> <i class="fa fa-star" aria-hidden="true"></i> 4.5 / 5.0
		</div>
	</div>


		<table class="table-hover">
			<tr>
				<th>이름</th>
				<td>${memberVO.name }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<c:set value="${memberVO.resNo }" var="resNo"></c:set>
				<c:set value="${fn:substring(resNo,0,1) }" var="year"></c:set>
				<c:choose>
				<c:when test="${year == 0 } ">
				<td>20${fn:substring(resNo,0,2) }.${fn:substring(resNo,2,4) }.${fn:substring(resNo,4,6) } </td>
				</c:when>
				<c:otherwise>
				<td>19${fn:substring(resNo,0,2) }.${fn:substring(resNo,2,4) }.${fn:substring(resNo,4,6) } </td>
				</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th>성별</th>
				<c:choose>
					<c:when test="${memberVO.sex == 1 or  memberVO.sex == 3}">
						<td>남</td>
					</c:when>
					<c:otherwise>
						<td>여</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
			<c:set value="${memberVO.phone }" var="phone"></c:set>
				<th>핸드폰 번호</th>
				<td>
					${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,11)} 
				</td>
			</tr>
			<tr>
				<th>배송지</th>
				<td><div>${memberVO.address1 }</div><div>${memberVO.address2 }</div></td>
			</tr>
		
		</table>


    
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