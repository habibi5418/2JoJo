package kr.co.dondog.dog.vo;


import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DogVO {
	private int dnum;
	private String email;
	
	private String dname; 
	private String dtype; //종
	private int age;
	private String gender;
	private int about; //특이사항 번호로 체크박스 처리
	private String weight;
	private String matter;
	
	private Date regDate;
	private Date modDate;
	
	// 강아지 프로필
	private String fname;		// 사용자가 올린 원본 파일명 
	private String sname;		// 서버에 저장된 파일명 
	private int    length;		// 파일의 길이
	private String ftype;		// 컨텐츠 타입
	
	private List<DogVO> dogProfileList;
	
	private int dogCount; // 강아지타입 차트 출력할때 필요한거
}
