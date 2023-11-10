package kr.co.dondog.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.BoardDAO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.dog.dao.DogDAO;
import kr.co.dondog.dog.vo.DogVO;


@Service
public class FileService {
	
	@Autowired
	private DogDAO dogDAO;

	@Autowired
	private BoardDAO boardDAO;
	
	public DogVO getProfile(int dnum) throws Exception {
		return dogDAO.getProfile(dnum);
	} 
	
	public BoardImgVO getImg(int inum) throws Exception {
		return boardDAO.getImg(inum);
	} 

} 
