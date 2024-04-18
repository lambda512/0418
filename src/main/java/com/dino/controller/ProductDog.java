package com.dino.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dino.dao.ProductDAO;
import com.dino.dto.ProductVO;
import com.google.gson.Gson;


@WebServlet("/ProductDog")
public class ProductDog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 // 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 클라이언트로부터 전달된 탭의 내용 가져오기
        String tabContent = request.getParameter("tabContent");

        // DB에서 상품 목록 가져오기
        ProductDAO productDAO = ProductDAO.getInstance();
        List<ProductVO> productList = productDAO.selectProductsByName(tabContent);

        // JSON 형태로 변환
        Gson gson = new Gson();
        String jsonProductList = gson.toJson(productList);

        // JSON 응답 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonProductList);
    }
}