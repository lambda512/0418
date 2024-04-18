<%@page import="com.dino.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.dino.dao.ProductDAO"%>
<%@ page import="com.dino.dto.ProductVO"%>
<%@ page import="util.DBManager"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>강아지대통령</title>
<link href="css/main.css" rel="stylesheet" />
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
</head>
<body>

	<header>
		<div class=logo_con>
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
						// 세션에서 사용자의 권한 정보를 가져옵니다.
						MemberVO user = (MemberVO) session.getAttribute("loginUser");
						int userAdmin = user.getAdmin();
						// 사용자의 권한이 관리자(1)인 경우에만 "관리자 페이지로 가기" 링크를 표시합니다.
						if (userAdmin == 1) {
					%>
					<p>
						환영합니다,
						<%=((com.dino.dto.MemberVO) session.getAttribute("loginUser")).getUserid()%>
						님!
					</p> <a href="logout.do">로그아웃</a> | <a href="productList.do">관리자
						페이지로 가기</a> <%
 } else {
 %> <!-- 사용자의 권한이 관리자가 아닌 경우에는 관리자 페이지로 가기 링크를 표시하지 않습니다. -->
					<p>
						환영합니다,
						<%=((com.dino.dto.MemberVO) session.getAttribute("loginUser")).getUserid()%>
						님!
					</p> <a href="logout.do">로그아웃</a> <%
 }
 %> <%
 } else {
 %> <a href="login.do">로그인</a> <%
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
				<li><a href="#"><img src="upload/grid.png">카테고리</a>
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

	<div class="carousel_main">
		<!-- 캐러셀 이미지 삽입 -->
		<div class="carousel_wrapper">
			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202401031042451.jpg"
					alt="slide1" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/goodsno_top1_back_202401020924151.jpg"
					alt="slide2" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202312260959251.jpg"
					alt="slide3" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/goodsno_top1_back_202401020921191.jpg"
					alt="slide4" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202312261640341.jpg"
					alt="slide5" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/goodsno_top1_back_202312071759581.jpg"
					alt="slide6" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202310191126411.jpg"
					alt="slide7" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202404031513071.jpg"
					alt="slide8" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202403291520331.jpg"
					alt="slide9" />
			</div>

			<div class="carousel_slide">
				<img
					src="https://img.dogpre.com/web/dogpre/event/main_banner/sno_top1_back_202403291518251.jpg"
					alt="slide10" />
			</div>


		</div>

		<!-- 캐러셀 사이드 버튼 -->
		<div class="carousel_button_container">
			<button type="button" class="carousel_prev">

				<svg xmlns='http://www.w3.org/2000/svg' width='40' height='40'
					fill='currentColor' class='bi bi-chevron-double-left'
					viewBox='0 0 16 16'>
			    <path fill-rule='evenodd'
						d='M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z' />
			    <path fill-rule='evenodd'
						d='M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z' />
			</svg>

			</button>
			<button type="button" class="carousel_next">

				<svg xmlns='http://www.w3.org/2000/svg' width='40' height='40'
					fill='currentColor' class='bi bi-chevron-double-right'
					viewBox='0 0 16 16'>
		        <path fill-rule='evenodd'
						d='M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z' />
		        <path fill-rule='evenodd'
						d='M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z' />
   	 		</svg>

			</button>
		</div>


		<!-- 캐러셀 중앙 버튼 -->
		<div class="carousel_pagination">
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>
			<div class="carousel_circle"></div>

		</div>
	</div>
	<script type="text/javascript">
      $(document).ready(function(){
      const swiper = document.querySelector('.carousel_wrapper');
      const slides = document.querySelectorAll('.carousel_slide');
      const prevButtons = document.querySelectorAll('.carousel_prev');
      const nextButtons = document.querySelectorAll('.carousel_next');
      const bullets = document.querySelectorAll('.carousel_circle');

      let currentSlide = 0;
      let intervalId; // 전역 변수로 선언, intervalId는 setInterval 함수를 호출할 때마다 생성되는 타이머 객체

      function showSlide(slideIndex) {
    	  // 슬라이드 요소를 순회하면서 보여줄 슬라이드만 화면에 표시
          slides.forEach((slide, index) => {
              if (index === slideIndex) {
                  slide.style.display = 'block';
              } else {
                  slide.style.display = 'none';
              }
              bullets.forEach((bullet, index) => {
                  if (index === currentSlide) {
                      bullet.classList.add('active');
                  } else {
                      bullet.classList.remove('active');
                  }
              });
          });
      }

      function nextSlide() {
    	  if (currentSlide < slides.length - 1) {
              currentSlide++; // 다음 슬라이드 인덱스로 이동
          } else {
              currentSlide = 0; // 마지막 슬라이드일 때 첫 번째 슬라이드로 이동
          }
          showSlide(currentSlide);
         
      }
      
      function prevSlide() {
    	    stopAutoSlide(); // 이전 버튼 클릭 시 자동 넘김 중지
    	    if (currentSlide > 0) {
    	        currentSlide--; // 이전 슬라이드 인덱스로 이동
    	    } else {
    	        currentSlide = slides.length - 1; // 마지막 슬라이드로 이동
    	    }
    	    showSlide(currentSlide);
    	}
      
      function startAutoSlide() { // *3초마다 다음 슬라이드로 자동 넘기기
        intervalId = setInterval(nextSlide, 3000); // 
      }

      function stopAutoSlide() { // *슬라이드 인터벌 타이머 리셋
        clearInterval(intervalId);
      }

      startAutoSlide(); // *초기에 자동 넘김 시작

      slides.forEach((slide) => { 
        slide.addEventListener('mouseenter', stopAutoSlide);
        slide.addEventListener('mouseleave', startAutoSlide);
      });

      prevButtons.forEach((prevButton) => {
    	    prevButton.removeEventListener('click', prevSlide); // 이전에 등록된 이벤트 핸들러를 제거합니다.
    	    prevButton.addEventListener('click', prevSlide); // 새로운 이벤트 핸들러를 등록합니다.
    	});

      nextButtons.forEach((nextButton) => {
        nextButton.addEventListener('click', () => {
          stopAutoSlide(); // *다음 버튼 클릭 시 자동 넘김 중지
          nextSlide();
        });
      });

      bullets.forEach((bullet, index) => {
        bullet.addEventListener('click', () => {
          stopAutoSlide(); // *버튼 클릭 시 자동 넘김 중지
          showSlide(index);
        });
      });
      });
    </script>

	<section>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn2.iconfinder.com/data/icons/catchwords2/512/only_letter_catchword_lettering_sticker_stickers-256.png"
				style="display: block;"></a>
			<p class="iconmenu_text">강대온리</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/8277/8277649.png"
				style="display: block;"></a>
			<p class="iconmenu_text">사료</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/784/784062.png"
				style="display: block;"></a>
			<p class="iconmenu_text">간식</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/5308/5308565.png"
				style="display: block;"></a>
			<p class="iconmenu_text">건강관리</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/1132/1132061.png"
				style="display: block;"></a>
			<p class="iconmenu_text">위생/배변</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/3655/3655396.png"
				style="display: block;"></a>
			<p class="iconmenu_text">핫딜</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/3625/3625217.png"
				style="display: block;"></a>
			<p class="iconmenu_text">신상품</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/9717/9717870.png"
				style="display: block;"></a>
			<p class="iconmenu_text">랭킹</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/7526/7526142.png"
				style="display: block;"></a>
			<p class="iconmenu_text">쿠폰</p>
		</div>
		<div class="iconmenu">
			<a href="#"><img
				src="https://cdn-icons-png.flaticon.com/128/1851/1851036.png"
				style="display: block;"></a>
			<p class="iconmenu_text">회원혜택</p>
		</div>


	</section>

	<div id="mainad">
		<a href="#"><img
			src="https://img.dogpre.com/web/dogpre/event/main_banner/_top1_202308241730011.jpg"></a>
	</div>

	<article class="hotdeal_article">
		<h2>핫딜</h2>

		<div class="hotdeal_item">
			<div class="clock"></div>
			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/83/82749_list_L1_01519427.png"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">

				<li class=hotdeal_name>네이처스 버라이어티</li>


				<li class=hotdeal_intro>네이처스 버라이어티 인스팅트 RBK 헬시웨이트 9kg</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>171,000원</del></li>

				<li class=hotdeal_per>11%</li>

				<li class=hotdeal_realprice>152,000원</li>



			</ul>
			<button class="hotdeal_delivery">대통령배송</button>

		</div>
		<div class="hotdeal_item">
			<div class="clock"></div>
			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/84/83374_list_L1_01277202.png"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">
				<li class=hotdeal_name>마이플러피</li>

				<li class=hotdeal_intro>마이플러피 업백 네이비 L</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>138,000원</del></li>

				<li class=hotdeal_per>28%</li>

				<li class=hotdeal_per>28%</li>

				<li class=hotdeal_realprice>99,900원</li>

			</ul>
			<button class="hotdeal_delivery">대통령배송</button>
		</div>
		<div class="hotdeal_item">

			<div class="clock"></div>

			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/65/64843_list_L1_01855276.png"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">
				<li class=hotdeal_name>베베</li>

				<li class=hotdeal_intro>베베 폴딩 스파 욕조 블루</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>115,000원</del></li>

				<li class=hotdeal_per>45%</li>

				<li class=hotdeal_realprice>63,200원</li>

			</ul>
			<button class="hotdeal_delivery">대통령배송</button>
		</div>
		<div class="hotdeal_item">

			<div class="clock"></div>

			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/85/84174_list_L1_01512414.png"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">
				<li class=hotdeal_name>페로가토</li>

				<li class=hotdeal_intro>페로가토 아보카도 돔 하우스</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>43,000원</del></li>

				<li class=hotdeal_per>35%</li>

				<li class=hotdeal_realprice>28,000원</li>

			</ul>

			<script type="text/javascript">
				function updateClock(clock) {
	                const futureDate = new Date("2024-04-09T00:00:00");
	                const currentDate = new Date();
	                let timeDifference = futureDate - currentDate;

	                if (timeDifference < 0) {
	                    // 현재 시간이 미래 시간보다 큰 경우, 현재 시간에 1일을 더함
	                    futureDate.setDate(currentDate.getDate() + 1);
	                    timeDifference = futureDate - currentDate;
	                }

	                const hours = Math.floor(timeDifference / (1000 * 60 * 60));
	                const minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
	                const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

	                const formattedHours = padZero(hours);
	                const formattedMinutes = padZero(minutes);
	                const formattedSeconds = padZero(seconds);

	                const formattedTime = formattedHours + ':' + formattedMinutes + ':' + formattedSeconds +' 남음';

	                // 화면에 시간을 표시하는 코드 추가
	                clock.innerText = formattedTime;
	            }

				function padZero(num) {
                    return String(num).padStart(2, '0');
                }


	            const clocks = document.querySelectorAll(".clock");

	            function updateAllClocks() {
	                clocks.forEach(clock => {
	                    updateClock(clock);
	                });
	            }

	            // 최초 실행
	            updateAllClocks();

	            // 1초마다 업데이트
	            setInterval(updateAllClocks, 1000);


				</script>
			<button class="hotdeal_delivery">대통령배송</button>
		</div>




	</article>


	<div class=aside_back></div>
	<aside>


		<p class="today_intro">오늘만 이 가격</p>

		<div class="today_intro2">매일 오전 0시, 한정특가</div>

		<div class="today_back"></div>

		<div class="today_image">
			<img
				src="https://i.postimg.cc/YS5FvqqX/92349-event-19109-removebg-preview.png"
				style="display: box;">
		</div>

		<div class="today_container">
			<ul>
				<li class="count_clock"><img
					src="https://cdn-icons-png.flaticon.com/128/11477/11477403.png"
					alt="시계"></li>
				<li class="countdown"></li>

				<li class=item_name>코코시루 펫 꿀잠 해먹 CPH-S</li>

				<li class=today_per>37%</li>

				<li class=today_realprice>28,000원</li>

				<li class=today_trueprice><del>43,000원</del></li>

			</ul>
			<script type="text/javascript">
			$(document).ready(function(){
			    const clock = document.querySelector(".countdown");

			    function padZero(num) {
			        return String(num).padStart(2, '0');
			    }
			    
			    function getClock() {
			        let future = new Date("2024/04/09 00:00:00");
			        let now = new Date();
			        let diff = future - now;

			        // 미래 시간이 현재 시간보다 이전일 경우에만 처리
			        if (diff < 0) {
			            future.setDate(now.getDate() + 1); // 미래 시간을 현재 시간보다 1일 뒤로 설정
			            diff = future - now; // 다시 시간 차이 계산
			        }

			        // 일(day), 시(hour), 분(min), 초(sec) 계산
			        const days = Math.floor(diff / (1000 * 60 * 60 * 24));
			        const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			        const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
			        const secs = Math.floor((diff % (1000 * 60)) / 1000);

			        const h = padZero(hours);
			        const m = padZero(mins);
			        const s = padZero(secs);

			        const formattedTime = h + ':' + m + ':' + s;
			        clock.innerText = formattedTime;
			    }

			    getClock(); // 초기 호출
			    setInterval(getClock, 1000); // 1초마다 업데이트
			});



            	</script>
		</div>

	</aside>

	<!-- 이 상품 어때요? -->
	<article class="rec_article">
		<h2>이 상품 어때요?</h2>

		<div class="hotdeal_item">
			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/102/101233_list_L1_04226826.jpg"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">

				<li class=hotdeal_name>담무</li>


				<li class=hotdeal_intro>담무 강아지 떡국 밀키트 2개입</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>13,900원</del></li>

				<li class=hotdeal_per>34%</li>

				<li class=hotdeal_realprice>20,000원</li>



			</ul>
			<button class="hotdeal_delivery">대통령배송</button>

		</div>

		<div class="hotdeal_item">
			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/99/98414_list_L1_01081456.jpg"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">
				<li class=hotdeal_name>패리스독</li>

				<li class=hotdeal_intro>패리스독 스누피 누빔두루마기 한복세트 옐로우</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>22,000원</del></li>

				<li class=hotdeal_per>10%</li>

				<li class=hotdeal_realprice>19,800원</li>

			</ul>
			<button class="hotdeal_delivery">대통령배송</button>

		</div>

		<div class="hotdeal_item">


			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/97/96718_list_L1_01098830.png"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">
				<li class=hotdeal_name>로렌츠</li>

				<li class=hotdeal_intro>로렌츠 더 오래먹는 우신</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>15,900원</del></li>

				<li class=hotdeal_per>30%</li>

				<li class=hotdeal_realprice>11,200원</li>

			</ul>
			<button class="hotdeal_delivery">대통령배송</button>

		</div>

		<div class="hotdeal_item">

			<div class="img_container">
				<a href="#"><img
					src="https://img.dogpre.com/mobile/dogpre/product/87/86088_list_L1_01418709.png"
					style="display: block;"> </a>
			</div>

			<ul class="hotdeal_all">
				<li class=hotdeal_name>벳플러스</li>

				<li class=hotdeal_intro>벳플러스 사이노퀸 소현견용 관절영양제 30정</li>

				<li class=hotdeal_salelogo>강대할인가</li>

				<li class=hotdeal_trueprice><del>37,000원</del></li>

				<li class=hotdeal_per>11%</li>

				<li class=hotdeal_realprice>32,930원</li>


			</ul>
			<button class="hotdeal_delivery">대통령배송</button>
		</div>
	</article>

	<div id="mainad">
		<a href="#"><img
			src="https://img.dogpre.com/web/dogpre/event/main_banner/_top1_202310200918251.jpg"></a>
	</div>

	<article class=brandrec_article>
		<h2>브랜드 추천</h2>

		<div class="tabs_container">

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">퍼핑</li>
				<li class="tab-link" data-tab="tab-2">오리젠</li>
				<li class="tab-link" data-tab="tab-3">빅스비</li>
				<li class="tab-link" data-tab="tab-4">듀먼</li>
				<li class="tab-link" data-tab="tab-5">베니즈</li>
				<li class="tab-link" data-tab="tab-6">닥터맘마</li>
				<li class="tab-link" data-tab="tab-7">츄통령</li>
				<li class="tab-link" data-tab="tab-8">페스룸</li>
				<li class="tab-link" data-tab="tab-9">슈퍼포우</li>
				<li class="tab-link" data-tab="tab-10">굿데이</li>
				<li class="tab-link" data-tab="tab-11">키니키니</li>
				<li class="tab-link" data-tab="tab-12">누터스가든</li>
			</ul>

			<div id="tab-1" class="tab-content current"></div>
			<div id="tab-2" class="tab-content"></div>
			<div id="tab-3" class="tab-content"></div>
			<div id="tab-4" class="tab-content"></div>
			<div id="tab-5" class="tab-content"></div>
			<div id="tab-6" class="tab-content"></div>
			<div id="tab-7" class="tab-content"></div>
			<div id="tab-8" class="tab-content"></div>
			<div id="tab-9" class="tab-content"></div>
			<div id="tab-10" class="tab-content"></div>
			<div id="tab-11" class="tab-content"></div>
			<div id="tab-12" class="tab-content"></div>

		</div>

		<script type="text/javascript">
		    $(document).ready(function() {
		        // 숫자를 3자리마다 컴마로 표시하는 함수
		        function numberWithCommas(x) {
		            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		        }
		
		        // 탭 클릭 이벤트 핸들러
		        $('ul.tabs li').click(function() {
		            var tab_id = $(this).attr('data-tab');
		
		            // 모든 탭 및 탭 콘텐츠 클래스 제거
		            $('ul.tabs li').removeClass('current');
		            $('.tab-content').removeClass('current');
		
		            // 선택한 탭에 current 클래스 추가
		            $(this).addClass('current');
		
		            // 선택한 탭 콘텐츠에 current 클래스 추가
		            $("#" + tab_id).addClass('current');
		
		            // 해당 탭 내용 로드
		            loadTabContent($(this).text(), tab_id);
		        });
		
		        // 첫 번째 탭을 로드할 때와 동일하게 처리하기 위해 함수로 분리
		        function loadTabContent(tabContent, tab_id) {
		            $.ajax({
		                url: 'ProductDog', // 서블릿 주소
		                type: 'POST',
		                data: { tabContent: tabContent },
		                success: function(data) {
		                    console.log(data);
		                    var productListHTML = '';
		                    for (var i = 0; i < data.length; i++) {
		                        var product = data[i];
		                        productListHTML += '<div class="hotdeal_item">' +
		                            '<div class="img_container">' +
		                            '<a href="#"><img src="' + product.imgUrl + '" style="display: block;"></a>' +
		                            '</div>' +
		                            '<ul class="hotdeal_all">' +
		                            '<li class="hotdeal_name">' + product.name + '</li>' +
		                            '<li class="hotdeal_intro">' + product.intro + '</li>' +
		                            '<li class="hotdeal_salelogo">' + product.saleLogo + '</li>' +
		                            '<li class="hotdeal_trueprice"><del>' + numberWithCommas(product.originalPrice) + '원' + '</del></li>' +
		                            '<li class="hotdeal_per">' + product.discountRate + '</li>' +
		                            '<li class="hotdeal_realprice">' + numberWithCommas(product.realPrice) + '원' + '</li>' +
		                            '<button class="hotdeal_delivery">대통령배송</button>' +
		                            '</ul>' +
		                            '</div>';
		                    }
		                    $('#' + tab_id).html(productListHTML); // 해당 탭의 내용에 상품 목록 추가
		                },
		                error: function() {
		                    alert('데이터를 불러오는 데 실패했습니다.');
		                }
		            });
		        }
		
		        // 페이지 로드 시 첫 번째 탭의 내용을 미리 로드
		        loadTabContent($('ul.tabs li:first').text(), $('ul.tabs li:first').attr('data-tab'));
		    });
		</script>





	</article>



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