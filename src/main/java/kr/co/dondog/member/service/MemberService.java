package kr.co.dondog.member.service;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
	
}
