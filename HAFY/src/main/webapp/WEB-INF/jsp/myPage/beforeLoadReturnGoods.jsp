<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
		<tbody>
		
		<c:forEach items="${returnGoodsMap}" var="auc">
			<tr onclick="goDetail(${auc.value.no})">
				<th scope="row">
<!-- 					<span class="ongoing" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 진행중 </span> -->
<%-- 					<img src="<%=request.getContextPath()%>/upload/${auc.key}"> --%>
				<c:choose>
					<c:when test="${auc.value.purchaseConfirm == '환불요청중' }">
						<span id="returningTag${auc.value.no}" class="returning" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 환불중 </span>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불완료' }">
						<span id="returnedTag${auc.value.no}" class="returning" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 환불완료 </span>
					</c:when>
					<c:when test="${auc.value.endDate <= nowTime }">
						<span id="closedTag${auc.value.no}" class="closed" style="display: table; font-size: 0.8rem; margin-left: 0.4rem;" > 마감 </span>
					</c:when>
				</c:choose>

					<span id="confirmedTag${auc.value.no}" class="confirmed" style="display: table; display:none; font-size: 0.8rem; margin-left: 0.4rem;" > 확정 </span>
					<span id="returningTag${auc.value.no}" class="returning" style="display: table; display:none; font-size: 0.8rem; margin-left: 0.4rem;" > 환불중 </span>
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
			<tr>
				<c:choose>
					<c:when test="${auc.value.purchaseConfirm == '미확정' }">
						<td id="confirm${auc.value.no}" colspan="2" style="text-align:center; border-top: 0rem;">
<!-- 							<button type="button" class="btn btn-primary btn-block" style="margin-top: -0.5rem;  -->
<%-- 								margin-bottom: 0.2rem;" onclick="confirmPurchase(${winAuc.value.no})">매입확정</button> --%>
							<button type="button" class="btn btn-primary" style="width:49%; margin-top: -0.5rem; 
								margin-bottom: 0.2rem;" onclick="openConfirmModal(${auc.value.no}, '${auc.value.memberNick }',${auc.value.winningBid })">매입확정</button>
							<button type="button" class="btn btn-primary" style="background:orangered; border:orangered; width:49%;margin-top: -0.5rem; 
								margin-bottom: 0.2rem;" onclick="goReturnForm(${auc.value.no})">환불요청</button>
						</td>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '확정' }">
						<td colspan="2" style="border-top: 0rem;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">매입확정 완료</button>
						</td>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불요청중' }">
						<td colspan="2" style="border-top: 0rem;">
							<button onclick="goReturnDetail(${auc.value.no})" type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불요청중 (글보기)</button>
						</td>
					</c:when>
					<c:when test="${auc.value.purchaseConfirm == '환불완료' }">
						<td colspan="2" style="border-top: 0rem;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불완료</button>
						</td>
					</c:when>
				</c:choose>
				<td id="confirmed${auc.value.no}" colspan="2" style="border-top: 0rem; display: none;">
					<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">매입확정 완료</button>
				</td>
				<td id="returning${auc.value.no}" colspan="2" style="border-top: 0rem; display: none;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불요청중</button>
				</td>
				<td id="returned${auc.value.no}" colspan="2" style="border-top: 0rem; display: none;">
							<button type="button" class="btn btn-secondary btn-block" style="margin-top: -0.5rem; margin-bottom: 0.2rem;">환불완료</button>
				</td>
			</tr>
			</c:forEach>
			
		</tbody>