package com.niw.board.service;

import static com.niw.common.JDBCTemplate.*;

import java.sql.Connection;

import com.niw.board.model.dao.BoardDao;

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
}
