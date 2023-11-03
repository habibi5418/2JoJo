package kr.co.dondog.member.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	
	private String email; // member 식별자
	private String mname;
	private String pwd;
	private String nickname;
	private String address;
	private String birth; 
	private int gender; //1 여자 2 남자 체크박스
	private int report; //신고누적수 default 0
	
	/* 관리자 */
	private Date joinDate;
	private Date recentLog; // 마지막 접속일
	private String grade; // admin: A, generic: G default 'G'

	private Date updateTime; // 수정일
	private String oauth;
	private String accountExpired; //default 'N'
	private String accountLocked; //default 'N'
	private int loginCount; //  default 0
	private String cancle; // default 'N'


}
