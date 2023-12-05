package kr.co.dondog.chat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.dondog.chat.entity.ChatRoomEntity;
import kr.co.dondog.chat.vo.ChatMessageVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.chat.vo.ChatRoomVO;

public interface ChatRoomDAO {

	// 요청데이터 저장
	public boolean saveRequest(ChatRequestVO chatRequest);

	// 요청 목록 출력
	public List<ChatRequestVO> getRequestList(ChatRequestVO chatRequest);

	// 요청 승낙 후 상태 업데이트
	public boolean updateChatRequestAccept(String req_id);

	// 요청 승낙에 따른 채팅방 생성
	public boolean acceptRequestAndCreateChatRoom(ChatRoomVO chatRoom);

	// 요청 거절 채팅방 생성되지않음
	public boolean rejectRequest(ChatRequestVO chatRequestVO);

	public List<ChatRoomVO> getAllChatRooms(ChatRoomVO chatRoom);

	public List<ChatMessageVO> getRoomInfo(String room_id);

	public int saveMessage(ChatMessageVO chatMessage);

//		
	// 산책 페이지용 데이터 가져오기
	ChatRoomVO getChatRoom(String room_id);

}
