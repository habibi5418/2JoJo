package kr.co.dondog.board.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int bnum; // 게시글 번호
	private String nickname; // 닉네임
	private String title; // 제목
	private String contents; // 내용
	private Date regDate; // 작성일자 
	private Date modDate; // 수정일자
	private String category; // 일반게시글 G 당일만남 T 
	private int heart; // 좋아요
	private int viewCount; // 조회수
	private String deleteStatus; // 삭제상태 default 'N'
	private String loc2; // 동 이름

	private String email; // 작성자 이메일
	
	private List<String> boardDogList;
	private List<BoardImgVO> boardImgList;
}
