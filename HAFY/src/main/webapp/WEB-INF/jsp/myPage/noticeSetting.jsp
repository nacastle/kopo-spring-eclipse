<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/jsp/include/lib/topLibs.jsp"></jsp:include>
<title>하피 - 모두를 위한 경매</title>
    <link href="${pageContext.request.contextPath }/resources/bootstrap-4.0.0/docs/4.0/examples/navbar-fixed/navbar-top-fixed.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">

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
 
 table {
 	font-size: 1.2rem;
 	width: 100%;
/*  	border: 1 solid rgb(158, 158, 158); */
/* 	border-collapse: unset; */
/* 	border-top: 0.1rem solid rgb(224, 224, 224); */
/* 	margin-bottom: 1rem; */
 	border-collapse: collapse; 
	
 
 }
 
 .ttitle {
/*      margin-left: 4%; */
     font-weight: bold;
 }
 
 
 table th {
	width: 60%;
	height: 2rem;
/* 	text-align: center; */
	vertical-align: middle;
 	padding: 0.6rem;
 	padding-left: 3%;
 	margin: 0.1rem; 
/*  	border: 0; */
/*  	background: rgb(127, 127, 127);  */
/*  	color: white;  */
}
 table td {
/* 	width: 73%; */
	height: 2rem;
/*   	padding-left: 3%;   */
	padding-right: 1rem;
	text-align: right;
	vertical-align: middle;
/*  	padding: 0.1rem; */
/*  	padding-left: 0.5rem; */
/*  	border-bottom: 0.1rem solid rgb(224, 224, 224); */
/*  	border: 0; */
/* 	background: rgb(224, 224, 224); */
}

/* 
table th img {
	max-width: 100%;
	max-height: 100%;
} */

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

.toggleBtn {
float: ri
}

</style>
</head>
<body>

<nav class="navbar fixed-top" style="height:3rem; background:white; color:black; padding: .5rem 1rem;border-bottom: 0.1rem solid rgb(224, 224, 224)">
   		<div style="float: left;">
   		  <a href="${pageContext.request.contextPath}/myPage" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a>
<!--     	  <a href="javascript:history.back()" style="color: black; margin-right: -3rem;"><i class="fa fa-arrow-left fa-lg" aria-hidden="true"></i></a> -->
    	  <span style="font-size: 1.25rem; position:relative; top:0.1rem; left: 3.5rem; font-weight: bold; color:black;">알림 설정</span>
    	  
  	 	</div>
      
      	<div class="col-4 d-flex justify-content-end align-items-right" style="margin-top: 0.5rem; margin-right: -1rem;">
		</div>
    </nav>



	<div class="na-content" style="    margin-bottom: 1.6rem;">

	<div>입찰자 알림</div>	
	<table class="table-hover">
		<tr>
			<th>경매 입찰</th>
			<td><input id="bidderBidNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
		</tr>
		<tr>
			<th>경매 마감임박</th>
			<td><input id="bidderImminentNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
		</tr>
		<tr>
			<td id="bidderImminentTime" colspan="2">*마감 <input id="setMin"  type="number" class="form-control" style="width: 20%; display: inline-block;" value="${noticeSettingVO.bidderImminentTime }"> 분 전 알림 <button id="immSuccessModal" class="btn btn-primary">설정</button></td>
		</tr>
		<tr>
			<th>경매 마감</th>
			<td><input id="bidderClosedNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
		</tr>
	</table>
	
<!-- 	마감 알림시간 설정완료 안내 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 10rem;">
   <div class="modal-dialog"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
      <div class="modal-content">
         <div class="modal-body" style="text-align: center; margin: 1rem;">
            경매 마감임박 알림 설정이 완료되었습니다.
         </div>
        
         <div class="modal-footer" style="border-top:0; padding:0; ">
          		<table style="margin-bottom: 0;">
			<tr>
				<td id="confirmSetting" style="text-align: center; height: 2.4rem; font-size: 1rem; border-top:0.1rem solid rgb(224, 224, 224);" id="confirm" data-dismiss="modal" >확인</td>
			</tr>
		</table>
         </div>
      </div>
   </div>
