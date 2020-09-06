<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--     <%@ taglib uri="http://www.springframework.org/tags/form" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

	<div class="header" style="height: 7rem; background: aqua;">
		header</div>

	<div class="section"
		style="width: 100%; height: 20rem; background: orange; position: relative; overflow: hidden;">
		<div style=" position: absolute; width: 100%;">
			<div style="position:absolute; width: 90%; height: 18rem; background: fuchsia; overflow: hidden;">c1</div>
			<div style="position:absolute; width: 90%; height: 18rem; background: lime; overflow: hidden;">c2</div>
			<div></div>
		</div>

	</div>


	<div class="footer" style="height: 7rem; background: blue;">
		<button onclick="left()">옆으로</button>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		function left() {
			$(".section").css("left", "-100%")

		}
	</script>

</body>
</html>