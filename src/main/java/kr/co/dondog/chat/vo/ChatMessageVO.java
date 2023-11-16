package kr.co.dondog.chat.vo;



import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatMessageVO { //메세지 전달하는 내용들
	private String roomId;
	private int bnum;
	private Timestamp sendTime; //보낸 시간 
	private Timestamp regDate; //채팅방 생성일
	private String sender; // 송신인(상대)
	private String receiver; //email
//	private MessageType mtype;
	private String mtype_string;
	private String message;
	
	public enum MessageType {
		ENTER, TALK
	}
	
	public void mtypeProcess() {
		switch (mtype_string) {
		case "ENTER":
			message = "[ "+ sender + " ] wants to be with you.";
			break;
		default:
		}
	}

	public void incrementConnectedCount() {
		
	}
	
	
	
}
