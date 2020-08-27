<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	

<script>
	function addFavorite() {
		try {
			window.external.AddFavorite('http://localhost:9999/Mission-WEB',
					'첫번째 나의 웹')

		} catch (e) {
			// TODO: handle exception
			
			alert("현재 사용중인 브라우저에서는 사용할 수 없습니다.\n크롬에서는 ctrl+d를 이용해주세요.")
		}

	}
</script>

<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="width: 128px; height: 26px;"><a
			href="${pageContext.request.contextPath }"> <!-- web.xml 에 있는 welcome file 이 있어서 알아서 index.html로 연결됨 -->
				<img src="${pageContext.request.contextPath }/resources/images/logo.jpg">
		</a></td>
		<td align="right">
			<!-- 크롭에서는 안먹히는 즐겨찾기 생성법 --> <!-- <a href="javascript:window.external.AddFavorite('http://localhost:9999/Mission-WEB','첫번째 나의 웹')">즐겨찾기</a> -->

			<!-- 크롬에서 먹히는 즐겨찾기 생성법 --> <!--      	<a href="javascript:addFavorite()">즐겨찾기</a> 자바스크립트 문법을 사용하게하는 방법 -->
			<a href="#" onclick="addFavorite()">즐겨찾기</a> <!-- #은 아무것도 안할거라는 의미 -->
			<c:if test="${ not empty loginVO }">
				[${ loginVO.id }님으로 로그인 중...]
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
		<nav>
<%-- 		<c:if test="${ loginVO.type eq 'S' }"> --%>
<!-- 			회원관리 -->
<%-- 		</c:if>  --%>
			<a href="${pageContext.request.contextPath }/board">게시판</a> | 
			<c:choose>
				<c:when test="${ empty loginVO }">
<%-- 					<a href="/${pageContext.request.contextPath }">회원가입</a> |  --%>
					<a href="${pageContext.request.contextPath }/login">로그인</a> |
				</c:when>
				<c:otherwise> 
<%-- 					<a href="/Mission-WEB/jsp/member/memberDetail.jsp?id=${userVO.id }">마이페이지</a> | --%>
					<a href="${pageContext.request.contextPath }/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
			</nav>
		</td>
	</tr>

</table>