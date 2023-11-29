package kr.co.dondog.board.vo;

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
	private String regDate; // 작성일자 
	private String modDate; // 수정일자
	private String category; // 일반게시글 G 당일만남 T 
	private int heart; // 좋아요
	private int viewCount; // 조회수
	private String deleteStatus; // 삭제상태 default 'N'
	private String loc2; // 동 이름

	private String email; // 작성자 이메일
	
	private List<String> boardDogList;
	private List<BoardImgVO> boardImgList;
	
//	private int pageNo = 1; // 현재 페이지
	private int totalCount; // 총 게시물 수
//	private int totalPageSize; // 총 페이지 수
//	private int pageLength = 10; // 한 페이지당 게시물 수 
//	private int navSize = 10; // 네비게이터의 페이지 수
//	private int navStart = 0; // 현재 네비게이터의 첫 번째 페이지 번호
//	private int navEnd = 0; // 현재 네비게이터의 마지막 페이지 번호
//	
//	public void setPageInfo(int totalCount) {
//		this.totalCount = totalCount;
//		totalPageSize = (int) Math.ceil((double) totalCount / pageLength);
//		navStart = ((pageNo - 1) / navSize) * navSize + 1;
//		navEnd = ((pageNo - 1) / navSize + 1) * navSize;
//		if (navEnd >= totalPageSize) navEnd = totalPageSize;
//	}
//	
//	public int getStartNo() {
//		return (pageNo - 1) * pageLength + 1; 
//	}
//	
//	public int getEndNo() {
//		return pageNo * pageLength; 
//	}
	
}
