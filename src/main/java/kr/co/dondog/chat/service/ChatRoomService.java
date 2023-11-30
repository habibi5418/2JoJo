package kr.co.dondog.chat.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.chat.dao.ChatRoomDAO;
import kr.co.dondog.chat.vo.ChatMessageVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.chat.vo.ChatRoomVO;

@Service
public class ChatRoomService {

	 @Autowired
	    private ChatRoomDAO chatRoomDAO;
	    
	    
	    ///채팅방 전달하는 내용 >> chatRoomVO 
	    // 메세지 전달하는 내용 >> chatMessageVO 
	    // ChatroomEntity << 생성,출력 list로 jsp 페이지에 출력할 때 
	    
	    //요청 데이터 저장
	    public boolean saveRequest(ChatRequestVO chatRequest) {
			return chatRoomDAO.saveRequest(chatRequest); 
		}
	    
	    // 요청 데이터 출력
	    public List<ChatRequestVO> getRequestList(ChatRequestVO chatRequest) {
	    	return chatRoomDAO.getRequestList(chatRequest);
	    }
	    
	    // 요청 승낙 후 상태 업데이트
	    public boolean updateChatRequestAccept(String req_id){
	    	return chatRoomDAO.updateChatRequestAccept(req_id);
	    }
	    
	    // 요청 응답에 따른 채팅방 생성
	    public boolean acceptRequestAndCreateRoom(ChatRoomVO chatRoom, String random_room_id) {
	    	chatRoom.setRoom_id(random_room_id); // 난수생성 룸 아이디
	    	return chatRoomDAO.acceptRequestAndCreateChatRoom(chatRoom);
	    }
		
		// chatRoomList
	    public List<ChatRoomVO> getAllChatRooms(ChatRoomVO chatRoom){
	    	return chatRoomDAO.getAllChatRooms(chatRoom);
	    }
//	    public List<ChatRoomVO> getAllChatRooms() {
//	        return chatRoomDAO.getAllChatRooms();
//	    }
//		
//	    // find Room by Id
//	    public ChatRoomVO findRoomById (String room_id) {
//	    	return chatRoomDAO.findRoomById(room_id);
//	    }
	    
	    // 요청에 따른 거절
	    public boolean rejectRequest(ChatRequestVO chatRequest) {
	    	return chatRoomDAO.rejectRequest(chatRequest);
	    }

	    // 채팅방 정보 전달
		public List<ChatMessageVO> getRoomInfo(String room_id) {
			return chatRoomDAO.getRoomInfo(room_id);
		}
		
		// 채팅방 메시지 저장 
		public int saveMessage(ChatMessageVO chatMessage) {
			return chatRoomDAO.saveMessage(chatMessage);
		}
		
		// 채팅방 메시지 저장된 내역 가져오기
//		public List<ChatMessageVO> getMessageByRoomId(String room_id) {
//			return chatRoomDAO.getMessageByRoomId(room_id);
//		}
	    
	    
	    


}
