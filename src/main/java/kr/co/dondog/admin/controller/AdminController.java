package kr.co.dondog.admin.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
    	 int dayJoinMemberCount = adminservice.dayJoinMemberCount();
    	 int dayRegBoerdCount = adminservice.dayRegBoerdCount();
    	 request.setAttribute("dayJoinMemberCount", dayJoinMemberCount);
    	 request.setAttribute("dayRegBoerdCount", dayRegBoerdCount);
    	 
        return "admin/mainDashBoard";
    }
	
	@RequestMapping(value = "/login", produces = "application/json; charset=UTF-8")
	public String login(Locale locale, Model model) {
		return "admin/login";
	}
	
	@RequestMapping(value = "/memberData", produces = "application/json; charset=UTF-8")
	public String memberData(Locale locale, Model model) {
		return "admin/memberData";
	}
	
	@RequestMapping(value = "/locationData", produces = "application/json; charset=UTF-8")
	public String locationData(Locale locale, Model model) {
		return "admin/locationData";
	}
	

}
