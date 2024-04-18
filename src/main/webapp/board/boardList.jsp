<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/shopping.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>

	<div style="margin: 0 0 0 150px; width:200px;">
		<a id="logo" href="index_real.jsp"><img
			src="https://dogpre.com/images/dogpre/mobileLoginLogo.png" alt="logo"></a>
	</div>

	<div id="wrap" align="center">
		<h1>고객센터</h1>
		<table class="list">
			<tr>
				<td colspan="5" style="border: white; text-align: right">
					<form action="BoardServlet" method="GET" class="write">
						<input type="hidden" name="command" value="board_write_form">
						<button type="submit">게시글 등록</button>
					</form>

				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:forEach var="board" items="${boardList }">
				<tr class="record">
					<td>${board.num }</td>
					<td>${board.category}</td>
					<td><a href="BoardServlet?command=board_view&num=${board.num}">
							${board.title } </a></td>
					<td>${board.username}</td>
					<td><fmt:formatDate value="${board.writedate }" /></td>
					<td>${board.readcount}</td>

				</tr>
			</c:forEach>
		</table>
	</div>
	
	<footer>
		<div class="footlogo">
			<img src="https://i.postimg.cc/s2413xzp/image.png" alt="하단로고">
		</div>

		<div class="footintro">
			<ul>
				<li><a href="#">회사소개</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">제휴 입점 및 문의</a></li>
				<li><a href="#">사업자 정보</a></li>

			</ul>
		</div>
		<div class="footintro2">
			<ul>
				<li>대표자 김도성</li>
				<li>사업자등록번호 127-86-32494</li>
				<li>주소 서울특별시 강남구 삼성로 570 석천빌딩 지하 1층</li>
				<li>통신판매업 제 2013-서울강남-01570호</li>
				<li>개인정보보호책임자 최온섭</li>
				<li>팩스 02-585-8477<br></li>

				<li>Tel. 1588-2469</li>
				<li>Email. <a href="#">webmaster@funnc.com<br></a></li>

			</ul>
			<a href="#" class="chatting">채팅문의</a>

		</div>


		<hr />
		

	</footer>
</body>
</html>