<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("newline", '\n');
%>

<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link
	href="${pageContext.servletContext.contextPath }/assets/css/board.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="board" class="board-form">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<c:set var="count" value='${fn:length(list) }' />
					<c:forEach items='${list }' var='vo' varStatus='status'>
						<c:choose>
							<c:when test='${no eq vo.no }'>
								<tr>
									<td class="label">제목</td>
									<td>${vo.title }</td>
								</tr>
								<tr>
									<td class="label">내용</td>
									<td colspan=4>${fn:replace(vo.content, newline, '<br>') }</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>

				</table>
				<div class="bottom">
					<c:forEach items='${list }' var='vo' varStatus='status'>
									<c:if test='${no == vo.no && authUser.no == vo.userNo}'>
										<a
											href="${pageContext.servletContext.contextPath }/board/modifyform/${no }">글수정</a>
									</c:if>
						
					</c:forEach>
					<c:forEach items='${list }' var='vo' varStatus='status'>
					<c:if test="${authUser != null}">
					<c:if test="${no == vo.no }">
						<a href="${pageContext.servletContext.contextPath }/board/write/${vo.gNo }/${vo.oNo }/${vo.depth }">답글</a>
						<a href="${pageContext.servletContext.contextPath }/board/list">글목록</a>
					</c:if>
					</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="board" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>