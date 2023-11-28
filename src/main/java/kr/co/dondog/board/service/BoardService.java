package kr.co.dondog.board.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.BoardDAO;
import kr.co.dondog.board.vo.BoardDogVO;
import kr.co.dondog.board.vo.BoardHeartVO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.chat.vo.ChatRequestVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	// 전체 게시글 가져오기
	public List<BoardVO> getBoardList(BoardVO board) {
		List<BoardVO> list = boardDAO.getAllBoardPageList(board);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		list.stream().forEach(b -> {
			b.setBoardImgList(boardDAO.getBoardImgList(b));

			try {
				long regDate = formatter.parse(b.getRegDate()).getTime();
				long now = Calendar.getInstance().getTime().getTime();
				long diff = now - regDate;
				
				if (diff / (3600000 * 24) == 0) {
					if (diff / (60000 * 3) == 0) {
						b.setRegDate("방금 전");
					} else if (diff / (3600000) == 0) {
						long minute = diff / (60000);
						b.setRegDate(minute + "분 전");
					} else {
						long hour = diff / (3600000);
						b.setRegDate(hour + "시간 전");
					}
				} else {
					String monthDay = b.getRegDate().substring(5, 10);
					b.setRegDate(monthDay);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		});
		
		return list;
	}
	
	// 게시물 더보기 
	public JSONObject getMoreBoardPageList(BoardVO board) {
		JSONObject result = new JSONObject();
		List<BoardVO> list = boardDAO.getMoreBoardPageList(board);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		list.stream().forEach(b -> {
			b.setBoardImgList(boardDAO.getBoardImgList(b));

			try {
				long regDate = formatter.parse(b.getRegDate()).getTime();
				long now = Calendar.getInstance().getTime().getTime();
				long diff = now - regDate;
				
				if (diff / (3600000 * 24) == 0) {
					if (diff / (60000 * 3) == 0) {
						b.setRegDate("방금 전");
					} else if (diff / (3600000) == 0) {
						long minute = diff / (60000);
						b.setRegDate(minute + "분 전");
					} else {
						long hour = diff / (3600000);
						b.setRegDate(hour + "시간 전");
					}
				} else {
					String monthDay = b.getRegDate().substring(5, 10);
					b.setRegDate(monthDay);
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		});
		
		result.put("boardList", list);
		
		return result;
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
	
	// 좋아요 여부 가져오기
	public boolean getHeartStatus(BoardHeartVO boardHeart) {
		return boardDAO.getHeartStatus(boardHeart) > 0;
	}
	
	// 좋아요 추가
	public void addHeart(BoardHeartVO boardHeart) {
		boardDAO.addHeart(boardHeart);
	}
	
	// 좋아요 추가
	public void deleteHeart(BoardHeartVO boardHeart) {
		boardDAO.deleteHeart(boardHeart);
	}
	
	// 채팅 요청 가져오기 - 작성자
	public List<ChatRequestVO> getResponse(BoardVO board){
		return boardDAO.getResponse(board);
	} 
	
	// 채팅 요청 가져오기 - 작성자 외
	public List<ChatRequestVO> getRequest(ChatRequestVO reqInfo){
		return boardDAO.getRequest(reqInfo);
	} 
	
}
