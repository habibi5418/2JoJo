package kr.co.dondog.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	
	
	@RequestMapping(value = "/chatList")
	public String chat() {

		return "chat/chattingPage"; 
	}
}
