<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일 업로드 테스트</h2>
<form action="<%=request.getContextPath() %>/file/upload.do" method="post" enctype="multipart/form-data">
	<input type="text" name="id" value="test"> 
	<input type="file" name="attachfile1">
	<input type="file" name="attachfile2">
	<input type="submit" value="업로드">



</form>



</body>
</html>