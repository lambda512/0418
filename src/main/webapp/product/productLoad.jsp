<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dino.dao.ProductDAO" %>
<%@ page import="com.dino.dto.ProductVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
    String productName = (String)request.getAttribute("productName");

    // 상품 목록 가져오기
    ProductDAO productDAO = ProductDAO.getInstance();
    List<ProductVO> productList = productDAO.selectProductsByName(productName);
%>

<% for (ProductVO product : productList) { %>
<div class="hotdeal_item">
    <div class="img_container">
        <a href="#"><img src="<%= product.getimgUrl() %>" style="display: block;"></a>
    </div>
    <ul class="hotdeal_all">
        <li class="hotdeal_name"><%= product.getname() %></li>
        <li class="hotdeal_intro"><%= product.getintro() %></li>
        <li class="hotdeal_salelogo"><%= product.getsaleLogo() %></li>
        <li class="hotdeal_trueprice"><del><%= product.getoriginalPrice() %>원</del></li>
        <li class="hotdeal_per"><%= product.getdiscountRate() %></li>
        <li class="hotdeal_realprice"><%= product.getrealPrice() %>원</li>
    </ul>
    <button class="hotdeal_delivery">대통령배송</button>
</div>
<% } %>

</body>
</html>