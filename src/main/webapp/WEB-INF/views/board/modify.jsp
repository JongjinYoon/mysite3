<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div id="board">
				<form class="board-form" method="post" action="${pageContext.servletContext.contextPath }/board">
				<input type = "hidden" name = "a" value="modify">
					<input type='hidden' name="no" value='${no }'>
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글수정</th>
						</tr>
						<c:set var="count" value='${fn:length(list) }' />
						<c:forEach items='${list }' var='vo' varStatus='status'>
							<c:choose>
								<c:when test='${no == vo.no }'>
									<tr>
										<td class="label">제목</td>
										<td><input type="text" name="title" value="${vo.title }"></td>

									</tr>
									<tr>
										<td class="label">내용</td>

										<td colspan=4><textarea id="content" name="content">${fn:replace(vo.content, newline, '<br>') }</textarea>
										</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
					<div class="bottom">
						<a href="${pageContext.servletContext.contextPath }/board?a=list">취소</a>
						<input type="submit" value="수정">
					</div>
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="board" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>