package kr.co.dondog.dog.vo;


import lombok.Data;

@Data
public class DogVO {
	private int dnum;
	private String email;
	
	private String dname; 
	private String dtype; //종
	private int age;
	private int gender;
	private int about; //특이사항 번호로 체크박스 처리
	private String weight;
	
	private String regDate;
	private String modDate;
}
