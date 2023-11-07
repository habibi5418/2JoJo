package kr.co.dondog.chat.vo;

import lombok.Data;

@Data
public class ChatMessageVO {
	/* *
	 * * 기능: 1:1 채팅방 페이지 
	 * 
	 * */
	private int cnum; //채팅방 식별
	private int bnum; //게시글 식별 
	private String senderId; // 송신인(상대)
	private String receiverId; //수신인(게시글작성자)
	private MessageType mtype;
	private String message;
	
	public enum MessageType {
		ENTER
	}
	
	public void mtypeProcess() {
		switch (mtype) {
		case ENTER:
			message = "[ "+ senderId + " ] wants to be with you.";
			break;
		default:
		}
	}

}
