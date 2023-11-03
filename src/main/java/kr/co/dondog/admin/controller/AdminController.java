package kr.co.dondog.admin.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping(value = "/mainDashBoard")
    public String admin(Locale locale, Model model) {
        // 뷰 이름을 반환하도록 수정
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
