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
    	  <a href="javascript:history.go(-1)" style="color: black; ">
    	  	<i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i>
    	  </a>
  	 	</div>
  	 		<div class="input-group" style="width: 90%;">
                <input type="text" onkeyup="enterkey()"  id="searchWord" class="form-control" style="width: 70%; height:2.2rem; font-size:.9rem; font-style:italic; background: rgb(248, 248, 248);"
    	   placeholder="제목 혹은 내용을 입력하세요.">
                <div class="input-group-prepend" id="searchBtn" style="float: right; ">
                  <button type="submit" class="input-group-button" style="width:3rem; border: 1px solid #ced4da; height:2.2rem; font-size: 0.9rem; color: gray; "><i class="fa fa-search fa-lg" aria-hidden="true"></i></button>
<!--                    <span >검색</span> -->
                </div>
              </div>
<!--     	  <input type="text" id="searchWord" class="form-control" style="width: 70%; font-size:.9rem; font-style:italic; background: rgb(248, 248, 248);" -->
<!--     	   placeholder="제목 혹은 내용을 입력하세요."> -->
<!--     	   <div id="searchBtn" style="float: right;">검색</div> -->
<!--        +62314+ -->
       
    </nav>

	<div id="msg">
		<div style="text-align: center;">
			<img id="hafy" style="width: 8rem; margin-top: 5.4rem; margin-bottom: .5rem;"
				src="${pageContext.request.contextPath}/resources/img/hafy.png">
			<div id="inputMsg" style="color: rgb(200, 200, 200);">
				<i>검색 키워드를 입력하세요. (ex. 키보드)</i>
			</div>
			<div id="noData" style="color: rgb(200, 200, 200); display: none;">
				<i>검색 결과가 없습니다.</i>
			</div>
		</div>
	</div>

	<table class="table table-hover" >
		<tbody id="inputTbody">
			
		</tbody>
	</table>

<!-- 	<nav class="na-nav2 navbar fixed-bottom navbar-expand-sm navbar-dark" style="background: #27b2a5; padding: .1rem 0rem; height: 3rem;"> -->

<%-- 		<a class="p-2 " href="${pageContext.request.contextPath}/hot"><div><i class="fa fa-home fa-lg"></i></div> 홈</a>  --%>
<%-- 		<a class="p-2 bottom-on" href="${pageContext.request.contextPath}/goodsCategory" ><div><i class="fa fa-bars fa-lg"></i></div> 카테고리</a> --%>
<%-- 		<a class="p-2 " href="${pageContext.request.contextPath}/myAuction" ><div><i class="fa fa-hourglass-half fa-lg" aria-hidden="true"></i></div>내 경매</a> --%>
<%-- 		<a class="p-2" href="${pageContext.request.contextPath}/displayForm" ><div><i class="fa fa-arrow-circle-up fa-lg"></i></div>출품하기</a>  --%>
<%-- 		<a class="p-2 " href="${pageContext.request.contextPath}/myPage" ><div><i class="fa fa-user fa-lg"></i></div>MY</a>  --%>

<!--     </nav> -->

    <jsp:include page="/WEB-INF/jsp/include/lib/botLibs.jsp"></jsp:include>
    <script type="text/javascript">
    
    function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
        $("#inputTbody").empty();
    	$("#hafy").hide();
    	$("#inputMsg").hide();
    	
    	
    	let searchWord = $("#searchWord").val().trim()
    	console.log(searchWord);
	    $.ajax({
    		url : "${pageContext.request.contextPath}/aucSearch/" + searchWord,
    		type : "get",
    		success : function(data) {
				console.log("성공");
// 				console.log(data)
				if (searchWord == '' || data == '{}' ) {
					$("#hafy").show()
					$("#noData").show()
				} else {
				
					$("#hafy").hide()
					$("#noData").hide()
// 					let map = JSON.parse(data);
// 					console.log(map)
// 					console.log(data)
					$("#inputTbody").html(data);
					
// 					console.log("찍기"+ $("#inputTbody").text() )
					
					if( $("#inputTbody").text().trim() == '') {
						$("#hafy").show()
						$("#noData").show()
					}
					
				}
			},
			
			error : function() {
				console.log("실패")
			}
    		
    	
    	})
            
        }
}



    
    $("#searchBtn").click(function() {
    	
    	$("#inputTbody").empty();
    	$("#hafy").hide();
    	$("#inputMsg").hide();
    	
    	
    	let searchWord = $("#searchWord").val().trim()
    	console.log(searchWord);
	    $.ajax({
    		url : "${pageContext.request.contextPath}/aucSearch/" + searchWord,
    		type : "get",
    		success : function(data) {
				console.log("성공");
// 				console.log(data)
				if (searchWord == '' || data == '{}' ) {
					$("#hafy").show()
					$("#noData").show()
				} else {
				
					$("#hafy").hide()
					$("#noData").hide()
// 					let map = JSON.parse(data);
// 					console.log(map)
					console.log(data)
					$("#inputTbody").html(data);
					if( $("#inputTbody").text().trim() == '') {
						$("#hafy").show()
						$("#noData").show()
					}
					
// 	 				for (key in map ) {
// 	 					console.log("firstPhoto:" + key + " / " + "value:" + map[key]['name']  )
						
// 	 					let str = "";
// 	 					str += '<tr onclick="goDetail(' + map[key]["no"] + ')">';
// 	 					str += 	'<th scope="row">';
// 	 					str +=		'<span class="ongoing" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 진행중 </span>';
// 						str += 		'<img src="${pageContext.request.contextPath }/upload/' + key + '">';
// 						str +=	'</th>';
// 						str += '<td>';
// 						str += 		'<div style="font-weight: bold; font-size: 1rem;">'+ map[key]['name'] + '</div>';
// 						str += 		'<div style="display:table; font-size:0.8rem; background: rgb(224, 224, 224);">마감: '+ map[key]['endDate'] + '</div>';
// 						if(map[key]['winningBid'] == 0) {
// 							str += '<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ' + map[key]['startPrice'] + ' 원</div>';
// 						} else {
// 							str += '<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ' + map[key]['winningBid'] + ' 원</div>';
// 						}
// 						str +=	'</td>';
						
// 	 					$("#inputTbody").append(str);
// 					}
				}
			},
			
			error : function() {
				console.log("실패")
			}
    		
    	
    	})
		
	})
    
    
    
    function goDetail(aucNo) {
  	  location.href= "${pageContext.request.contextPath}/goodsDetail/"+ aucNo;
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