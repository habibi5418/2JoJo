package kr.co.dondog.board.vo;

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
}
