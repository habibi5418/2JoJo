package kr.co.dondog.board.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.BoardDAO;
import kr.co.dondog.board.vo.BoardDogVO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.board.vo.TestVO;
import kr.co.dondog.dog.vo.DogVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO boardDAO;
	
	// 전체 게시글 가져오기
	public List<BoardVO> getBoardList() {
		List<BoardVO> list = boardDAO.getBoardList();
		list.stream().forEach(board -> {
			board.setBoardImgList(boardDAO.getBoardImgList(board));
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


	
	
	public JSONObject sendCoord(TestVO test) {
		JSONObject result = new JSONObject();
		if (boardDAO.sendCoord(test) > 0) {
			result.put("status", true);
		} else {
			result.put("status", false);
		}
		
		return result;
	}
	
	public JSONObject loadPark() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("parkList", boardDAO.loadPark());
		
		return jsonObject;
	}
	
	public JSONObject getRoute(TestVO test) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("routeList", boardDAO.getRoute(test));
		System.out.println("getRoute 받은 데이터 : " + jsonObject);
		
		return jsonObject;
	}
	
	public JSONObject getWnum(TestVO test) {
		JSONObject jsonObject = new JSONObject();
		List<TestVO> testList = boardDAO.getWnum(test);
		jsonObject.put("wnum", testList.size() == 0 ? 0 : testList.get(0).getWnum());
		System.out.println(jsonObject);
		
		return jsonObject;
	}
}
