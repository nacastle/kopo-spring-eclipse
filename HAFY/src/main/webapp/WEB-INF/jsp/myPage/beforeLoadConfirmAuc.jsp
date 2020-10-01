<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
		<tbody>
		
		<c:forEach items="${purchaseConfirmMap}" var="auc">
			<tr onclick="goDetail(${auc.value.no})">
				<th scope="row">
<!-- 					<span class="ongoing" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 진행중 </span> -->
<%-- 					<img src="<%=request.getContextPath()%>/upload/${auc.key}"> --%>
				<c:choose>
					<c:when test="${auc.value.purchaseConfirm == '확정' }">
						<span class="confirmed" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 확정 </span>
					</c:when>
					<c:when test="${auc.value.endDate <= nowTime }">
						<span class="closed" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 마감 </span>
					</c:when>
				</c:choose>
					<img src="${pageContext.request.contextPath }/upload/${auc.key}">

				</th>
				<td>
					<div style="font-weight: bold; font-size: 1rem;">${auc.value.name }</div>
					<div style="display:table; font-size:0.8rem; background: rgb(224, 224, 224);">마감: ${auc.value.endDate }</div>
<%-- 					<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: ${like.value.winningBid } 원</div> --%>
					<c:choose>
						<c:when test="${auc.value.endDate <= nowTime }">
							<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;background: black;display: inline-block;color: wheat;">낙찰가: <fmt:formatNumber value="${auc.value.winningBid }" pattern="#,###"/> 원</div>
						</c:when>
						<c:otherwise>
						<c:choose>
							<c:when test="${auc.value.winningBid == 0}">
								<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: <fmt:formatNumber value="${auc.value.startPrice }" pattern="#,###"/>원</div>
							</c:when>
							<c:otherwise>
								<div style="margin-top:0.4rem; font-weight: bold; font-size: 1rem;">현재가: <fmt:formatNumber value="${auc.value.winningBid }" pattern="#,###"/> 원</div>
							</c:otherwise>
						</c:choose>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:forEach>
			
		</tbody>