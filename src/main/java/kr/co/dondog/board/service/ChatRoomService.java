package kr.co.dondog.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.ChatRoomDAO;
import kr.co.dondog.board.vo.ChatRoom;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService {

	private final ChatRoomDAO chatRoomDAO;

	public List<ChatRoom> findAllRoom() {
		System.out.println("ChatRoomService -> findAllRoom()");
		return chatRoomDAO.findAllRoom();
	}

	public ChatRoom createChatRoom(String name) {
		System.out.println("ChatRoomService -> createChatRoom()");
		return chatRoomDAO.createChatRoom(name);
	}

	public ChatRoom findRoomById(String roomId) {
		System.out.println("ChatRoomService -> findRoomById()");
		return chatRoomDAO.findRoomById(roomId);
	}

}
