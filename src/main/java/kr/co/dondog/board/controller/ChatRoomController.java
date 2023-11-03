package kr.co.dondog.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.board.dao.ChatRoomDAO;
import kr.co.dondog.board.vo.ChatRoom;
import kr.co.dondog.board.service.ChatRoomService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chat")
public class ChatRoomController {

	private final ChatRoomService chatRoomService;

	@GetMapping("/roomList")
	public String roomList(Model model) {
		System.out.println("ChatRoomController -> roomList()");
		return "/chat/roomList";
	}

	@GetMapping("/rooms")
	@ResponseBody
	public List<ChatRoom> rooms() {
		System.out.println("ChatRoomController -> rooms()");
		return chatRoomService.findAllRoom();
	}

	@PostMapping("/room")
	@ResponseBody
	public ChatRoom createRoom(@RequestParam String name) {
		System.out.println("ChatRoomController -> createRoom()");
		return chatRoomService.createChatRoom(name);
	}

	@GetMapping("/room/enter/{roomId}")
	public String roomEnter(Model model, @PathVariable String roomId) {
		System.out.println("ChatRoomController -> roomEnter()");
		model.addAttribute("roomId", roomId);
		return "/chat/chatRoom";
	}

	@GetMapping("/room/{roomId}")
	@ResponseBody
	public ChatRoom roomInfo(@PathVariable String roomId) {
		System.out.println("ChatRoomController -> roomInfo()");
		return chatRoomService.findRoomById(roomId);
	}
}