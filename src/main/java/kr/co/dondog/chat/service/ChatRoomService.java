package kr.co.dondog.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.chat.dao.ChatRoomDAO;
import kr.co.dondog.chat.entity.ChatRoomEntity;
import kr.co.dondog.chat.vo.ChatRequestVO;

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
		

		public List<ChatRoomEntity> findAllRooms() {
			return chatRoomDAO.findAllRooms();
		}

		
		
		
		 

}
