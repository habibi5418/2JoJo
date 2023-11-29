package kr.co.dondog.board.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardHeartVO {
	private int hnum; // 고유번호
	private int bnum; // 게시글 번호
	private String email; // 이메일
	
	private int cnt;

	public BoardHeartVO(int bnum, String email) {
		this.bnum = bnum;
		this.email = email;
	}
	
}
