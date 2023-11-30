package kr.co.dondog.chat.vo;

import java.util.UUID;

public class Util {
	public static String randomUid() {
		return  UUID.randomUUID().toString();
	}
}
