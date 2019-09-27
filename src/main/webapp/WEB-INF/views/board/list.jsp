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
				<form id="search_form" action="" method="post">
					<input type="text" id="kwd" name="kwd" value=""> <input
						type="submit" value="찾기">
				</form>
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>
					<c:set var="count" value='${fn:length(list) }' />
					<c:forEach items='${list }' var='vo' varStatus='status'>
						<tr>
							<td>${count - status.index }</td>
							<c:choose>
								<c:when test="${vo.title eq '삭제된 게시물입니다.' }">
									<td onclick='event.cancelBubble=true;'>${vo.title }</td>
								</c:when>
								<c:when test="${vo.depth > 0 }">
									<td style='padding-left:${50*vo.depth }px'><img
										src="${pageContext.servletContext.contextPath }/assets/images/reply.png" />
										<a
										href="${pageContext.servletContext.contextPath }/board/view/${vo.no }">${vo.title }</a></td>
								</c:when>

								<c:when test="${vo.depth eq 0 }">
									<td style='padding-left:${50*vo.depth }px'><a
										href="${pageContext.servletContext.contextPath }/board/view/${vo.no }">${vo.title }</a></td>
								</c:when>
							</c:choose>

							<td>${vo.name }</td>
							<td>${vo.hit }</td>
							<td>${vo.regDate }</td>
							<c:choose>
								<c:when test='${authUser.no == vo.userNo }'>
									<td><a
										href="${pageContext.servletContext.contextPath }/board/delete/${vo.no }/${vo.gNo}"
										class="del">삭제</a></td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</table>

				<!-- pager 추가 -->
				<div class="pager">
					<ul>
						<c:if test="${ curPage > 5 }">
							<li><a
								href="${pageContext.servletContext.contextPath }/board/${ blockStartNum - 1 }">◀</a></li>
						</c:if>
						<c:forEach var="i" begin="${ blockStartNum }"
							end="${ blockLastNum }">
							<c:choose>
								<c:when test="${ i > lastPage }">
									<li>${ i }</li>
								</c:when>
								<c:when test="${ i == curPage }">
									<li class="selected">${ i }</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.servletContext.contextPath }/board/${ i }">${ i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${ lastPage > blockLastNum }">
							<li><a
								href="${pageContext.servletContext.contextPath }/board/${ blockLastNum + 1 }">▶</a></li>
						</c:if>
					</ul>
				</div>
				<!-- pager 추가 -->
				<c:choose>
					<c:when test="${authUser != null }">
						<div class="bottom">
							<input type='hidden' name='a' value='write'> <a
								href="${pageContext.servletContext.contextPath }/board/write"
								id="new-book">글쓰기</a>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp">
			<c:param name="menu" value="board" />
		</c:import>
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>