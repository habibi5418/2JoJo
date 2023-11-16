package kr.co.dondog.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.chat.entity.ChatRoomEntity;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.member.vo.MemberVO;
import kr.co.dondog.chat.service.ChatRoomService;

@Controller
@RequestMapping(value = "/chat")
public class ChatRoomController {
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@Autowired
	private BoardService boardService;
	
	/*
	 * chatRoomEntity : 생성,출력 list로 jsp 페이지에 출력할 때 
	 * chatRoomVO : 채팅방 전달하는 내용
	 * chatMessageVO :  메세지 전달하는 내용들
	 * */
	
	@RequestMapping(value = "/senderRequest")
	@ResponseBody
	public Map<String, Object> senderRequest(@RequestBody ChatRequestVO chatRequest) {
		// 1:! 채팅으로한명이 걸면 요청 막힘 
		Map<String, Object> resultMap = new HashMap<String, Object>();
//		System.out.println("!!!!!!!!!!!!!"+chatRequest);
		boolean result = chatRoomService.saveRequest(chatRequest);
		//>> 요청 보내면 bnum, 작성자아이디, 이메일 정보 테이블에 값을 넣기 >> getRequest 
		 if (result) {
			 resultMap.put("status",true);
			 resultMap.put("message","요청이 성공했습니다.");
		 }
		return resultMap;
	}
	
	
//	@PostMapping("/receiverRequest")
//    @ResponseBody
//    public String receiverResponse(@RequestBody ChatRequestVO chatRequest, @RequestParam("bnum") int bnum, Model model, HttpSession session) {
//		//board writer
//		System.out.println("chatRequest POST");
//		BoardVO board = boardService.getBoard(bnum);
//		model.addAttribute("board", board); //jsp에서 {board.nickname} 꺼내쓰기
////		model.addAttribute("receiver", board.getNickname());
//		
//		System.out.println("controller receiver"+board.getNickname());
//		
//		// 채팅 요청하는 클라이언트
////		MemberVO sender = (MemberVO) session.getAttribute("loggedInMember");
////        model.addAttribute("sender", sender);
////        System.out.println("controller sender" + sender + sender.getNickname());
//		
//        return "/chat/chatRequest";
//    }
//	
//	

	@GetMapping(value = "/roomList")
	public String chat() {
		return "/chat/roomList"; 
	}
	
	@GetMapping(value = "/chatRoom")
	public String chatRoom() {
		return "/chat/chatRoom"; 
	}

//	@GetMapping("/rooms")
//	@ResponseBody
//	public List<ChatRoomEntity> rooms() {
//		return chatRoomService.findAllRooms();
//	}
//	
//	
//	
//	@PostMapping("/{roomId}/connect")
//    public String connectToChatRoom(@PathVariable String roomId) {
//        // ChatRoomService를 통해 데이터 액세스 및 비즈니스 로직 처리
////        chatRoomService.connectToChatRoom(roomId);
//
//        // 나머지 로직 수행
//
//        return "redirect:/chat/" + roomId;
//    }
	
}
