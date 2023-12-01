package kr.co.dondog.admin.vo;

import lombok.Data;

@Data
public class SearchVO {
	private String draw;			//dt그리는횟수
	private int start;  			//첫번째 행 인덱스
	private int length;				//페이지당출력되는 줄
	private String orderColumn; 	//컬럼명
	private String dir;				//정렬방향
	private String searchKeyword;	// 검색키워드
}
