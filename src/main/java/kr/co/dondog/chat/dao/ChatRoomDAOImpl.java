package kr.co.dondog.chat.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dondog.chat.entity.ChatRoomEntity;
import kr.co.dondog.chat.vo.ChatRequestVO;

@Repository("ChatRoomDAO")
public class ChatRoomDAOImpl implements ChatRoomDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	
	// 채팅방 정보를 저장하는 Map
	  private Map<String, ChatRoomEntity> chatRoomMap;

	  @PostConstruct
	  private void init() {
	      chatRoomMap = new LinkedHashMap<>();
	  }
	  
		@Override
		public boolean saveRequest(ChatRequestVO chatRequest) {
			return 0 != sqlSession.insert("mapper.chat.saveRequest", chatRequest);
		}
	  
	  
	  
//	  public ChatRoomEntity selectChatRoomById(String roomId) {
//	        return sqlSession.selectOne("selectRoomById",roomId);
//	    }
//
//	    public void insertChatRoom(ChatRoomEntity chatRoom) {
//	    	sqlSession.insert("insertRoom",chatRoom);
//	    }
//
//	    public void updateChatRoom(ChatRoomEntity chatRoom) {
//	    	sqlSession.update("updateRoom", chatRoom);
//	    }

		@Override
		public List<ChatRoomEntity> findAllRooms() {
			return  chatRoomMap.values().stream().sorted().collect(Collectors.toList());
		}
	  
	  
}
