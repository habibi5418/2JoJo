package kr.co.dondog.gps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.gps.service.GpsService;
import kr.co.dondog.gps.vo.TestVO;

@Controller
@RequestMapping(value = "/gps")
public class GpsController {
	
	@Autowired
	private GpsService gpsService;
	
	// 게시판 이동
	@RequestMapping(value = "/walk")
	public String walk(Model model) {
		return "gps/gpsWalk";
	}
	
	@RequestMapping(value = "/sendCoord", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sendCoord(@RequestBody TestVO test) { 
		System.out.println("sendCoord 보낸 데이터 : " + test);
		return gpsService.sendCoord(test).toString();
	}

	@RequestMapping(value = "/loadPark", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String loadPark() {
		return gpsService.loadPark().toString();
	}

	@RequestMapping(value = "/getRoute", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getRoute(@RequestBody TestVO test) {
		System.out.println("getRoute 보낸 데이터 : " + test);
		return gpsService.getRoute(test).toString();
	}

	@RequestMapping(value = "/getWnum", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getWnum(@RequestBody TestVO test) {
		System.out.println("getWnum 보낸 데이터 : " + test);
		return gpsService.getWnum(test).toString();
	}
	
}