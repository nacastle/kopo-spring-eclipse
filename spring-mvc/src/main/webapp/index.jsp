<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<a href="<%=request.getContextPath()%>/hello/hello.do"> hello </a> <br>
	<a href="<%=request.getContextPath()%>/method/method.do"> method </a> <br>
	<a href="<%=request.getContextPath()%>/form/joinForm.do"> form </a> <br>
	<a href="<%=request.getContextPath()%>/ajax/resBody.do"> 문자열 응답 </a> <br>
	<a href="<%=request.getContextPath()%>/ajax/resBody.json"> JSon 응답 </a> <br>
	<a href="<%=request.getContextPath()%>/ajax/resVOBody.json"> JSonVO 응답 </a> <br>
	<a href="<%=request.getContextPath()%>/ajax/resStringListBody.json"> JSonStringList 응답 </a> <br>
	<a href="<%=request.getContextPath()%>/ajax/resVOListBody.json"> JSonVOList 응답 </a> <br>
	<a href="<%=request.getContextPath()%>/file/uploadForm.do"> 파일업로드 </a> <br>

</body>
</html>