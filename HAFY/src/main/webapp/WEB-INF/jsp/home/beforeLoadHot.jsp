<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/wow/css/libs/animate.css"> --%>



<tbody id="hotTbody" class="wow bounceInUp" >
		<c:forEach items="${hotAucMap}" var="auc" >
			<tr onclick="goDetail(${auc.value.no})">
<%-- 			<tr class="wow bounceInRight" onclick="goDetail(${auc.value.no})"> --%>
				<th scope="row">
				<c:choose>
					<c:when test="${auc.value.startDate > nowTime }">
						<span class="waiting" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 대기중 </span>
					</c:when>
					<c:when test="${auc.value.startDate <= nowTime and  auc.value.endDate > nowTime  }">
						<span class="ongoing" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 진행중</span>
					</c:when>
					<c:when test="${auc.value.endDate <= nowTime }">
						<span class="closed" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 마감 </span>
					</c:when>
				</c:choose>
<%-- 					<img src="<%=request.getContextPath()%>/upload/${auc.key}"> --%>
					<img src="${pageContext.request.contextPath }/upload/${auc.key}">

				</th>
				<td>
					<div style="font-weight: bold; font-size: 1rem;">${auc.value.name }</div>
					<c:choose>
						<c:when test="${auc.value.startDate > nowTime }">
							<div style="display:table; font-size:0.8rem; background: rgb(224, 224, 224);">시작 ${auc.value.detail }</div>
						</c:when>
						<c:otherwise>
							<div style="display:table; font-size:0.8rem; background: rgb(224, 224, 224);">마감 ${auc.value.detail }</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${auc.value.winningBid == 0}">
<%-- 							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ${auc.value.startPrice } 원</div> --%>
							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: 
							<fmt:formatNumber value="${auc.value.startPrice }" pattern="#,###"/>
							 원</div>
						</c:when>
						<c:otherwise>
<%-- 							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ${auc.value.winningBid } 원</div> --%>
							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가:
							<fmt:formatNumber value="${auc.value.winningBid }" pattern="#,###"/> 
							원</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
</tbody>
			
<%-- 			<tr id="${hotScrollCnt}" style="display: none;"> --%>
<!-- 				<td colspan="2" style="color:orange; text-align: center;"> -->
<!-- 					<i class="fa fa-spinner fa-spin fa-2x fa-fw"></i> -->
<!-- 					<span class="sr-only">Loading...</span> -->
<!-- 				</td> -->
<!-- 			</tr> -->

<%-- <script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script> --%>
	<script type="text/javascript">
	$(window).scrollTop(hotScrollLocation);
	
	if(hotScrollCnt == 1) {
		$("#hotTbody").removeClass("wow bounceInUp")
	}
	
	
	
	
// 	console.log("before에서 hotScrollCnt: " + ${hotScrollCnt})
// 	console.log("before에서 id")
// 	console.log("#"+hotScrollCnt)
// 	var contents = '${contents}';
	
// 	let hotScrollCnt = ${hotScrollCnt}


	
// 	if (contents != 'empty') {
// 		$("#${hotScrollCnt}").show()
// 		setTimeout(function() {
			
// 			$("#${hotScrollCnt}").hide()
// 		}, 
// 		1000);
// 	}
	
	  
		// 	new WOW().init(); 
// 		var contents = "<c:out value='${contents}'/>";
// 		console.log("contents" + contents)
// // 		console.log("hotScrollCnt" + hotScrollCnt)
		
// // 		let loadingCnt = parseInt(${hotScrollCnt}) + 1
// // 		console.log(loadingCnt)
		
// 		if (contents != 'empty'  ) {
// 			setTimeout(function() {  
// 			$("#${hotScrollCnt}" ).show()
// // 			$("#"+loadingCnt ).show()
// // 			$("#loading${hotScrollCnt}").hide()
// 				}, 
// 				500);
// 		} else {
// 			$("#" + loadingCnt ).hide()
			
// 		}
	
	</script>
