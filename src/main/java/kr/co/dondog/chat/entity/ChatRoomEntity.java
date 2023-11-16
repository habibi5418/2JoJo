package kr.co.dondog.chat.entity;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomEntity implements Comparable<ChatRoomEntity> { // 채팅방출력이나 생성할 떄만 사용
	  private String roomId;
	  private String name;

	  public static ChatRoomEntity create(String name) {
	      return new ChatRoomEntity(UUID.randomUUID().toString(), name);
	  }

		@Override
		public int compareTo(ChatRoomEntity o) {
			if (o == null) return 1;
			return name.compareToIgnoreCase(o.name);
		}

		
		public void setConnectedCount(int i) {
		}

	
		public void incrementConnectedCount() {
			
		}
		
}



