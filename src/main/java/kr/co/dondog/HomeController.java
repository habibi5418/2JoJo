package kr.co.dondog;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.board.vo.TestVO;

@Controller
public class HomeController {
	
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/coordTest", produces = "application/json; charset=UTF-8")
	public String coordTest(Locale locale, Model model) {
		return "coordTest";
	}
	
	@RequestMapping(value = "/coordTest2", produces = "application/json; charset=UTF-8")
	public String coordTest2(Locale locale, Model model) {
		return "coordTest2";
	}
	
	@RequestMapping(value = "/sendCoord", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String sendCoord(@RequestBody TestVO test) { 
		System.out.println("sendCoord 보낸 데이터 : " + test);
		return boardService.sendCoord(test).toString();
	}

	@RequestMapping(value = "/loadPark", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String loadPark() {
		return boardService.loadPark().toString();
	}

	@RequestMapping(value = "/getRoute", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getRoute(@RequestBody TestVO test) {
		System.out.println("getRoute 보낸 데이터 : " + test);
		return boardService.getRoute(test).toString();
	}

	@RequestMapping(value = "/getWnum", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getWnum(@RequestBody TestVO test) {
		System.out.println("getWnum 보낸 데이터 : " + test);
		return boardService.getWnum(test).toString();
	}
	
	
}

