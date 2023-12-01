package kr.co.dondog.member.vo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//로그인
public class MemberVO implements UserDetails {

private static final long serialVersionUID = 1L;
	
   private String email; 			 // 아이디
   private String mname; 			 // 실제 이름
   private String pwd;   			 // 비밀번호
   private String nickname; 		 // 별명
   private String address; 			 // 주소
   private String birth;  			 // 생일 
   private LocalDateTime joinDate; 	 // 가입일
   private String grade; 			 // 회원등급
   private String reports; 			 // 신고누적횟수 -> 몇번 이상이면  정지회원으로 돌림!
   private LocalDateTime recentLog;  // 로그인기록
   private String gender;  			 // 성별
   private String oauth;			 // 가입구분(카카오, 구글, 네이버, 자사몰 구분)
   private String accountExpired;    // 
   private String accountLocked; 	 // 로그인 여러번 시도해서 차단
   private int loginCount; 			 // 로그인 횟수
   private LocalDateTime updateTime; // 수정날짜
   private String cancels; 			 // 탈퇴여부
   private String roles; 			 // 회원, 관리자 구분 user, admin 으로 구분
   private String black; 			 // 정지회원
   private int manner;

   // 프로필 사진
   private String fname;		// 사용자가 올린 원본 파일명 
   private String sname;		// 서버에 저장된 파일명 
   private int    length;		// 파일의 길이
   private String ftype;		// 컨텐츠 타입
   
   private String comments;		// 소개글
   
   private List<MemberVO> memberProfileList;
   
   @Override
   public String getPassword() {
      return this.getPwd();
   }

   @Override
   public String getUsername() {
      return this.getEmail();
   }

   // 계정이 갖고있는 권한 목록은 리턴
   @Override
   public Collection<? extends GrantedAuthority> getAuthorities() {

      Collection<GrantedAuthority> collectors = new ArrayList<>();
      collectors.add(() -> {
         return "계정별 등록할 권한";
      });

      // collectors.add(new SimpleGrantedAuthority("user"));

      return collectors;
   }

   
   
	// ENUM으로 안하고 ,로 해서 구분해서 ROLE을 입력 -> 그걸 파싱!!
	// 예제 ROLL 값 : "ROLE_USER","ROLE_MANAGER","ROLE_ADMIN"  
	public List<String> getRoleList() {
	    if (this.roles.length() > 0) {
	        return Arrays.asList(this.roles.split(","));
	    }
	    return new ArrayList<>();
	}
	
	
//계정이 만료되지 않았는지 리턴 (true: 만료 안됨)
   @Override
   public boolean isAccountNonExpired() {
      return "N".equalsIgnoreCase(accountExpired);
      // return true;
   }

//계정이 잠겨있는지 않았는지 리턴. (true: 잠기지 않음)
   @Override
   public boolean isAccountNonLocked() {
      return "N".equalsIgnoreCase(accountLocked);
      // return true;
   }

//비밀번호가 만료되지 않았는지 리턴한다. (true: 만료 안됨)
   @Override
   public boolean isCredentialsNonExpired() {
      return true;
   }

//계정이 활성화(사용가능)인지 리턴 (true: 활성화)
   @Override
   public boolean isEnabled() {
      return true;
   }
}