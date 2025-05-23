package com.niw.board.service;

import static com.niw.common.JDBCTemplate.close;
import static com.niw.common.JDBCTemplate.commit;
import static com.niw.common.JDBCTemplate.getConnection;
import static com.niw.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.niw.board.model.dao.BoardDao;
import com.niw.board.model.dto.Article;

public enum BoardService {
	SERVICE;
	
	public int insertArticle() {
		Connection conn = getConnection();
		int result = BoardDao.DAO.insertArticle(conn);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Article> searchArticle(int category, String searchData, int likes, String order, int cPage, int numPerPage, int totalData){
		Connection conn = getConnection();
		List<Article> articles = BoardDao.DAO.searchArticle(conn, category, searchData, likes, order, cPage, numPerPage, totalData);
		close(conn);
		return articles;
	}
	
	public int countArticle(int category, String searchData, int likes) {
		Connection conn = getConnection();
		int result = BoardDao.DAO.countArticle(conn, category, searchData, likes);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
