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
//로그인
public class MemberVO {

   private String email; 			 // 아이디
   private String mname; 			 // 실제 이름
   private String pwd;   			 // 비밀번호
   private String nickname; 		 // 별명
   private String address; 			 // 주소
   private String birth;  			 // 생일 
   private LocalDateTime joinDate; 	 // 가입일
   private String grade; 			 // 회원등급
   private String report; 			 // 신고누적횟수
   private LocalDateTime recentLog;  // 로그인기록
   private String gender;  			 // 성별
   private String oauth;			 // 관리자, 회원 구분
   private String accountExpired;    // 휴먼계정
   private String accountLocked; 	 // 블랙계정
   private int loginCount; 			 // 로그인 횟수
   private LocalDateTime updateTime; // 수정날짜
   private String cancel; 			 // 탈퇴여부

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

   
//   시큐리티 관련 아직 주석 처리가 맞음 11/7_10:08확인
//   @Override
//   public String getPassword() {
//      return this.getPwd();
//   }
//
//   @Override
//   public String getUsername() {
//      return this.getEmail();
//   }
//
//   // 계정이 갖고있는 권한 목록은 리턴
//   @Override
//   public Collection<? extends GrantedAuthority> getAuthorities() {
//
//      Collection<GrantedAuthority> collectors = new ArrayList<>();
//      collectors.add(() -> {
//         return "계정별 등록할 권한";
//      });
//
//      // collectors.add(new SimpleGrantedAuthority("user"));
//
//      return collectors;
//   }
//
////계정이 만료되지 않았는지 리턴 (true: 만료 안됨)
//   @Override
//   public boolean isAccountNonExpired() {
//      return "N".equalsIgnoreCase(accountExpired);
//      // return true;
//   }
//
////계정이 잠겨있는지 않았는지 리턴. (true: 잠기지 않음)
//   @Override
//   public boolean isAccountNonLocked() {
//      return "N".equalsIgnoreCase(accountLocked);
//      // return true;
//   }
//
////비밀번호가 만료되지 않았는지 리턴한다. (true: 만료 안됨)
//   @Override
//   public boolean isCredentialsNonExpired() {
//      return true;
//   }
//
////계정이 활성화(사용가능)인지 리턴 (true: 활성화)
//   @Override
//   public boolean isEnabled() {
//      return true;
//   }
}