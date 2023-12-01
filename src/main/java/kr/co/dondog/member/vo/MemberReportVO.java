package kr.co.dondog.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberReportVO {
	private String reported; // 신고 당한 사람
	private String reporter; // 신고한 사람
	
}
