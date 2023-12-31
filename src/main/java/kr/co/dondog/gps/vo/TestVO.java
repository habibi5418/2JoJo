package kr.co.dondog.gps.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TestVO {
	private String userId;
	private int wnum;
	private Date walkDate;
	private double lat;
	private double lng;
	
	public TestVO(Date walkDate) {
		this.walkDate = walkDate;
	}
}
