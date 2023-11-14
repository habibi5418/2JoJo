package kr.co.dondog.board.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.BoardDAO;
import kr.co.dondog.board.vo.BoardDogVO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.board.vo.BoardVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	// 전체 게시글 가져오기
	public List<BoardVO> getBoardList() {
		List<BoardVO> list = boardDAO.getBoardList();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		list.stream().forEach(board -> {
			board.setBoardImgList(boardDAO.getBoardImgList(board));

			try {
				long regDate = formatter.parse(board.getRegDate()).getTime();
				long now = Calendar.getInstance().getTime().getTime();
				long diff = now - regDate;
				
				if (diff / (3600000 * 24) == 0) {
					if (diff / (60000 * 3) == 0) {
						board.setRegDate("방금 전");
					} else if (diff / (3600000) == 0) {
						long minute = diff / (60000);
						board.setRegDate(minute + "분 전");
					} else {
						long hour = diff / (3600000);
						board.setRegDate(hour + "시간 전");
					}
				} else {
					String monthDay = board.getRegDate().substring(5, board.getRegDate().length() - 3);
					board.setRegDate(monthDay);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
		return list;
	}

	// 글 작성
	public JSONObject write(BoardVO board) {
		JSONObject result = new JSONObject();
		result.put("message", "추가가 완료되었습니다.");
		result.put("status", true);
		
		try {
			boardDAO.writeBoard(board);
			
			board.setBnum(boardDAO.getWriteBnum());
			List<String> boardDogList = board.getBoardDogList();
			List<BoardImgVO> boardImgList = board.getBoardImgList();
			BoardDogVO boardDog = new BoardDogVO();
			System.out.println(boardImgList);
			if (boardDogList.size() != 0) {
				for (String boardDogNum : boardDogList) {
					boardDog.setBnum(board.getBnum());
					boardDog.setDnum(Integer.parseInt(boardDogNum));
					boardDAO.writeBoardDog(boardDog);
				}
			} 
			
			if (boardImgList.size() != 0) {
				for (BoardImgVO boardImg : boardImgList) {
					boardImg.setBnum(board.getBnum());
					System.out.println(boardImg);
					boardDAO.writeBoardImg(boardImg);
				}
			} 
		} catch (Exception e) {
			result.put("message", "추가를 실패하였습니다.");
			result.put("status", false);
		}
		
		return result;
	}
	
	// 게시글 상세 가져오기
	public BoardVO getBoard(int bnum) {
		BoardVO board = boardDAO.getBoard(bnum);
		board.setBoardDogList(boardDAO.getBoardDogList(board));
		board.setBoardImgList(boardDAO.getBoardImgList(board));
		return board;
	}

}
