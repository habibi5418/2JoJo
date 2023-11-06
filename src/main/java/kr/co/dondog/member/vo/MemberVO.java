package kr.co.dondog.member.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {

	private String email;
	private String mname;
	private String pwd;
	private String nickname;
	private String address;
	private String birth;
	private LocalDateTime joinDate;
	private String grade;
	private String report;
	private LocalDateTime recentLog;
	private String gender;
	private String oauth;
	private String accountExpired;
	private String accountLocked;
	private int loginCount;
	private LocalDateTime updateTime;
	private String cancel;

	@Builder
	public MemberVO(String email, String pwd, String nickname, String address, String birth,
			LocalDateTime joinDate, String grade, String report, LocalDateTime recentLog, String gender, String oauth,
			String accountExpired, String accountLocked, int loginCount, LocalDateTime updateTime, String cancel) {
		this.email = email;
		this.pwd = pwd;
		this.nickname = nickname;
		this.address = address;
		this.birth = birth;
		this.joinDate = joinDate;
		this.grade = grade;
		this.report = report;
		this.recentLog = recentLog;
		this.gender = gender;
		this.oauth = oauth;
		this.accountExpired = accountExpired;
		this.accountLocked = accountLocked;
		this.loginCount = loginCount;
		this.updateTime = updateTime;
		this.cancel = cancel;
	}

//	@Override
//	public String getPassword() {
//		return this.getPwd();
//	}
//
//	@Override
//	public String getUsername() {
//		return this.getEmail();
//	}
//
//	// 계정이 갖고있는 권한 목록은 리턴
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//
//		Collection<GrantedAuthority> collectors = new ArrayList<>();
//		collectors.add(() -> {
//			return "계정별 등록할 권한";
//		});
//
//		// collectors.add(new SimpleGrantedAuthority("user"));
//
//		return collectors;
//	}
//
////계정이 만료되지 않았는지 리턴 (true: 만료 안됨)
//	@Override
//	public boolean isAccountNonExpired() {
//		return "N".equalsIgnoreCase(accountExpired);
//		// return true;
//	}
//
////계정이 잠겨있는지 않았는지 리턴. (true: 잠기지 않음)
//	@Override
//	public boolean isAccountNonLocked() {
//		return "N".equalsIgnoreCase(accountLocked);
//		// return true;
//	}
//
////비밀번호가 만료되지 않았는지 리턴한다. (true: 만료 안됨)
//	@Override
//	public boolean isCredentialsNonExpired() {
//		return true;
//	}
//
////계정이 활성화(사용가능)인지 리턴 (true: 활성화)
//	@Override
//	public boolean isEnabled() {
//		return true;
//	}
}