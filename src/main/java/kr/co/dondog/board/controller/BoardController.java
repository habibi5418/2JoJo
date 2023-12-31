package kr.co.dondog.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.board.vo.BoardHeartVO;
import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.board.vo.BoardVO;
import kr.co.dondog.chat.vo.ChatRequestVO;
import kr.co.dondog.dog.service.DogService;
import kr.co.dondog.member.security.auth.PrincipalDetails;
import kr.co.dondog.member.service.MemberService;
import kr.co.dondog.member.vo.MemberReportVO;
import kr.co.dondog.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	private static final String CURR_IMAGE_REPO_PATH = "/dondog_file";

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DogService dogService;
	
	// 게시판 이동
	@RequestMapping(value = "/list", produces = "application/text; charset=UTF-8")
	public String list(Model model, BoardVO board) {
		model.addAttribute("boardList", boardService.getBoardList(board));
		return "board/boardList";
	}
	
	// 게시판 더보기
	@ResponseBody
	@RequestMapping(value = "/more", produces = "application/text; charset=UTF-8")
	public String more(@RequestBody BoardVO board) {
		return boardService.getMoreBoardPageList(board).toString();
	}

	// 게시글 작성 폼 이동
	@RequestMapping(value = "/writeForm", produces = "application/text; charset=UTF-8")
	public String writeForm(Model model, Authentication authentication) throws Exception {
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
	         PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
	         MemberVO member= (MemberVO) userDetails.getUser();
	         model.addAttribute("dogList", dogService.getList(member.getEmail()));
	         model.addAttribute("loggedInMember", member);
		}
		return "board/boardWriteForm";
	}

	// 게시글 작성
	@ResponseBody
	@RequestMapping(value = "/write", produces = "application/text; charset=UTF-8")
	public String write(BoardVO board, MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("boardWrite() : " + board);

		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		board.setBoardImgList(fileProcess(multipartRequest));
		
		return boardService.write(board).toString();
	}
	
	private List<BoardImgVO> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<BoardImgVO> fileList = new ArrayList<>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String fileNameOrg = mFile.getOriginalFilename();
			String realFolder = sdf.format(now.getTime());
			
			File file = new File(CURR_IMAGE_REPO_PATH + realFolder);
			if (file.exists() == false) {
				file.mkdirs();
			}

			String fileNameReal = UUID.randomUUID().toString() + fileNameOrg.substring(fileNameOrg.lastIndexOf("."));
			
			//파일 저장 
			mFile.transferTo(new File(file, fileNameReal)); //임시로 저장된 multipartFile을 실제 파일로 전송

			fileList.add(
					BoardImgVO.builder()
					.fname(fileNameOrg)
					.sname(realFolder + "/" + fileNameReal)
					.length((int) mFile.getSize())
					.ftype(mFile.getContentType())
					.build()
					);
		}
		return fileList;
	}	

	// 게시글 작성
//	@RequestMapping(value = "/write", produces = "application/json; charset=UTF-8")
//	@ResponseBody
//	public String write(@RequestBody BoardVO board) { 
//		return boardService.write(board).toString();
//	}

	// 강아지 현황 리로드
	@RequestMapping(value = "/reloadDog", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String reloadDog(@RequestParam("email") String email) throws Exception { 
		JSONObject result = new JSONObject();
		result.put("reloadDogList", dogService.getRecent(email));
		
		return result.toString();
	}
	
	// 게시글 상세보기
	@RequestMapping(value = "/detail", produces = "application/text; charset=UTF-8")
	public String detail(@RequestParam("bnum") int bnum, Model model,Authentication authentication, HttpServletRequest req) throws Exception {
		BoardVO board = boardService.getBoard(bnum);
		model.addAttribute("board", board);
		model.addAttribute("boardDogInfoList", dogService.getBoardDogList(board));
		
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
            PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
            MemberVO member= (MemberVO) userDetails.getUser();
            model.addAttribute("member", member);

            // 신고 여부 가져오기
            model.addAttribute("reportStatus", memberService.getReportStatus(new MemberReportVO(board.getEmail(), member.getEmail())));
            // 좋아요 여부 가져오기
            model.addAttribute("heartStatus", boardService.getHeartStatus(new BoardHeartVO(bnum, member.getEmail())));
            // 꼬숩도 가져오기
            model.addAttribute("manner", memberService.getManner(board));
            
			ChatRequestVO reqInfo = new ChatRequestVO();
			reqInfo.setBnum(board.getBnum());
        	// 작성자 resp
    		if (member.getEmail().equals(board.getEmail())) {
    			reqInfo.setReceiver(member.getEmail());
    			List<ChatRequestVO> response = boardService.getResponse(reqInfo);
    			model.addAttribute("response", response);
    		} else {
    			// 작성자!=유저 request
    			reqInfo.setSender(member.getEmail());
    			List<ChatRequestVO> request = boardService.getRequest(reqInfo);
    			model.addAttribute("request", request);
    		}
		}
			
		return "board/boardDetail";
	}

	// 좋아요 추가
	@RequestMapping(value = "/addHeart", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String addHeart(@RequestBody BoardHeartVO boardHeart) throws Exception { 
		boardService.addHeart(boardHeart);
		
		return "";
	}

	// 좋아요 삭제
	@RequestMapping(value = "/deleteHeart", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String deleteHeart(@RequestBody BoardHeartVO boardHeart) throws Exception { 
		boardService.deleteHeart(boardHeart);
		return "";
	}

	// 꼬숩도 + 1
	@RequestMapping(value = "/plusManner", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String plusManner(@RequestBody MemberVO member) throws Exception { 
		memberService.plusManner(member);
		return "";
	}

	// 꼬숩도 - 1
	@RequestMapping(value = "/minusManner", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String minusManner(@RequestBody MemberVO member) throws Exception { 
		memberService.minusManner(member);
		return "";
	}
	  
	// 신고
	@RequestMapping(value = "/report", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String report(@RequestBody MemberReportVO memberReort) {
		return memberService.report(memberReort).toString();
	}
}
