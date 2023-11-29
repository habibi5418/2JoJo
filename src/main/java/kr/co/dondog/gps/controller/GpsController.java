package kr.co.dondog.gps.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.dog.service.DogService;
import kr.co.dondog.gps.service.GpsService;
import kr.co.dondog.gps.vo.TestVO;
import kr.co.dondog.member.security.auth.PrincipalDetails;
import kr.co.dondog.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/gps")
public class GpsController {

	@Autowired
	private GpsService gpsService;
	
	@Autowired
	private DogService dogService;
	
	int totalWalkCnt = 0;
	
	@RequestMapping(value = "/walk")
	public String walk(Model model, Authentication authentication) throws Exception {
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
	         PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
	         MemberVO member= (MemberVO) userDetails.getUser();
	         model.addAttribute("dog", dogService.getList(member.getEmail()).get(0));
	         model.addAttribute("partnerDog", dogService.getList("test2@gmail.com").get(0)); // 임시 
		}
		return "gps/gpsWalk";
	}
	
	@RequestMapping(value = "/townSet")
	public String townSet(Model model) {
		return "gps/townSet";
	}
	
	@RequestMapping(value = "/sendCoord", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sendCoord(@RequestBody TestVO test) { 
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
		return gpsService.getRoute(test).toString();
	}

	@RequestMapping(value = "/getWnum", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getWnum(@RequestBody TestVO test) {
		return gpsService.getWnum(test).toString();
	}

	@RequestMapping(value = "/getTotalDistance", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getTotalDistance() {
		return gpsService.getTotalDistance().toString();
	}

	@RequestMapping(value = "/modTotalWalkCnt", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String modTotalWalkCnt(@RequestParam("check") String check) {
		JSONObject result = new JSONObject();
		
		if (check.equalsIgnoreCase("plus")) {
			++totalWalkCnt;
		}
		else {
			if (totalWalkCnt > 0) --totalWalkCnt;
		}
		
		result.put("totalWalkCnt", totalWalkCnt);
		
		return result.toString();
	}

	@RequestMapping(value = "/getTotalWalkCnt", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getTotalWalkCnt() {
		JSONObject result = new JSONObject();
		result.put("totalWalkCnt", totalWalkCnt);
		
		return result.toString();
	}
	
}