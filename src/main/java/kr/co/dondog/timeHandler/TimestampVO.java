package kr.co.dondog.timeHandler;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class TimestampVO {
	private int tnum;
	private Timestamp timestamp;
	
	 public TimestampVO() {}
	 
}
