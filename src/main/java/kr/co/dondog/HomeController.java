package kr.co.dondog;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.dog.service.DogService;

@Controller
public class HomeController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	DogService dogService;
	
	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8")
	public String home(Locale locale, Model model) {
		model.addAttribute("recentBoardList", boardService.getRecentBoardList());
		model.addAttribute("boardCnt", boardService.getTotalCount());
		model.addAttribute("dogCnt", dogService.getTotalCount());
		return "home";
	}
	
}

