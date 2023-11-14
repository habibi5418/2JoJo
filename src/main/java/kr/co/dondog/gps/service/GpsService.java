package kr.co.dondog.gps.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dondog.gps.dao.GpsDAO;
import kr.co.dondog.gps.vo.TestVO;

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
	
	public JSONObject loadPark() {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("parkList", gpsDAO.loadPark());
		
		return jsonObject;
	}
	
	public JSONObject getRoute(TestVO test) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("routeList", gpsDAO.getRoute(test));
		System.out.println("getRoute 받은 데이터 : " + jsonObject);
		
		return jsonObject;
	}
	
	public JSONObject getWnum(TestVO test) {
		JSONObject jsonObject = new JSONObject();
		List<TestVO> testList = gpsDAO.getWnum(test);
		jsonObject.put("wnum", testList.size() == 0 ? 0 : testList.get(0).getWnum());
		System.out.println(jsonObject);
		
		return jsonObject;
	}
}
