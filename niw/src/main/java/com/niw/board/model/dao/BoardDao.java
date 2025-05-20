package com.niw.board.model.dao;

import static com.niw.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.niw.board.model.dto.Article;

public enum BoardDao {
	DAO;
	
	private Properties sqlPro = new Properties();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	{
		String path = BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try(FileReader fr = new FileReader(path)) {
			sqlPro.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private Article getArticle(ResultSet rs) {
		return Article.builder().build();
	}
	
	public int insertArticle(Connection conn) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sqlPro.getProperty("insertArticle"));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
