<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div id="hotdeal_items"></div>

    <script>
        // JSON 데이터 가져오기
        $.getJSON('json/tab1.json', function(data) {
            // 각 제품에 대한 HTML 생성 및 삽입
            data.forEach(function(product) {
                var html = '<div class="hotdeal_item">' +
                               '<div class="img_container">' +
                                   '<a href="#"><img src="' + product.imgUrl + '" style="display: block;"></a>' +
                               '</div>' +
                               '<ul class="hotdeal_all">' +
                                   '<li class="hotdeal_name">' + product.name + '</li>' +
                                   '<li class="hotdeal_intro">' + product.intro + '</li>' +
                                   '<li class="hotdeal_saleprice">' + product.salePrice + '</li>' +
                                   '<li class="hotdeal_trueprice"><del>' + product.originalPrice + '</del></li>' +
                                   '<li class="hotdeal_per">' + product.discountRate + '</li>' +
                                   '<li class="hotdeal_realprice">' + product.realPrice + '</li>' +
                               '</ul>' +
                               '<button class="hotdeal_delivery"></button>' +
                           '</div>';
                $('#hotdeal_items').append(html);
            });
        });
    </script>
</body>
</html>
