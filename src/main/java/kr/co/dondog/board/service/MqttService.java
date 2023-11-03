package kr.co.dondog.board.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import kr.co.dondog.board.dao.ChatRoomDAO;
import kr.co.dondog.board.vo.ChatRoom;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MqttService {

	private final ChatRoomDAO chatRoomDAO;

	public List<ChatRoom> findAllRoom() {
		System.out.println("MqttService -> findAllRoom()");
		return chatRoomDAO.findAllRoom();
	}

	public ChatRoom createChatRoom(String name) {
		System.out.println("MqttService -> createChatRoom()");
		return chatRoomDAO.createChatRoom(name);
	}

	public ChatRoom findRoomById(String roomId) {
		System.out.println("MqttService -> findRoomById()");
		return chatRoomDAO.findRoomById(roomId);
	}

	public void execute(String topic, String payload) {
		System.out.println("MqttService -> execute()");
		String[] cmdParams = StringUtils.split(topic, "/");
		System.out.println("topic = " + topic);
		System.out.println("payload = " + payload);
	}
}