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
import kr.co.dondog.chat.vo.ChatMessageVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.chat.vo.ChatRoomVO;

@Repository("ChatRoomDAO")
public class ChatRoomDAOImpl implements ChatRoomDAO {

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

	@Override
	public List<ChatRequestVO> getRequestList(ChatRequestVO chatRequest) {
		return sqlSession.selectList("mapper.chat.getRequestList", chatRequest);
	}

	@Override
	public boolean updateChatRequestAccept(String req_id) {
		return 0 != sqlSession.update("mapper.chat.updateChatRequestAccept", req_id);
	}
	
	@Override
	public boolean acceptRequestAndCreateChatRoom(ChatRoomVO chatRoom) {
		return 0 != sqlSession.insert("mapper.chat.createChatRoom", chatRoom);
	}
	
	@Override
	public boolean rejectRequest(ChatRequestVO chatRequest) {
		return 0 != sqlSession.update("mapper.chat.rejectRequest", chatRequest);
	}

	@Override
	public List<ChatRoomVO> getAllChatRooms(ChatRoomVO chatRoom) {
		return sqlSession.selectList("mapper.chat.getAllChatRooms",chatRoom);
	}

	@Override
	public List<ChatMessageVO> getRoomInfo(String room_id) {
		return sqlSession.selectList("mapper.chat.getRoomInfo", room_id);
	}

	@Override
	public int saveMessage(ChatMessageVO chatMessage) {
		return sqlSession.insert("mapper.chat.saveMessage",chatMessage);
	}

//	@Override
//	public List<ChatMessageVO> getMessageByRoomId(String room_id) {
//		return sqlSession.selectList("mapper.chat.getMessageByRoomId", room_id);
//	}
	
	
//	@Override
//	public List<ChatRoomVO> getAllChatRooms() {
//		return sqlSession.selectList("mapper.chat.getAllChatRooms");
//	}

//	
//	@Override
//	public ChatRoomVO findRoomById(String room_id) {
//		return sqlSession.selectOne("mapper.chat.findRoomById",room_id);
//	}

//	@Override
//	public List<ChatRoomEntity> findAllRooms() {
//		return chatRoomMap.values().stream().sorted().collect(Collectors.toList());
//	}
	
	// 산책 페이지용 데이터 가져오기
	@Override
	public ChatRoomVO getChatRoom(String room_id) {
		return sqlSession.selectOne("mapper.chat.getChatRoom", room_id);
	}

}
