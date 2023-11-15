package kr.co.dondog.gps.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TotalDistanceVO {
	private String walkDate;
	private long totalDistance;
	
}
