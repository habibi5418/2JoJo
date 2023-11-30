package kr.co.dondog.chat.vo;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRequestVO {
	private String req_id; // 요청 식별자 
	private String sender;
	private String receiver; // 게시글작성자
	private Timestamp req_send_time; // default CURRENT_TIMESTAMP
	private String req_status; // default: 대기 "W" / 승낙 "A" 거절 "R"
	private int bnum;
}
