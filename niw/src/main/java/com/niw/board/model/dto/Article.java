package com.niw.board.model.dto;

import java.sql.Date;

import lombok.Builder;

@Builder
public record Article(
			int articleId,
			int userId,
			String articleTitle,
			String articleContent,
			String articleFilePath,
			Date articleDateTime,
			Date articleModifiedTime,
			int articleViews,
			int articleLikes,
			int articleDislikes,
			int articleCategory,
			int articleDelete
		) {

}
