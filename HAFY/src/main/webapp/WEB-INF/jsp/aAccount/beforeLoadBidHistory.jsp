<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<tbody id="historyTbody" class="wow fadeInUp" >
				
	  <c:forEach items="${aTranzList }" var="aTranzVO" >
					<c:set value="${aTranzVO.tranzDate }" var="tranzDate" scope="page"></c:set>
				<tr>
					<th scope="row" style="padding: 0.75rem 0rem;">${fn:substring(tranzDate,5,10) }</th>
					<td style="width: 40%;">
						<div style="font-weight: bold;">${aTranzVO.tranzMemberNick }</div>
						<div style="font-size:0.8rem; color:#8f8f8f">${fn:substring(tranzDate,11,19) } | ${aTranzVO.tranzType }</div>
					</td>
					<td>
					<c:choose>
						<c:when test="${aTranzVO.tranzType == '입금' }">
						<div style="color: green;">+<fmt:formatNumber value="${aTranzVO.tranzMoney }" pattern="#,###"/> 원</div>
						</c:when>
						<c:otherwise>
						<c:set var="tranzMoney"  value="${aTranzVO.tranzMoney}" scope="page"></c:set>
<%-- 						<c:set var="tranzMoneyLength" value="${fn:length(tranzMoney)}" scope="page"></c:set> --%>
<%-- 						<div style="color: rgb(243, 156, 18);">${fn:substring(tranzMoney,0,1)} ${fn:substring(tranzMoney,1,tranzMoneyLength)} 원</div> --%>
						<div style="color: rgb(243, 156, 18);"><fmt:formatNumber value="${tranzMoney}" pattern="#,###"/> 원</div>
						</c:otherwise>
					</c:choose>
						<div style="font-size:0.8rem; color:#8f8f8f"><fmt:formatNumber value="${aTranzVO.memberBalance }" pattern="#,###"/> 원</div>
					</td>
				</tr>
				</c:forEach>
					
				
				
			</tbody>
			
			<script>
			if(historyScrollCnt == 1) {
				$("#historyTbody").removeClass("wow bounceInUp")
			}
			
			</script>
			
			
			