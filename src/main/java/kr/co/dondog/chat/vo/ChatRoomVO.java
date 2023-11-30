package kr.co.dondog.chat.vo;
import java.security.Timestamp;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
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

//	public ChatRoomVO() {}
	
	public String getRoom_id() {
        return room_id;
    }

    public String setRoom_id(String room_id) {
        return this.room_id = room_id;
    }
//	
	
	/*  이부분은 나중에 합쳐도 될지도
	 * * 기능: 사용자가 게시글을 보고 채팅을 요청했을 시, 요청여부(승낙/거절)에 따라 채팅방 목록에 새 채팅방 생성
	 * */
	// private int reqStatus; //요청상태 0: 대기 1: 수락 2: 거절 
	
	// 현재 채팅방 외에는 전부 마지막으로 온 시간이 출력되어야 되기 때문에 
	// 라스트 타임을 불러와야됨 >trigger를 이용해서 현재 채팅방에 글이 작성되
	// 업데이트 될 때마다 업데이트 되도록 trigger > after >  insert처리하기
	
}
