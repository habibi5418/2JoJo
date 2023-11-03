package kr.co.dondog.dog.vo;


import lombok.Data;

@Data
public class DogProfileVO {
	private int dnum;
	private String fname; //파일명 
	private String sname; //저장명
	private int length; //용량
	private String ftype; //타입
}
