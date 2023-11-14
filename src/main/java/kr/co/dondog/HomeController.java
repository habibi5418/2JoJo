package kr.co.dondog;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
}

