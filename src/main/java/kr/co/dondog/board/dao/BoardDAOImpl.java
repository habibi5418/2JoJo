package kr.co.dondog.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.dondog.board.vo.BoardDogVO;
import kr.co.dondog.board.vo.BoardHeartVO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.vo.MemberVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	// 최근 게시물 가져오기
	@Override
	public List<BoardVO> getRecentBoardList() {
		return sqlSession.selectList("mapper.board.getRecentBoardList");
	}
	
	// 회원 최근 게시물 가져오기
	@Override
	public List<BoardVO> getRecentBoardListByMember(MemberVO member) {
		return sqlSession.selectList("mapper.board.getRecentBoardListByMember", member);
	}

	// 전체 게시물 가져오기
	@Override
	public List<BoardVO> getBoardList(BoardVO board) {
		return sqlSession.selectList("mapper.board.getBoardList", board);
	}
	
	// 전체 게시물 수 구하기
	@Override
	public int getTotalCount() {
		BoardVO getBoard = sqlSession.selectOne("mapper.board.getTotalCount");
		return getBoard != null ? getBoard.getTotalCount() : 0;
	}
	
	// 회원의 게시물 수 구하기
	@Override
	public int getCountByMember(MemberVO member) {
		BoardVO getBoard = sqlSession.selectOne("mapper.board.getCountByMember", member);
		return getBoard != null ? getBoard.getTotalCount() : 0;
	}
	
	// 게시물 가져오기
	@Override
	public List<BoardVO> getAllBoardPageList(BoardVO board) {
		return sqlSession.selectList("mapper.board.getAllBoardPageList", board);
	}
	
	// 게시물 더보기
	@Override
	public List<BoardVO> getMoreBoardPageList(BoardVO board) {
		return sqlSession.selectList("mapper.board.getMoreBoardPageList", board);
	}

	// 게시글 이미지 리스트 가져오기
	@Override
	public List<BoardImgVO> getBoardImgList(BoardVO board) {
		return sqlSession.selectList("mapper.board.getBoardImgList", board);
	}
	
	// 실제 이미지 가져오기
	@Override
	public BoardImgVO getImg(int inum) {
		return sqlSession.selectOne("mapper.board.getImg", inum);
	}

	// 게시글 강아지 가져오기
	@Override
	public List<String> getBoardDogList(BoardVO board) {
		return sqlSession.selectList("mapper.board.getBoardDogList", board);
	}

	// 회원 강아지 가져오기
	@Override
	public List<DogVO> getDogList(MemberVO member) {
		return sqlSession.selectList("mapper.board.getDogList", member);
	}
	
	// 글 작성
	@Override
	public int writeBoard(BoardVO board) {
		return sqlSession.insert("mapper.board.write", board);
	}
	
	// 방금 작성한 글번호 가져오기 (파일업로드용) 
	@Override
	public int getWriteBnum() {
		List<BoardVO> list = sqlSession.selectList("mapper.board.getWriteBnum");
		return list.get(0).getBnum();
	}
	
	// 게시글 강아지 등록
	@Override
	public int writeBoardDog(BoardDogVO boardDog) {
		return sqlSession.insert("mapper.board.writeBoardDog", boardDog);
	}
	
	// 게시글 이미지 등록
	@Override
	public int writeBoardImg(BoardImgVO boardImg) {
		return sqlSession.insert("mapper.board.writeBoardImg", boardImg);
	}
	
	// 글 수정
	@Override
	public int updateBoard(BoardVO board) {
		return sqlSession.update("mapper.board.updateBoard", board);
	}
	
	// 글 삭제 (실질적 삭제 X)
	@Override
	public int deleteBoard(BoardVO board) {
		return sqlSession.update("mapper.board.deleteBoard", board);
	}

	// 게시글 상세 가져오기
	@Override
	public BoardVO getBoard(int bnum) {
		return sqlSession.selectOne("mapper.board.getBoard", bnum);
	}
	
	// 좋아요 여부 가져오기
	@Override
	public int getHeartStatus(BoardHeartVO boardHeart) {
		BoardHeartVO result = sqlSession.selectOne("mapper.board.getHeartStatus", boardHeart);
		return result != null ? result.getCnt() : 0;
	}
	
	// 좋아요 추가
	@Override
	public void addHeart(BoardHeartVO boardHeart) {
		sqlSession.insert("mapper.board.addHeart", boardHeart);
	}
	
	// 좋아요 삭제
	@Override
	public void deleteHeart(BoardHeartVO boardHeart) {
		sqlSession.delete("mapper.board.deleteHeart", boardHeart);
	}
	
	// 채팅요청
	@Override
	public List<ChatRequestVO> getResponse(ChatRequestVO reqInfo) {
		return sqlSession.selectList("mapper.board.getChatResponse", reqInfo);
	}
	
	@Override
	public List<ChatRequestVO> getRequest(ChatRequestVO reqInfo) {
		return sqlSession.selectList("mapper.board.getChatRequest", reqInfo);
	}
}
