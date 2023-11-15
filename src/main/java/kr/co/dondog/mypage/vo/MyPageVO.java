package kr.co.dondog.mypage.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MyPageVO {
	private String email;
	private String mname;
	private String pwd;
	private String nickname;
	private String address;
	private String birth;
	private Date update_date;
	
	private String heart;
	
}
