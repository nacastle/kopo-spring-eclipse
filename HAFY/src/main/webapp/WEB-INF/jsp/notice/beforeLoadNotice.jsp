<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<tbody id="notiTbody" class="wow bounceInUp">
			<c:forEach items="${noticeMap }" var="notice">
				<c:choose>
					<c:when test="${notice.key.notiReadDatetime eq null}">
						<tr class="unRead" onclick="goDetail('${notice.key.notiType}',${notice.key.notiContentNo },${notice.key.notiNo })">
					</c:when>
					<c:otherwise>
						<tr onclick="goDetail('${notice.key.notiType}',${notice.key.notiContentNo },${notice.key.notiNo })">
					</c:otherwise>
				</c:choose>
						<th>
							<c:choose>
								<c:when test="${notice.key.notiType == 'goodsDetail'}">
									<img style="width: 5rem;" src="${pageContext.request.contextPath }/upload/${notice.value}">
								</c:when>
								<c:otherwise>
									<img style="width: 5rem;" src="${pageContext.request.contextPath}/resources/img/hafy.png">
								</c:otherwise>
							</c:choose>
						</th>
						<td>
							<div>${notice.key.notiMsg }</div>
							<div style="color: rgb(127, 127, 127); font-size: .8rem">${notice.key.notiDatetime }</div>
						</td>
					</tr>
			</c:forEach>
			
		</tbody>
		
		<script>
			if(notiScrollCnt == 1) {
				$("#notiTbody").removeClass("wow bounceInUp")
			}
			
			</script>