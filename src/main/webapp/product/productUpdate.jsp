<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
<script type="text/javascript" src="script/product.js"></script>
</head>
<body>
	<div id="wrap" align="center">
		<h2>상품 수정 - 관리자 페이지</h2>
		<form method="post" enctype="multipart/form-data" name="frm">
			<input type="hidden" name="code" value="${product.code}"> <input
				type="hidden" name="nonmakeImg" value="${product.imgUrl}">
			<table>
				<tr>
					<td><c:choose>
							<c:when test="${empty product.imgUrl}">
								<img src="upload/noimage.gif">
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${product.imgUrl.startsWith('http')}">
										<img src="${product.imgUrl}">
									</c:when>
									<c:otherwise>
										<img src="${product.imgUrl}">
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose></td>
					<td>
						<table>
							<tr>
								<th style="width: 80px">상 품 명</th>
								<td><input type="text" name="productname"
									value="${product.intro}" size="80"></td>
							</tr>
							<tr>
								<th>최 종 가</th>
								<td><input type="text" name="price"
									value="${product.realPrice}"> 원</td>
							</tr>
							<tr>
								<th>사진</th>
								<td><input type="file" name="imgUrl"><br>
									(주의사항 : 이미지를 변경하고자 할때만 선택하시오)</td>
							</tr>

						</table> <br> <input type="submit" value="수정"
						onclick="return productCheck()"> <input type="reset"
						value="다시 수정"> <input type="button" value="목록"
						onclick="location.href='productList.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>