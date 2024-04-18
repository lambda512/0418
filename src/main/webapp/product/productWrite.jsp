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
          <h2>상품 등록 - 관리자 페이지</h2>
          <form method="post" enctype="multipart/form-data" name="frm">
            <table>
              <tr>
                <th>브 랜 드 명</th>
                <td><input type="text" name="name" size="80"></td>
              </tr>
              <tr>
                <th>제 품 명</th>
                <td><input type="text" name="intro" size="80"></td>
              </tr>
              <tr>
                <th>통 상 가 격</th>
                <td><input type="text" name="originalPrice">원</td>
              </tr>
              <tr>
                <th>할 인 비 율</th>
                <td><input type="text" name="discountRate"></td>
              </tr>
              <tr>
                <th>최 종 가</th>
                <td><input type="text" name="realPrice">원</td>
              </tr>
              <tr>
                <th>제 품 사 진</th>
                <td><input type="file" name="imgUrl"><br>
                  (주의사항 : 이미지를 변경하고자 할때만 선택하시오)</td>
              </tr>
              <tr>
                <th>세 일 종 류</th>
                <td><input type="text" name="saleLogo" value="강대할인가"></td>
              </tr>
    
            </table>
            <br> 
            <input type="submit" value="등록"   onclick="return productCheck()"> 
            <input type="reset" value="다시작성"> 
            <input type="button" value="목록" onclick="location.href='productList.do'">
          </form>
        </div>
      </body>
    </html>