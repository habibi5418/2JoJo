package kr.co.dondog.board.dao;

import java.util.List;

import kr.co.dondog.board.vo.BoardDogVO;
import kr.co.dondog.board.vo.BoardHeartVO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.vo.MemberVO;

public interface BoardDAO {
	List<BoardVO> getBoardList(BoardVO board);
//	int getTotalCount(BoardVO board);
	List<BoardVO> getAllBoardPageList(BoardVO board);
	List<BoardVO> getMoreBoardPageList(BoardVO board);
	List<BoardImgVO> getBoardImgList(BoardVO board);
	BoardImgVO getImg(int inum);
	List<String> getBoardDogList(BoardVO board);
	List<DogVO> getDogList(MemberVO member);
	int writeBoard(BoardVO board);
	int getWriteBnum();
	int writeBoardDog(BoardDogVO boardDog);
	int writeBoardImg(BoardImgVO boardImg);
	int updateBoard(BoardVO board);
	int deleteBoard(BoardVO board);
	BoardVO getBoard(int bnum);
	int getHeartStatus(BoardHeartVO boardHeart);
	void addHeart(BoardHeartVO boardHeart);
	void deleteHeart(BoardHeartVO boardHeart);
	
	//채팅요청
	List<ChatRequestVO> getResponse(BoardVO board);
	List<ChatRequestVO> getRequest(ChatRequestVO reqInfo);

}
