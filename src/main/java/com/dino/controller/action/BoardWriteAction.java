package com.dino.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dino.dao.BoardDAO;
import com.dino.dto.BoardVO;

public class BoardWriteAction implements Action{
	@Override
	 public void execute(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        BoardVO bVo = new BoardVO();
	        bVo.setUsername(request.getParameter("username"));
	        bVo.setPass(request.getParameter("pass"));
	        bVo.setCategory(request.getParameter("category"));
	        bVo.setEmail(request.getParameter("email"));
	        bVo.setTitle(request.getParameter("title"));
	        bVo.setContent(request.getParameter("content"));
	        BoardDAO bDao = BoardDAO.getInstance();
	        bDao.insertBoard(bVo);

	        response.sendRedirect(request.getContextPath() + "/BoardServlet?command=board_list");
	    }
	}