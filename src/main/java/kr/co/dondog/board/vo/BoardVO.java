package kr.co.dondog.board.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bnum;
	private String nickname; 
	private String title;
	private String clob;
	private Date regDate;
	private Date modDate;
	private String category; // 일반게시글 G 당일만남 T 
	private int viewCount;
	private String deleteStatus; //default 'N'

	/* 좋아요 */
	private int heart;
	
}
