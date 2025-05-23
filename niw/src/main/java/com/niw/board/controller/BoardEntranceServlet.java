package com.niw.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.niw.board.model.dto.Article;
import com.niw.board.service.BoardService;

@WebServlet("/board/boardentrance.do")
public class BoardEntranceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardEntranceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int category = 0;
		try {
			category = Integer.parseInt(request.getParameter("category"));
		} catch (NumberFormatException e) {}
		int cPage = 1, numPerPage = 10;
		try{
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {}
		int pageBarSize = 5;
		int totalData = BoardService.SERVICE.countArticle(category, "", 0);
		int totalPage = (totalData - 1) / numPerPage + 1; 
		int pageNo = 1, pageEnd = totalPage;
		if(pageBarSize < totalPage) {
			if(pageBarSize / 2 < cPage && cPage < totalPage - pageBarSize / 2) {
				pageNo = cPage - pageBarSize / 2;
				pageEnd = cPage + pageBarSize / 2;
			} else {
				if(cPage <= pageBarSize / 2) pageEnd = numPerPage;
				if(cPage >= totalPage - pageBarSize / 2) pageNo = totalPage - pageBarSize + 1;
			}
		}
		StringBuffer pageBar = new StringBuffer("<ul class='pagination justify-content-center'>");
		if(cPage == 1) {
			pageBar.append("<li class='page-item disabled'>");
			pageBar.append("<a class='page-link' href='#'> prev </a>");
			pageBar.append("</li>");
		} else {
			pageBar.append("<li class='page-item '>");
			pageBar.append("<a class='page-link' href='" + request.getRequestURI() + "?cPage=" + (pageNo > 1? pageNo - 1 : 1) +"'> prev </a>");
			pageBar.append("</li>");
		}
		for(int i = pageNo; i <= pageEnd; i++) {
			if(i == cPage) {
				pageBar.append("<li class='page-item disabled'>");
				pageBar.append("<a class='page-link' href='#'>"+ i + "</a>");
			} else {
				pageBar.append("<li class='page-item'>");
				pageBar.append("<a class='page-link' href='" + request.getRequestURI() + "?cPage=" + i +"'> " + i + " </a>");
			}
			pageBar.append("</li>");
		}
		if(cPage == totalPage) {
			pageBar.append("<li class='page-item disabled'>");
			pageBar.append("<a class='page-link' href='#'> next </a>");
		} else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href='" + request.getRequestURI() + "?cPage=" + (pageEnd < totalPage? pageEnd + 1 : totalPage) +"'> next </a>");
		}
		pageBar.append("</li>");
		pageBar.append("</ul>");
		request.setAttribute("pageBar", pageBar);
		List<Article> articles = BoardService.SERVICE.searchArticle(category, "", 0, null, cPage, numPerPage, totalData);
		request.setAttribute("articles", articles);
		request.getRequestDispatcher("/WEB-INF/views/board/boardmain.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
