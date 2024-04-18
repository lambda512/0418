<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>


	<div style="margin: 0 0 0 150px; width: 200px;">
		<a id="logo" href="index_real.jsp"><img
			src="https://dogpre.com/images/dogpre/mobileLoginLogo.png" alt="logo"></a>
	</div>

	<div id="wrap" align="center">
		<h1>상품 리스트 - 관리자 페이지</h1>
		<table class="list">
			<tr>
				<td colspan="6" style="border: white; text-align: right"><a
					href="productWrite.do">상품 등록</a></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>브랜드명</th>
				<th>제품명</th>
				<th>가격</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="product" items="${productList}">
				<tr class="record">
					<td>${product.code}</td>
					<td>${product.name}</td>
					<td>${product.intro}</td>
					<td>${product.realPrice}원</td>
					<td><a href="productUpdate.do?code=${product.code}">상품 수정</a>
					</td>
					<td><a href="productDelete.do?code=${product.code}">상품 삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>