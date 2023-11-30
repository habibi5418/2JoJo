package kr.co.dondog.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.BoardDAO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.dog.dao.DogDAO;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.dao.MemberDAO;
import kr.co.dondog.member.vo.MemberVO;


@Service
public class FileService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private DogDAO dogDAO;

	@Autowired
	private BoardDAO boardDAO;
	
	public MemberVO getMemberProfile(String email) throws Exception {
		return memberDAO.getProfile(email);
	} 
	
	public DogVO getProfile(int dnum) throws Exception {
		return dogDAO.getProfile(dnum);
	} 
	
	public BoardImgVO getImg(int inum) throws Exception {
		return boardDAO.getImg(inum);
	} 

} 
