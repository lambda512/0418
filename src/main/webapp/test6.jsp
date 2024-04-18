<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dino.dto.ProductVO"%>
<%@ page import="com.dino.dao.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강아지대통령</title>
<link href="css/main.css" rel="stylesheet" />
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
</head>
<body>

	<div class="tabs_container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">츄통령</li>
			<li class="tab-link" data-tab="tab-2">오리젠</li>
		</ul>

		<div id="tab-1" class="tab-content current">tab content1</div>
		<div id="tab-2" class="tab-content">tab content2</div>


	</div>

	 <script type="text/javascript">
        $(document).ready(function() {
            $('ul.tabs li').click(function() {
                var tabContent = $(this).text(); // 클라이언트가 선택한 탭의 내용을 가져옴
                $.ajax({
                    url: 'ProductDog', // 서블릿 주소
                    type: 'POST',
                    data: { tabContent: tabContent }, // 클라이언트가 선택한 탭의 내용을 서버로 전송
                    success: function(data) {
                        console.log(data); // 받은 JSON 데이터를 콘솔에 출력

                        // 상품 목록을 표시할 HTML 문자열
                        var productListHTML = '';

                        // 각 상품에 대해 반복하여 HTML에 추가
                        for (var i = 0; i < data.length; i++) {
                            var product = data[i];
                            productListHTML += '<div class="product">';
                            productListHTML += '<img src="' + product.imgUrl + '" alt="' + product.name + '">';
                            productListHTML += '<p class="name">' + product.name + '</p>';
                            productListHTML += '<p class="intro">' + product.intro + '</p>';
                            productListHTML += '<p class="price">' + product.realPrice + '원</p>';
                            productListHTML += '<p class="discount">' + product.discountRate + ' 할인</p>';
                            productListHTML += '</div>';
                        }

                        // 상품 목록을 화면에 표시
                        $('#tab-1').html(productListHTML);
                    },


                    error: function() {
                        alert('데이터를 불러오는 데 실패했습니다.');
                    }
                });
            });
        });
    </script>






</body>
</html>
