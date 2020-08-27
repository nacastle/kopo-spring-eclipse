<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css"/> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css"/> 



<style>
a {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:focus {
	text-decoration: none;
}

a:hover, a:active {
	text-decoration: underline;
}
</style>

<script>
	function goWriteForm() {
		/* 		location.href = "writeForm.jsp";
		 */location.href = "${pageContext.request.contextPath}/board/write";
	}

	function noticeLogin() {

		if (confirm("로그인이 필요한 서비스입니다.\n로그인하시겠습니까?")) {
			location.href = "/Mission-WEB/jsp/login/login.jsp";
		}

	}

	// 교수님꺼
	// script에서 jstl 문법 인식함
	
	function doAction(boardNo) {
// 		location.href = "${pageContext.request.contextPath}/board/detail?no="+boardNo;
		location.href = "${pageContext.request.contextPath}/board/" + boardNo;   /*   ex.. /board/12    */
	}
</script>


</head>
<body>

<header>
<%-- 	<%@ include file="/WEB-INF/jsp/include/topMenu.jsp" %> --%>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp"></jsp:include>

</header>

	<section>
		<div align="center">
			<hr width="80%">
			<h2>게시판 목록</h2>
			<hr width="80%">

			<table border="1" style="width: 80%">
				<tr>

					<th style="width: 7%">번호</th>
					<th>제목</th>
					<th style="width: 16%">글쓴이</th>
					<th style="width: 20%">등록일</th>
					<th style="width: 20%">조회수</th>
				</tr>
				<c:forEach items="${ boardList }" var="board" varStatus="loop">
					<tr <c:if test="${loop.count % 2 == 0 }">class="even"</c:if>>
						<td>${ board.no }</td>

						<td><a href="javascript:doAction(${board.no })"> <c:out
									value="${board.title }" />
						</a></td>

						<td>${ board.writer }</td>
						<td>${ board.regDate }</td>
						<td>${ board.viewCnt}</td>
					</tr>
				</c:forEach>
				
			</table>
			<br>

<%-- 			<c:choose> --%>
<%-- 				<c:when test="${ not empty loginVO }"> --%>
					<button onclick="goWriteForm()">새글등록</button>
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<button>새글등록</button> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
			

		</div>
	</section>

<footer>
<%-- 	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %> --%>
		<jsp:include page="/WEB-INF/jsp/include/footer.jsp"></jsp:include>
	
</footer>


</body>


</html>