</div>

	<br>
	<div>출품자 알림</div>
	
	<table class="table-hover">
		<tr>
			<th>입찰자의 입찰</th>
			<td><input id="sellerBidNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
		</tr>
		<tr>
			<th>상품 좋아요</th>
			<td><input id="sellerLikeNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
		</tr>
		<tr>
			<th>경매 마감</th>
			<td><input id="sellerClosedNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
		</tr>
		<tr>
			<th>상품 매입확정</th>
			<td><input id="sellerPurchaseConfirmNotice" type="checkbox" checked data-toggle="toggle" data-onstyle="success"></td>
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
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
      <script type="text/javascript">

      
      // checked true or false ?
  	if(${noticeSettingVO.bidderBidNotice == 'true'}) {
      $("input:checkbox[id='bidderBidNotice']").prop("checked", true); /* by ID */
  	} else {
      $("input:checkbox[id='bidderBidNotice']").prop("checked", false); /* by ID */
  	}

  	if(${noticeSettingVO.bidderImminentNotice == 'true'}) {
      $("input:checkbox[id='bidderImminentNotice']").prop("checked", true); /* by ID */
      $("#bidderImminentTime").show()
  	} else {
      $("input:checkbox[id='bidderImminentNotice']").prop("checked", false); /* by ID */
      $("#bidderImminentTime").hide()
  	}

  	if(${noticeSettingVO.bidderClosedNotice == 'true'}) {
      $("input:checkbox[id='bidderClosedNotice']").prop("checked", true); /* by ID */
  	} else {
      $("input:checkbox[id='bidderClosedNotice']").prop("checked", false); /* by ID */
  	}

  	if(${noticeSettingVO.sellerBidNotice == 'true'}) {
      $("input:checkbox[id='sellerBidNotice']").prop("checked", true); /* by ID */
  	} else {
      $("input:checkbox[id='sellerBidNotice']").prop("checked", false); /* by ID */
  	}

  	if(${noticeSettingVO.sellerLikeNotice == 'true'}) {
      $("input:checkbox[id='sellerLikeNotice']").prop("checked", true); /* by ID */
  	} else {
      $("input:checkbox[id='sellerLikeNotice']").prop("checked", false); /* by ID */
  	}

  	if(${noticeSettingVO.sellerClosedNotice == 'true'}) {
      $("input:checkbox[id='sellerClosedNotice']").prop("checked", true); /* by ID */
  	} else {
      $("input:checkbox[id='sellerClosedNotice']").prop("checked", false); /* by ID */
  	}

  	if(${noticeSettingVO.sellerPurchaseConfirmNotice == 'true'}) {
      $("input:checkbox[id='sellerPurchaseConfirmNotice']").prop("checked", true); /* by ID */
  	} else {
      $("input:checkbox[id='sellerPurchaseConfirmNotice']").prop("checked", false); /* by ID */
  	}


      $("#immSuccessModal").click(function() {
    	  $("#confirmSetting").css("background", "white");
    	  bidderImminentTime = $("#setMin").val()
    	  console.log("바뀐 bidderImminentTime : " +bidderImminentTime)
    	  changeNoticeSetting()
    	  $(".modal").modal("show")
		
	})
	
	$("#confirmSetting").click(function() {
		$(".modal").modal("hide")
		$(this).css("background", "rgb(224, 224, 224)");
	})
	
      
      $("#bidderImminentNotice").change(function(event) {
		console.log(event.currentTarget.checked);
		if(event.currentTarget.checked == true){
	    	  $("#bidderImminentTime").show()
		} else {
	    	  $("#bidderImminentTime").hide() 
		}
	})
	
		// 변경된 세팅값 가져오기
		let bidderBidNotice = ${noticeSettingVO.bidderBidNotice}
      console.log("기존 bidderBidNotice : " + bidderBidNotice)
		let bidderImminentNotice = ${noticeSettingVO.bidderImminentNotice};
		let bidderImminentTime = ${noticeSettingVO.bidderImminentTime};
  	  console.log("기존 bidderImminentTime : " +bidderImminentTime)

		let bidderClosedNotice = ${noticeSettingVO.bidderClosedNotice};
		let sellerBidNotice = ${noticeSettingVO.sellerBidNotice};
		let sellerLikeNotice = ${noticeSettingVO.sellerLikeNotice};
		let sellerClosedNotice = ${noticeSettingVO.sellerClosedNotice};
		let sellerPurchaseConfirmNotice = ${noticeSettingVO.sellerPurchaseConfirmNotice};
		
		 $("#bidderBidNotice").change(function(event) {
	    	  bidderBidNotice = event.currentTarget.checked;
      console.log("변경된 bidderBidNotice : " + bidderBidNotice)
      changeNoticeSetting()
	  	})
	      $("#bidderImminentNotice").change(function(event) {
	    	  bidderImminentNotice = event.currentTarget.checked;
	    	  changeNoticeSetting()
	  	})
	      $("#bidderClosedNotice").change(function(event) {
	    	  bidderClosedNotice = event.currentTarget.checked;
	    	  changeNoticeSetting()
	  	})
	      $("#sellerBidNotice").change(function(event) {
	    	  sellerBidNotice= event.currentTarget.checked;
	    	  changeNoticeSetting()
	  	})
	      $("#sellerLikeNotice").change(function(event) {
	    	  sellerLikeNotice= event.currentTarget.checked;
	    	  changeNoticeSetting()
	  	})
	      $("#sellerClosedNotice").change(function(event) {
	    	  sellerClosedNotice= event.currentTarget.checked;
	    	  changeNoticeSetting()
	  	})
	      $("#sellerPurchaseConfirmNotice").change(function(event) {
	    	  sellerPurchaseConfirmNotice= event.currentTarget.checked;
	    	  changeNoticeSetting()
	  	})
	  	
		
	// ajax로 db테이블에 on/off 변경값 반영하기
	function changeNoticeSetting() {
		
		$.ajax({
		     
		  	url : "${pageContext.request.contextPath}/noticeSettingProcess",
		  	type : 'post',
		  	data : {
		  		bidderBidNotice : bidderBidNotice,
		  		bidderImminentNotice : bidderImminentNotice,
		  		bidderImminentTime : bidderImminentTime,
		  		bidderClosedNotice : bidderClosedNotice,
		  		sellerBidNotice : sellerBidNotice,
		  		sellerLikeNotice : sellerLikeNotice,
		  		sellerClosedNotice : sellerClosedNotice,
		  		sellerPurchaseConfirmNotice : sellerPurchaseConfirmNotice
		  	},
		  	success : function() {
				console.log("성공")
			}, error : function() {
				console.log("실패")
			}
		})
		
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