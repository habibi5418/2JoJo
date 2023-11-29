package kr.co.dondog.gps.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.gps.dao.GpsDAO;
import kr.co.dondog.gps.vo.TestVO;
import kr.co.dondog.gps.vo.TotalDistanceVO;

@Service
public class GpsService {

	@Autowired
	GpsDAO gpsDAO;
	
	public JSONObject sendCoord(TestVO test) {
		JSONObject result = new JSONObject();
		if (gpsDAO.sendCoord(test) > 0) {
			result.put("status", true);
		} else {
			result.put("status", false);
		}
		
		return result;
	}
	
	public void sendCoord2(String payload) {
		System.out.println("payload : " + payload);
	}
	
	public JSONObject loadPark() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("parkList", gpsDAO.loadPark());
		
		return jsonObject;
	}
	
	public JSONObject getRoute(TestVO test) {
		JSONObject jsonObject = new JSONObject();
		List<TestVO> routeList = gpsDAO.getRoute(test);
		jsonObject.put("routeList", routeList);
		jsonObject.put("totalDistance", getTotalDistance(routeList));
		
		return jsonObject;
	}
	
	public JSONObject getWnum(TestVO test) {
		JSONObject jsonObject = new JSONObject();
		List<TestVO> testList = gpsDAO.getWnum(test);
		jsonObject.put("wnum", testList.size() == 0 ? 0 : testList.get(0).getWnum());
		System.out.println(jsonObject);
		
		return jsonObject;
	}
	
	public JSONObject getTotalDistance() {
		JSONObject jsonObject = new JSONObject();
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat();
		format.applyPattern("yyyy-MM-dd");
		List<TotalDistanceVO> totalDistanceList = new ArrayList<TotalDistanceVO>();

		putTotalDistance(-6, calendar, totalDistanceList, format);
		putTotalDistance(1, calendar, totalDistanceList, format);
		putTotalDistance(1, calendar, totalDistanceList, format);
		putTotalDistance(1, calendar, totalDistanceList, format);
		putTotalDistance(1, calendar, totalDistanceList, format);
		putTotalDistance(1, calendar, totalDistanceList, format);
		putTotalDistance(1, calendar, totalDistanceList, format);
		
		jsonObject.put("totalDistanceList", totalDistanceList);
		
		return jsonObject;
	}

	int maxWnum = 0;
	int wnum = 0;
	
	public void putTotalDistance(int day, Calendar calendar, List<TotalDistanceVO> totalDistanceList, SimpleDateFormat format) {
		calendar.add(Calendar.DAY_OF_MONTH, day);
		TotalDistanceVO totalDistance = new TotalDistanceVO();
		List<TestVO> totalRouteList = gpsDAO.getTotalRouteList(format.format(calendar.getTime()));
		long sum = 0;
		maxWnum = 0;

		totalRouteList.forEach(totalRouteByWnum -> {
			maxWnum = maxWnum < totalRouteByWnum.getWnum() ? totalRouteByWnum.getWnum() : maxWnum; 
		});
			
		for (int i = 1; i <= maxWnum; i++) {
			List<TestVO> totalRouteListByWnum = new ArrayList<TestVO>();
			wnum = i;
			
			totalRouteList.forEach(totalRouteByWnum -> {
				if (totalRouteByWnum.getWnum() == wnum) {
					totalRouteListByWnum.add(totalRouteByWnum);
				}
			});
			
			sum += getTotalDistance(totalRouteListByWnum);
		}
		
		totalDistance.setWalkDate(format.format(calendar.getTime()));
		totalDistance.setTotalDistance(sum);
		
		totalDistanceList.add(totalDistance);
	}
	
	public long getTotalDistance(List<TestVO> routeList) {
		double EARTH_R = 6371000.0;
	    double rad = Math.PI / 180;
	    long totalDistance = 0;
	    
	    for (int i = 0; i < routeList.size() - 1; i++) {
	    	double radLat1 = rad * routeList.get(i).getLat();
	    	double radLat2 = rad * routeList.get(i + 1).getLat();
	    	double radDist = rad * (routeList.get(i).getLng() - routeList.get(i + 1).getLng());
	    	
	    	double distance = Math.sin(radLat1) * Math.sin(radLat2);
			distance = distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
			double ret = EARTH_R * Math.acos(distance);
	    			
			totalDistance += Math.round(ret); // 미터 단위
	    }
	    
		return totalDistance;
	}
}
