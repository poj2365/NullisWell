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
	
	private Article getArticle(ResultSet rs) throws SQLException{
		return Article.builder()
					  .articleId(rs.getInt("article_id"))
					  .userId(rs.getInt("user_id"))
					  .articleTitle(rs.getString("article_title"))
					  .articleFilePath(rs.getString("article_filepath"))
					  .articleDateTime(rs.getDate("article_datetime"))
					  .articleModifiedTime(rs.getDate("article_modified_time"))
					  .articleViews(rs.getInt(rs.getInt("article_views")))
					  .articleLikes(rs.getInt(rs.getInt("article_likes")))
					  .articleDislikes(rs.getInt("article_dislikes"))
					  .articleCategory(rs.getInt("article_category"))
					  .articleDelete(rs.getInt("article_delete"))
					  .build();
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
	
	public List<Article> searchArticle(Connection conn, int category, String searchData, int likes, String order, int cPage, int numPerPage, int totalData){
		List<Article> articles = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sqlPro.getProperty("searchArticle"));
			
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
