<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="css/main.css" rel="stylesheet" />
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
</head>
<body>
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

            <li class=hotdeal_saleprice>강대할인가</li>

            <li class=hotdeal_trueprice><del>43,000원</del></li>

            <li class=hotdeal_per>35%</li>

            <li class=hotdeal_realprice>28,000원</li>

            <button class="hotdeal_dilivery">대통령배송</button>

            <script type="text/javascript">
            function updateClock(clock) {
                const futureDate = new Date("2024-03-27T00:00:00");
                const currentDate = new Date();
                let timeDifference = futureDate - currentDate;

                if (timeDifference < 0) {
                    // 현재 시간이 미래 시간보다 큰 경우, 미래 시간에 1일을 더함
                    futureDate.setDate(futureDate.getDate() + 1);
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
                return num < 10 ? `0${num}` : num;
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

        </ul>
    </div>
</body>
</html>
