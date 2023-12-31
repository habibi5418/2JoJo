package kr.co.dondog.chat.vo;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatMessageVO { //메세지 전달하는 내용들
	private String room_id;
	private Timestamp send_time; //보낸 시간 
	private String sender; // 송신인(상대)
	private String mtype_string;
	private String message;
	private MessageType mtype;
	
	public enum MessageType {
		ENTER, TALK
	}
	
	public void mtypeProcess() {
		switch (mtype_string) {
		case "ENTER":
			break;
		default:
		}
	}
	
	
}
