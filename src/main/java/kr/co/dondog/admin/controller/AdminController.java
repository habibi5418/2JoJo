package kr.co.dondog.admin.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.admin.service.AdminService;
import kr.co.dondog.dog.vo.DogVO;

@Controller
public class AdminController {
	 @Autowired
	  private AdminService adminservice;
	 
	// 메인 대시보드 이동 ( 일일 가입자, 일일 게시글수)
    @RequestMapping(value = "/mainDashBoard")
    public String admin(HttpServletRequest request, HttpServletResponse res) {
    	 System.out.println("AdminController.mainDashBoard");
    	
    	 //서비스 이동
    	 int dayJoinMemberCount = adminservice.dayJoinMemberCount();
    	 int dayRegBoerdCount = adminservice.dayRegBoerdCount();
//    	 List<Map<String, Object>> topDogCounts = adminservice.topDogCounts();
    	 // jsp 에서 컬럼명 가져올떄 사용
    	 List<DogVO> topDogCounts = adminservice.topDogCounts();
    	 String[] colors = {"primary", "success", "info", "warning", "secondary"};
    	 
    	 
    	 request.setAttribute("dayJoinMemberCount", dayJoinMemberCount);
    	 request.setAttribute("dayRegBoerdCount", dayRegBoerdCount);
    	 request.setAttribute("topDogCounts", topDogCounts);
    	 request.setAttribute("colors", colors);
    	 
        return "admin/mainDashBoard";
    }
	
    //차트 js에서 사용 , 상위4등까지의 강쥐 종류
    @RequestMapping(value ="/topDogCounts", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<DogVO> topDogCounts() {
        List<DogVO> topDogCounts = adminservice.topDogCounts();
        System.out.println(topDogCounts);
        return topDogCounts;
    }
    //차트 js사용 전체 강쥐수
    @RequestMapping(value ="/totalDogCounts", produces = "application/json; charset=UTF-8")
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
	
	//멤버관련페이지이동
	@RequestMapping(value = "/memberData", produces = "application/json; charset=UTF-8")
	public String memberData(Locale locale, Model model) {
		return "admin/memberData";
	}
	
	//
	@RequestMapping(value = "/locationData", produces = "application/json; charset=UTF-8")
	public String locationData(Locale locale, Model model) {
		return "admin/locationData";
	}
	

}
