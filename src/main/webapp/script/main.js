const swiper = document.querySelector('.carousel_wrapper');
const slides = document.querySelectorAll('.carousel_slide');
const prevButtons = document.querySelectorAll('.carousel_prev');
const nextButtons = document.querySelectorAll('.carousel_next');
const bullets = document.querySelectorAll('.carousel_circle');

let currentSlide = 0;
let intervalId; // 전역 변수로 선언, intervalId는 setInterval 함수를 호출할 때마다 생성되는 타이머 객체

function showSlide(slideIndex) {
	swiper.style.transform = `translateX(-${slideIndex * 2000}px)`;
	currentSlide = slideIndex;

	bullets.forEach((bullet, index) => {
		if (index === currentSlide) {
			bullet.classList.add('active');
		} else {
			bullet.classList.remove('active');
		}
	});
}

function nextSlide() {
	if (currentSlide < 16) {
		showSlide(currentSlide + 1);
	} else {
		currentSlide = 16;
		showSlide(0);
	}
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
	prevButton.addEventListener('click', () => {
		stopAutoSlide(); // *이전 버튼 클릭 시 자동 넘김 중지
		if (currentSlide > 0) {
			showSlide(currentSlide - 1);
		} else {
			currentSlide = 0;
			showSlide(16);
		}
	});
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


const clocks = document.querySelectorAll(".clock");

function padZero(num) {
	return num < 10 ? `0${num}` : num;
}

function getClock() {
	const future = new Date("2024/01/18 00:00:00");
	const now = new Date();
	const diff = future - now;

	const days = Math.floor(diff / (1000 * 60 * 60 * 24));
	const hours = Math.floor(diff / (1000 * 60 * 60));
	const mins = Math.floor(diff / (1000 * 60));
	const secs = Math.floor(diff / 1000);

	const h = padZero(hours - days * 24);
	const m = padZero(mins - hours * 60);
	const s = padZero(secs - mins * 60);

	const formattedTime = `${h}:${m}:${s} 남음`;

	clocks.forEach(clock => {
		clock.innerText = formattedTime;
	});
}

getClock();
setInterval(getClock, 1000);

const clock = document.querySelector(".countdown");


function padZero(num) {
	return num < 10 ? `0${num}` : num;
}

function getClock() {

	const future = Date.parse("2024/01/13 00:00:00");
	const now = new Date();
	const diff = future - now;
	const days = Math.floor(diff / (1000 * 60 * 60 * 24));
	const hours = Math.floor(diff / (1000 * 60 * 60));
	const mins = Math.floor(diff / (1000 * 60));
	const secs = Math.floor(diff / 1000);

	const h = padZero(hours - days * 24);
	const m = padZero(mins - hours * 60);
	const s = padZero(secs - mins * 60);

	clock.innerText = `${h}:${m}:${s} `;
}


getClock();
setInterval(getClock, 1000);



$(document).ready(function() {

	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

})

