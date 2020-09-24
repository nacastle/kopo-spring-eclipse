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

.table {
	margin-bottom: 2.9rem;
}

.table th {
	width: 40%;
	height: 5rem;
	vertical-align: middle;
	padding: 0;
	text-align: center;
}

.table td {
	padding: 0.3rem;
	padding-top: 0.5rem;
}

table th img {
	max-width: 100%;
	max-height: 100%;
	/* 	width: 100%; */
	padding: 0.3rem;
}

.ongoing {
	background: rgb(26, 188, 156);
}

.waiting {
	background: rgb(243, 156, 18);
}

.urgent {
	background: rgb(231, 76, 60);
}

.closed {
	background: rgb(190, 190, 190);
}
</style>
</head>
<body style="padding-top: 3rem;">

   <nav class="navbar fixed-top" style="height:3rem; background:white; color:black; 
   padding: .5rem 1rem; border-bottom: 0.1rem solid rgb(224, 224, 224);">
   		<div style="float: left;">
    	  <a href="${pageContext.request.contextPath}/hot" style="color: black; ">
    	  	<i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i>
    	  </a>
    	  <span style="font-size: 1.25rem; font-weight: bold;top: 0.1rem;
    	  position: relative;margin-left: .4rem;">알림</span>
  	 	</div>
    </nav>


	<table class="table table-hover" >
		<tbody id="inputTbody">
			
		</tbody>
	</table>

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script type="text/javascript">
    

    
    
    
    
  </script>    
</body>
</html>