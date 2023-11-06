package kr.co.dondog.board.controller;

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
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/matchList")
	public String matchList(Locale locale, Model model) {
		model.addAllAttributes("matchList", boardService.getMatchList());
		return "match/matchList";
	}
	
//	@RequestMapping(value = "/sendCoord", produces = "application/json; charset=UTF-8")
//	@ResponseBody
//	public String sendCoord(@RequestBody TestVO test) { 
//		System.out.println("sendCoord 보낸 데이터 : " + test);
//		return boardService.sendCoord(test).toString();
//	}
	
}
