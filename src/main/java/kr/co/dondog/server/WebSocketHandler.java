package kr.co.dondog.server;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class WebSocketHandler {
//	private final ObjectMapper objectMapper;
//	
//	//현재 연결된 세션	
//	private final Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
//	
//	//cnum : {session1, session2}	
//	private final Map<Long, Set<WebSocketSession>> chatRoomSessionMap = new HashMap<Long, Set<WebSocketSession>>();
//	
//	// 연결 설정 후 
//	public void afterConnectionEstablished() throws Exception{
//	
//	}
//	
//	
}
