package kr.co.dondog.chat.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.board.vo.BoardHeartVO;
import kr.co.dondog.chat.vo.ChatMessageVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.chat.vo.ChatRoomVO;
import kr.co.dondog.chat.vo.Util;
import kr.co.dondog.member.security.auth.PrincipalDetails;
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
	
	@PostMapping(value = "/senderRequest")
	@ResponseBody
	public Map<String, Object> senderRequest(@RequestBody ChatRequestVO chatRequest) {
		// 1:! 채팅으로한명이 걸면 요청 막힘 
		Map<String, Object> resultMap = new HashMap<String, Object>();
//		System.out.println("!!!!!!!!!!!!!"+chatRequest);
		boolean result = chatRoomService.saveRequest(chatRequest);
		//>> 요청 보내면 bnum, 작성자아이디, 이메일 정보 테이블에 값을 넣기 >> getRequest 
		 if (result) {
			 resultMap.put("status",true);
			 resultMap.put("message","요청을 보냈습니다.");
		 }
		return resultMap;
	}
	
	@PostMapping(value = "/requestList")
	@ResponseBody
	public Map<String, Object> getRequestList(@RequestBody ChatRequestVO chatRequest){
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<ChatRequestVO> requestList = chatRoomService.getRequestList(chatRequest);
//		System.out.println("!!!!!!!!!!!!!!!!!"+requestList);
		resultMap.put("requestList", requestList);
		
	    return resultMap;
	}
	
	// 채팅 요청 승낙 후 상태 업데이트
	@PostMapping("/updateRequestStatus")
	@ResponseBody
	public Map<String, Object> updateChatRequestAccept(@RequestBody ChatRequestVO chatRequest) {
		Map<String, Object> resultMap = new HashMap<>();
		boolean result = chatRoomService.updateChatRequestAccept(chatRequest.getReq_id());
		
		if (result) {
			resultMap.put("status", true);
			resultMap.put("result", result);
		} else {
			resultMap.put("status", false);
		}
		return resultMap;
	}
	
	// 거절에 따른 처리
		@PostMapping("/rejectRequest")
		@ResponseBody
		public Map<String, Object> rejectRequest(@RequestParam ChatRequestVO chatRequest) {
		    Map<String, Object> resultMap = new HashMap<>();

		    // 거절 처리 서비스 메소드 호출
		    boolean result = chatRoomService.rejectRequest(chatRequest);
		    
		    if (result) {
		        resultMap.put("status", true);
		        resultMap.put("message", "매칭을 거절했어요.");
		    } 

		    return resultMap;
		}
	
	// 채팅 요청 승낙 후 채팅방 생성
	@PostMapping("/createChatRoom")
	@ResponseBody
	public Map<String, Object> acceptRequestAndCreateRoom(@RequestBody ChatRoomVO chatRoom) {
		Map<String, Object> resultMap = new HashMap<>();
		
		String random_room_id = Util.randomUid(); // 난수생성 룸 아이디
		boolean result = chatRoomService.acceptRequestAndCreateRoom(chatRoom, random_room_id);
		
		if (result) {
			resultMap.put("status", true);
			resultMap.put("result", result);
			resultMap.put("room_id", random_room_id);
			resultMap.put("message", "대화를 시작하세요!");   
		} 
		return resultMap;
	}
	

	// 채팅방 목록 
		@RequestMapping("/roomList")
		public String getAllChatRooms(Model model, Authentication authentication) {
			
			
			if (authentication.getPrincipal() instanceof PrincipalDetails) {
				PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
		        MemberVO member= (MemberVO) userDetails.getUser();
		        ChatRoomVO chatRoom = new ChatRoomVO();
		        chatRoom.setReceiver(member.getEmail());
		        model.addAttribute("roomList", chatRoomService.getAllChatRooms(chatRoom));
			}
			
//			return "chat/roomList";
			return "chat/chatBoot";
		}
	
		// 채팅방 정보 불러오는 처리
		@ResponseBody
		@RequestMapping("/roomInfo/{room_id}")
		public Map<String, Object> getRoomInfo(@PathVariable(value="room_id") String room_id, Authentication authentication){
//			System.out.println(room_id);
			Map<String,Object> resultMap = new HashMap<>();
			
			List<ChatMessageVO> messageList = chatRoomService.getRoomInfo(room_id);
			resultMap.put("messageList", messageList);
			
			return resultMap;
		}

	// 채팅방 메시지 저장 
	@ResponseBody
	@PostMapping("/saveMessage")
	public Map<String, Object> saveMessage(@RequestBody ChatMessageVO chatMessage) {
		System.out.println("dakljdsliqjisja"+chatMessage);
		Map<String,Object> resultMap = new HashMap<>();
		boolean isEmpty = chatMessage.getMessage() == null || chatMessage.getMessage().trim().isEmpty();

		if (isEmpty) {
			resultMap.put("stauts", false);
			resultMap.put("result", "빈 메시지는 저장하지 않음");
		} else {
			int result = chatRoomService.saveMessage(chatMessage);
			resultMap.put("stauts", true);
			resultMap.put("result", result);
		}
		
		return resultMap;
	}
	
//	@ResponseBody
//	@PostMapping("/saveMessage")
//	public Map<String, Object> saveMessage(@RequestBody ChatMessageVO chatMessage) {
//		Map<String,Object> resultMap = new HashMap<>();
//		int result = chatRoomService.saveMessage(chatMessage);
//		resultMap.put("result", result);
//		return resultMap;
//	}
//	
//	
	
	
}
