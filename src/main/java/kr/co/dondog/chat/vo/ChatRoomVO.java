package kr.co.dondog.chat.vo;
import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatRoomVO {
	/* *
	 * * 기능: 1:1 채팅방 페이지 
	 * */
	private String room_id; //채팅방 식별
	private int bnum; //게시글 식별 
	private String sender; // 송신인(상대)
	private String receiver; //수신인(게시글작성자)
	private int is_read;//default1 안읽음1 읽음0
	private Timestamp send_time;
	private String sender_nickname;

//	public ChatRoomVO() {}
	
	public String getRoom_id() {
        return room_id;
    }

    public String setRoom_id(String room_id) {
        return this.room_id = room_id;
    }

	public void setSender_Nickname(String nickname) {
		this.sender_nickname = nickname;
	}

	
}
