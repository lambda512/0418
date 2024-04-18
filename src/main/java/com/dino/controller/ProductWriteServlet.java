package com.dino.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dino.dao.ProductDAO;
import com.dino.dto.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/productWrite.do")
public class ProductWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("product/productWrite.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ServletContext context = getServletContext();
				
		String path = context.getRealPath("upload");
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 * 1024;
				
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
				
		String name= multi.getParameter("name");
		String intro= multi.getParameter("intro");
		int originalPrice = Integer.parseInt(multi.getParameter("originalPrice"));
		String discountRate = multi.getParameter("discountRate");
		int realPrice = Integer.parseInt(multi.getParameter("realPrice"));
		String saleLogo= multi.getParameter("saleLogo");
		String imgUrl = request.getContextPath() + "/upload/" + multi.getFilesystemName("imgUrl");
		ProductVO pVo = new ProductVO();
		pVo.setname(name);
		pVo.setintro(intro);
		pVo.setoriginalPrice(originalPrice);
		pVo.setdiscountRate(discountRate);
		pVo.setrealPrice(realPrice);
		pVo.setsaleLogo(saleLogo);
		pVo.setimgUrl(imgUrl);
			
		ProductDAO pDao = ProductDAO.getInstance();
		pDao.insertProduct(pVo);
				
		response.sendRedirect("productList.do");
				
	}

}
