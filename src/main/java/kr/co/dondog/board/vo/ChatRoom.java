package kr.co.dondog.board.vo;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom implements Comparable<ChatRoom> {
	private String roomId;
	private String name;

	public static ChatRoom create(String name) {
		System.out.println("ChatRoom -> create()");
		return new ChatRoom(UUID.randomUUID().toString(), name);
	}

	@Override
	public int compareTo(ChatRoom o) {
		System.out.println("ChatRoom -> compareTo()");
		if (o == null)
			return 1;
		return name.compareToIgnoreCase(o.name);
	}

}
