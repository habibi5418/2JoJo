package kr.co.dondog.member.service;

import java.util.List;
import java.util.Objects;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.dao.MemberDAO;
import kr.co.dondog.member.exception.ExistMemberException;
import kr.co.dondog.member.exception.NotExistMemberException;
import kr.co.dondog.member.vo.MemberVO;

@Service
public class MemberService {

	 @Autowired
	 private MemberDAO memberDAO;
	 
	 @Autowired
		private PasswordEncoder passwordEncoder;
	 
	 //로그인
	public MemberVO findByEmail(String email) {
		System.out.println("memberservice.findbyemail");
		return memberDAO.findByEmail(email);
		
		
//		MemberVO member = memberDAO.findByEmail(email);
//		
//		if (member == null) throw new UsernameNotFoundException("Not Found account.");
//		
//		memberDAO.loginCountInc(member);
//		
//		return member;
	}
	
	//회원가입
	public void insertMember(MemberVO memberVO) throws Exception {
		try {
			if (memberVO == null ||
				Objects.isNull(memberVO.getEmail())) {
				throw new Exception("아이디는 필수 정보입니다");
			} else if (Objects.isNull(memberVO.getOauth()) && Objects.isNull(memberVO.getPwd())) {
				throw new Exception("비밀번호는 필수 정보입니다");
			}
			MemberVO existMember = memberDAO.findByEmail(memberVO.getEmail());
			if (existMember != null && !Objects.isNull(memberVO.getEmail())) {
				throw new ExistMemberException(memberVO.getEmail());
			}
			//비밀번호 암호화 한다
			 if (memberVO.getPwd() != null && memberVO.getPwd().length() != 0) {
			       memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
			    }
			memberDAO.insertMember(memberVO);
			System.out.println(memberVO);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw ex;
		}
	}
	
	
	//멤버정보수정
	public boolean updateMember(MemberVO memberVO)  {
		try {
			if (memberVO == null || Objects.isNull(memberVO.getEmail())) {
				throw new Exception("아이디는 필수 정보입니다");
			} else if (Objects.isNull(memberVO.getPwd())) {
				throw new Exception("비밀번호는 필수 정보입니다");
			}
			MemberVO existMember = memberDAO.findByEmail(memberVO.getEmail());
			if (existMember == null || Objects.isNull(memberVO.getEmail())) {
				throw new NotExistMemberException(memberVO.getEmail());
			}
			
			//비밀번호 암호화 한다
			 if (memberVO.getPwd() != null && memberVO.getPwd().length() != 0) {
			       memberVO.setPwd(passwordEncoder.encode(memberVO.getPwd()));
			    }
			
			memberDAO.updateMember(memberVO);
			memberVO.setRoles(existMember.getRoles());
			
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	
	// 프로필 수정
	public JSONObject update(MemberVO member) {
	JSONObject result = new JSONObject();
	
	List<MemberVO> memberProfileList = member.getMemberProfileList();
	
	if (memberProfileList.size() != 0) {
		for (MemberVO memberProfile : memberProfileList) {
			memberProfile.setEmail(member.getEmail());
			memberProfile.setNickname(member.getNickname());
//			memberProfile.setPwd(member.getPwd());
			if (memberDAO.update(memberProfile) > 0) {
				result.put("message", "추가가 완료되었습니다.");
				result.put("status", true);
			} else {
				result.put("message", "추가를 실패하였습니다.");
				result.put("status", false);
			}
		}
	} 

	result.put("newNickname", member.getNickname());
	result.put("newComments", member.getComments());
	
	return result;
}
	
}
