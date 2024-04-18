<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="script/member.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>

<link href="css/main.css" rel="stylesheet" />

</head>
<body>
	<header>
		<div>
			<a id="logo" href="index_real.jsp"><img
				src="https://dogpre.com/images/dogpre/mobileLoginLogo.png"
				alt="logo"></a>
		</div>

		<div id="icon">
			<a href="#">
				<div class="upicon1">
					<img
						src="https://cdn4.iconfinder.com/data/icons/simple-goods-services-outline/30/running-512.png"
						alt="run">

				</div>

				<div class="upicon1">
					<img
						src="https://cdn0.iconfinder.com/data/icons/ecommerce-207/32/Coupon-256.png"
						alt="coupon">

				</div>

				<div class="upicon1">
					<img
						src="https://cdn2.iconfinder.com/data/icons/squircle-ui/32/Avatar-256.png"
						alt="person">

				</div>

				<div class="upicon1">
					<img
						src="https://cdn0.iconfinder.com/data/icons/phosphor-regular-vol-4/256/shopping-cart-256.png"
						alt="icon4">

				</div>
			</a>
		</div>
		<div class="login">
			<ul>
				<li>
					<%
					if (session.getAttribute("loginUser") != null) {
					%>
					<p>
						환영합니다,
						<%=((com.dino.dto.MemberVO) session.getAttribute("loginUser")).getUserid()%>
						님!
					</p> <a href="logout.do">로그아웃</a> <a href="productList.do">관리자 페이지로
						가기</a> <%
 } else {
 %> <a href="login.do"> <%-- 로그인 아이콘 또는 이미지를 추가하고 싶다면 여기에 추가하세요 --%>
						로그인
				</a> <%
 }
 %>
				</li>


				<%-- 세션에 로그인 사용자 정보가 없는 경우에만 회원가입 링크를 표시 --%>
				<%
				if (session.getAttribute("loginUser") == null) {
				%>
				<li><a href="join.do">회원가입</a></li>
				<%
				}
				%>

				<li><a href="#">주문조회</a></li>

				<li><a
					href="<%=response.encodeRedirectURL("http://localhost:8080/web_13/BoardServlet?command=board_list")%>">고객센터</a></li>

			</ul>

		</div>

		<div class="search">
			<input type="text" placeholder=""> <img
				src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
				alt="search">
		</div>

		<nav>
			<ul>
				<li><a href="#">핫딜</a></li>

				<li><a href="#">체험단</a></li>

				<li><a href="#">랭킹</a></li>

				<li><a href="#">신상품</a></li>

				<li><a href="#">브랜드</a></li>

				<li><a href="#">샘플체험</a></li>

				<li><a href="#">이벤트</a></li>

				<li><a href="#">스티커샵</a></li>

			</ul>
		</nav>

		<div id="category">

			<ul>
				<li><a href="#">카테고리</a>
					<ul>
						<li><a href="#">사료</a></li>
						<li><a href="#">간식</a></li>
						<li><a href="#">건강관리</a></li>
						<li><a href="#">위생/배변</a></li>
						<li><a href="#">미용/목욕</a></li>
						<li><a href="#">급식기/급수기</a></li>
						<li><a href="#">하우스/울타리</a></li>
						<li><a href="#">이동장</a></li>
						<li><a href="#">의류/액세서리</a></li>
						<li><a href="#">목줄/인식표/리드줄</a></li>
						<li><a href="#">장난감</a></li>
						<li><a href="#">훈련</a></li>
						<li><a href="#">생활/가전</a></li>
					</ul></li>


			</ul>
		</div>

	</header>
	<div class="login_con">
		<div class="img_con">
			<img src="https://dogpre.com/images/dogpre/mobileLoginLogo.png">
		</div>
		<form action="login.do" method="post" name="frm">
			<table>
				<!-- 아이디 입력란 -->
				<tr>
					<td><input type="text" name="userid"
						placeholder="아이디 또는 이메일을 입력해주세요." value="${userid}" required
						class="MuiInputBase-input" aria-invalid="false"
						style="width: 443px; height: 53px;"></td>
				</tr>
				<!-- 비밀번호 입력란 -->
				<tr>
					<td><input type="password" name="pwd"
						placeholder="비밀번호를 입력해주세요." required
						class="MuiInputBase-input MuiFilledInput-input jss1145"
						aria-invalid="false" style="width: 443px; height: 53px;"></td>
				</tr>
				<tr>
					<!-- 로그인 버튼 -->
					<td align="center"><input type="submit" value="로그인"
						onclick="return loginCheck()"></td>
				</tr>
				<tr>
					<!-- 회원가입 버튼 -->
					<td align="center"><input type="button" value="회원가입"
						onclick="location.href='join.do'"></td>
				</tr>
				<tr>
					<td>${message}</td>
				</tr>
			</table>
		</form>
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
		<div class="bottomlogo">
			<img src="https://i.postimg.cc/ZY6XnCQZ/bottomlogo.png" alt="하단회사로고">
		</div>

	</footer>
</body>
</html>