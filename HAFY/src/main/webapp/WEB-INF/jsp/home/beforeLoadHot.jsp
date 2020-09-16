<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/wow/css/libs/animate.css"> --%>

		<c:forEach items="${hotAucMap}" var="auc">
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
					<div style="display:table; font-size:0.8rem; background: rgb(224, 224, 224);">마감: ${auc.value.endDate }</div>
					<c:choose>
						<c:when test="${auc.value.winningBid == 0}">
							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ${auc.value.startPrice } 원</div>
						</c:when>
						<c:otherwise>
							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ${auc.value.winningBid } 원</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>

<%-- <script src="${pageContext.request.contextPath }/resources/wow/dist/wow.min.js"></script> --%>
<script type="text/javascript">
  
// 	new WOW().init(); 
</script>
