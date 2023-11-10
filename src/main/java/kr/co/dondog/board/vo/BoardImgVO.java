package kr.co.dondog.board.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardImgVO {
	private int inum;			// 이미지 번호
	private int bnum;			// 게시글 번호
	private String fname;		// 사용자가 올린 원본 파일명 
	private String sname;		// 서버에 저장된 파일명 
	private int    length;		// 파일의 길이
	private String ftype;		// 컨텐츠 타입
	
}
