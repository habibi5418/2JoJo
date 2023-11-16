package kr.co.dondog.chat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.dondog.chat.entity.ChatRoomEntity;
import kr.co.dondog.chat.vo.ChatRequestVO;

public interface ChatRoomDAO {
	  
//	ChatRoomEntity selectChatRoomById(String roomId);
//	void insertChatRoom(ChatRoomEntity chatRoom);
//	void updateChatRoom(ChatRoomEntity chatRoom);
//	void saveChatRoom(ChatRoomEntity chatRoom);
	// 요청데이터 저장
	public boolean saveRequest(ChatRequestVO chatRequest);

	public List<ChatRoomEntity> findAllRooms(); // 채팅방 이름 순으로 반환

//	public List<ChatRequestVO> saveRequest(ChatRequestVO chatRequest);

	
}
