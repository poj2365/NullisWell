package com.niw.board.model.dao;

import static com.niw.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

	
	public int countArticle(Connection conn, int category, String searchData, int likes) {
		int result = 0;
		try {
			if(category == 0) {
				pstmt = conn.prepareStatement(sqlPro.getProperty("countArticle"));
				pstmt.setInt(1, likes);
				pstmt.setString(2, searchData);
			} else {
				pstmt = conn.prepareStatement(sqlPro.getProperty("countArticleByCategory"));
				pstmt.setInt(1, category);
				pstmt.setInt(2, likes);
				pstmt.setString(3, searchData);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(0);
			}			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Article> searchArticle(Connection conn, int category, String searchData, int likes, String order, int cPage, int numPerPage, int totalData){
		List<Article> articles = new ArrayList<>();
		try {
			if(category == 0) {
				pstmt = conn.prepareStatement(sqlPro.getProperty("searchArticle"));
				pstmt.setInt(1, likes);
				pstmt.setString(2, searchData);
				pstmt.setString(3, order);
				pstmt.setInt(4, (cPage - 1) * numPerPage + 1);
				pstmt.setInt(5, totalData > cPage * numPerPage? cPage * numPerPage : totalData);
			} else {
				pstmt = conn.prepareStatement(sqlPro.getProperty("searchArticleByCategory"));
				pstmt.setInt(1, category);
				pstmt.setInt(2, likes);
				pstmt.setString(3, searchData);
				pstmt.setString(4, order);
				pstmt.setInt(5, (cPage - 1) * numPerPage + 1);
				pstmt.setInt(6, totalData > cPage * numPerPage? cPage * numPerPage : totalData);				
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				articles.add(getArticle(rs));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return articles;
	}

}
