package kr.co.dondog.timeHandler;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;



/*
 *  TimestampVO
 *  DB : DONDOG_TIMESTAMP
 *
 * 	기능: TIMESTAMP 기능을 이용하여 시간에 따라 화면에 출력되는 데이터 처리
 * */

public class TimestampHandler {


	public static String formatTimestamp(Timestamp timestamp, String format) {
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		return formatter.format(timestamp);
	}

	/*
	 * 시간 출력 방법 : 당일 시간 출력, 월.일.시.분
	 */
	public static String getCurrentTime() {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		return formatTimestamp(currentTimestamp, "MM.dd.HH:mm");
	}

	/*
	 * 시간 출력 방법 : 당일시간 출력, 시간과 분만 나오도록 처리
	 */
	public static String getTodayTime() {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		return formatTimestamp(currentTimestamp, "HH:mm");
	}

	/*
	 * 시간 출력 방법 : 당일이 아닐 때, 월.일.시간이 나오도록 처리
	 */
	public static String getNotTodayTime() {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String formattedConditionalTime = ""; // 초기값 설정

		if (now.toLocalDateTime().getDayOfMonth() != currentTimestamp.toLocalDateTime().getDayOfMonth()) {
			formattedConditionalTime = formatTimestamp(currentTimestamp, "MM.dd.HH:mm");
		}
		return formattedConditionalTime;
	}

	/*
	 * 시간 출력 방법 : 해당 년도가 아닌 경우, 년.월.일.시.분 출력
	 */
	public static String getPreviousYearTime() {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		Timestamp previousYearTimestamp = new Timestamp(currentTimestamp.getTime());
		previousYearTimestamp.setYear(previousYearTimestamp.getYear() - 1);
		return formatTimestamp(previousYearTimestamp, "yyyy.MM.dd.HH:mm");
	}

	
	/*
	 * 시간 출력 방법 : 해당 시간을 문자열로 출력 1분전: 방금, 1~59분전: 분 전
	 */
	public static String getStringTime(Timestamp messageTimestamp) {
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
		long differenceInMinutes = (currentTimestamp.getTime() - messageTimestamp.getTime()) / 60000;

		if (differenceInMinutes <= 1) {
			return "방금";
		} else if (differenceInMinutes >= 2 && differenceInMinutes <= 59) {
			return differenceInMinutes + "분 전";
		} else {
			return getHoursAgoString(differenceInMinutes);
		}

	}

	/*
	 * 시간 출력 방법 : 해당 시간을 문자열로 출력 1시간~23시59분전: 시간 전
	 */
	private static String getHoursAgoString(long minutesAgo) {
		long hoursAgo = minutesAgo / 60;
		return hoursAgo + "시간 전";
	}

	public static void main(String[] args) {
		
		
		/*
		 * 시간 사용 예시
		 * */
		// 임의로 시간 생성
		Timestamp customTimestamp1 = Timestamp.valueOf("2021-11-03 10:30:00.000000000");
		Timestamp customTimestamp2 = Timestamp.valueOf("2023-11-03 10:30:00.000000000");
		Timestamp customTimestamp3 = Timestamp.valueOf("2023-11-03 11:12:30.000000000");

		// getCurrentTime()
		String currentTime = TimestampHandler.getCurrentTime();
		System.out.println("현재 시간 (MM.dd.HH:mm): " + currentTime);

		// getTodayTime()
		String todayTime = TimestampHandler.getTodayTime();
		System.out.println("오늘 시간 (HH:mm): " + todayTime);

		// getNotTodayTime()
		String notTodayTime = TimestampHandler.getNotTodayTime();
		System.out.println("당일이 아닐 때 (MM.dd.HH:mm): " + notTodayTime);

		// getPreviousYearTime()
		String previousYearTime = TimestampHandler.getPreviousYearTime();
		System.out.println("이전 년도 (yyyy.MM.dd.HH:mm): " + previousYearTime);

		// getStringTime() 메서드 예제
		String stringTime = TimestampHandler.getStringTime(customTimestamp2);
		String stringTime3 = TimestampHandler.getStringTime(customTimestamp3);
		System.out.println("문자열: " + stringTime);
		System.out.println("문자열: " + stringTime3);
	}

}
