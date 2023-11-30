package kr.co.dondog.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.admin.vo.SearchVO;
import kr.co.dondog.admin.service.AdminService;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.member.vo.MemberVO;

@Controller
public class AdminController {
	 @Autowired
	  private AdminService adminservice;
	 
	// 메인 대시보드 이동 ( 일일 가입자, 일일 게시글수, 블랙회원 비율, 누적 채팅방, 컬러 차트 부분 이름)
    @RequestMapping(value = "/admin/mainDashBoard")
    public String admin(HttpServletRequest request, HttpServletResponse res) {
    	 System.out.println("AdminController.mainDashBoard");
    	
    	 //서비스 이동
    	 int dayJoinMemberCount = adminservice.dayJoinMemberCount();
    	 int dayRegBoerdCount = adminservice.dayRegBoerdCount();
    	 int blackCounts = adminservice.blackCounts();
    	 int chatRoomCount = adminservice.chatRoomCount();
//    	 List<Map<String, Object>> topDogCounts = adminservice.topDogCounts();
    	 // jsp 에서 컬럼명 가져올떄 사용
    	 List<DogVO> topDogCounts = adminservice.topDogCounts();
    	 String[] colors = {"primary", "success", "info", "warning", "secondary"};
    	 
    	 
    	 request.setAttribute("dayJoinMemberCount", dayJoinMemberCount);
    	 request.setAttribute("dayRegBoerdCount", dayRegBoerdCount);
    	 request.setAttribute("blackCounts", blackCounts);    	 
    	 request.setAttribute("chatRoomCount", chatRoomCount);    	 
    	 request.setAttribute("topDogCounts", topDogCounts);
    	 request.setAttribute("colors", colors);
    	 
        return "admin/mainDashBoard";
    }
	
    //차트 js에서 사용 , 상위4등까지의 강쥐 종류
    @RequestMapping(value ="/admin/topDogCounts", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<DogVO> topDogCounts() {
        List<DogVO> topDogCounts = adminservice.topDogCounts();
        System.out.println(topDogCounts);
        return topDogCounts;
    }
    //차트 js사용 전체 강쥐수
    @RequestMapping(value ="/admin/totalDogCounts", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public int totalDogCounts() {
    	int totalDogCounts = adminservice.totalDogCounts();
        System.out.println(totalDogCounts);
        return totalDogCounts;
    }
    

	@RequestMapping(value = "/login", produces = "application/json; charset=UTF-8")
	public String login(Locale locale, Model model) {
		return "admin/login";
	}
	
		
	
	// 전체회원리스트 (회원관리)
	@RequestMapping(value = "/admin/memberList")
	public String memberList(Model model) throws Exception {
	    System.out.println("AdminController.memberList()");

	    try {
	        List<MemberVO> memberList = adminservice.getMemberAllList();
	        model.addAttribute("memberList", memberList);

	        // 옵션 값 설정
	        List<String> reportsOptions = Arrays.asList("0", "1", "2", "3", "4", "5");
	        List<String> blackOptions = Arrays.asList("Y", "N");
	        List<String> accountLockedOptions = Arrays.asList("Y", "N");
	        List<String> cancelsOptions = Arrays.asList("Y", "N");

	        model.addAttribute("reportsOptions", reportsOptions);
	        model.addAttribute("blackOptions", blackOptions);
	        model.addAttribute("accountLockedOptions", accountLockedOptions);
	        model.addAttribute("cancelsOptions", cancelsOptions);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "admin/memberList";
	}
	
	
	//회원관리
	@RequestMapping("/admin/updateMember")
	@ResponseBody
	public Map<String, Object> updateMember(@RequestBody Map<String, String> data) {
		System.out.println("AdminController.updateMember");

	    String email = data.get("email");
	    String field = data.get("field");
	    String value = data.get("value");
	
	    Map<String, Object> response = new HashMap<>();

	    try {
	    	adminservice.updateMember(email, field, value);
	        // email, field, value를 사용하여 해당 멤버의 필드를 업데이트합니다.

	        response.put("success", true);
	        response.put("updatedValue", value);
	        
	        
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", e.getMessage());
	    }

	    return response;
	}
	
	
	
//	===========================페이징, 검색 , 건수 부분==============================
	
//	@RequestMapping(value="/admin/listJSON", method = {RequestMethod.GET, RequestMethod.POST})
//    @ResponseBody
//	public Map<String, Object> listJSON (@ModelAttribute("searchVO") SearchVO searchVO, HttpServletRequest request) throws Exception {
//		System.out.println("listJSON");
//    	//DataTable 검색인자 설정
//		searchVO.setOrderColumn(request.getParameter("order[0][column]"));
//		searchVO.setDir(request.getParameter("order[0][dir]"));
//    	
//		//상위 코드 목록 얻기 
//		return adminservice.searchMemberList(searchVO);
//
//	}
//	 
//	@RequestMapping(value="/admin/listJSON2.do", method = RequestMethod.POST)
//    @ResponseBody
//	public Map<String, Object> listJSON2(@ModelAttribute("searchVO") SearchVO searchVO, HttpServletRequest request) throws Exception {
//    	
//		//상위 코드 목록 얻기 
//		return adminservice.searchMemberList2(searchVO);
//
//	}

//	@ResponseBody 
//	@RequestMapping(value = "/json/memberList.do", method = RequestMethod.GET)
//	public JSONObject jsonBoardList(Model model) throws JSONException, Exception {
////		logger.info("jsonMemberList {}.", adminservice.getMemberAllList());
//		
//		JSONObject jsonResult = new JSONObject();
//		
//		jsonResult.put("memberList", adminservice.getMemberAllList());
//		
//		return  jsonResult;
//	}

//	@ResponseBody 
//	@RequestMapping(value = "/json/memberList1.do", method = RequestMethod.GET)
//	public List<MemberVO> jsonMemberList1(Model model) throws Exception {
////		Logger.info("jsonBoardList {}.", adminservice.getMemberAllList());
//		
//		return adminservice.getMemberAllList();
//	}


	
//	========================페이지이동====================================
	
//	아래 부분은 추후 변경 예정 ...
	//멤버관련페이지이동
	@RequestMapping(value = "/admin/memberData", produces = "application/json; charset=UTF-8")
	public String memberData(Locale locale, Model model) {
		return "admin/memberData";
	}
	
//	@RequestMapping(value = "/memberList", produces = "application/json; charset=UTF-8")
//	public String memberList(Locale locale, Model model) {
//		return "admin/memberList";
//	}
	
	@RequestMapping(value = "/table", produces = "application/json; charset=UTF-8")
	public String table(Locale locale, Model model) {
		return "admin/table";
	}
	
	//
	@RequestMapping(value = "/admin/locationData", produces = "application/json; charset=UTF-8")
	public String locationData(Locale locale, Model model) {
		return "admin/locationData";
	}

}
