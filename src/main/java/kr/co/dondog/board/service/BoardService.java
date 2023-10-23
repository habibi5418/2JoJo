package kr.co.dondog.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.BoardDAO;
import kr.co.dondog.board.vo.BoardVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	public List<BoardVO> test() {
		return boardDAO.test();
	}
}
