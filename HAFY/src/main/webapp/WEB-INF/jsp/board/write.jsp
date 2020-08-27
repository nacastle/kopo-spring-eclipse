<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
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
	text-decoration: none;
}

.error {
color: red;
}

</style>

<script type="text/javascript">
	function doWrite() {
		let f = document.wForm;
		if (f.title.value == "") {
			alert("제목을 입력하세요")
			f.title.focus()
			return false
		}
		/* if(f.writer.value == "") {
			alert("글쓴이를 입력하세요")
			f.writer.focus()
			return false
		} */
		if (f.content.value == "") {
			alert("내용을 입력하세요")
			f.content.focus()
			return false
		}
		// 파일 확장자 체크
		if (checkExt(f.attachfile1)) {
			return false
		}
		if (checkExt(f.attachfile2)) {
			return false
		}
		return true;
	}
	function checkExt(obj) {
		let forbidName = [ 'exe', 'bat', 'java', 'js', 'class', 'jsp' ];
		let fileName = obj.value;
		let searchIdx = fileName.lastIndexOf('.');
		let ext = fileName.substring(searchIdx + 1);
		for (let i = 0; i < forbidName.length; i++) {
			if (forbidName[i] == ext) {
				alert('[' + ext + '] 확장자는 파일 업로드 정책에 위배됩니다.');
				return true
			}
		}
		return false
	}
	function doList() {
		location.href = "listByProf.jsp"
	}
</script>
</head>
<body>
	<header>
	</header>
	<div align="center">
		<hr width="80%">
		<h2>게시물 등록폼</h2>
		<hr width="80%">
		<br>
		<form:form commandName="boardVO" method="post">    <!-- 이동하는 url이 없으면 자기 자신으로 감 -->
			<table border="1" style="width: 80%;">
				<tr>
					<th width="23%">제목</th>
					<td>
						<form:input path="title"/><form:errors path="title" class="error"></form:errors>    <!-- path는 getter 역할... -->
					</td>
				</tr>
				<tr>
					<th width="23%">글쓴이</th>
					<td>
						${boardVO.writer}
						<form:input path="writer"/><form:errors path="writer" class="error"></form:errors>    <!-- path는 getter 역할... -->
					</td>
				</tr>
				<tr>
					<th width="23%">내용</th>
					<td>
						<form:textarea path="content" rows="7" cols="50"/><form:errors path="content" class="error"></form:errors>    <!-- path는 getter 역할... -->
					</td>
				</tr>
			</table>
			<button type="submit">등록</button>		
		</form:form>
		
		


	</div>

	<footer>

	</footer>


</body>
</html>