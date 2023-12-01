package kr.co.dondog.mypage.contoller;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dondog.board.service.BoardService;
import kr.co.dondog.dog.service.DogService;
import kr.co.dondog.member.security.auth.PrincipalDetails;
import kr.co.dondog.member.service.MemberService;
import kr.co.dondog.member.vo.MemberVO;

@RequestMapping("/profile")
@Controller
public class MyPageController {
	
	private static final String CURR_IMAGE_REPO_PATH = "/dondog_file";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private DogService dogService;
	
	@GetMapping("/myInfo")
	public String myProfilePage(Model model, Authentication authentication) throws Exception {
		if (authentication.getPrincipal() instanceof PrincipalDetails) {
	        PrincipalDetails userDetails = (PrincipalDetails) authentication.getPrincipal();
	        MemberVO principal = (MemberVO) userDetails.getUser();
	        MemberVO member= memberService.findByEmail(principal.getEmail());

	        model.addAttribute("boardCnt", boardService.getCountByMember(member));
	        model.addAttribute("boardList", boardService.getRecentBoardListByMember(member));
	        model.addAttribute("dogList", dogService.getList(member.getEmail()));
	        model.addAttribute("loggedInMember", member);
		}
		return "mypage/myProfilePage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", produces = "application/text; charset=UTF-8")
	public String update(MemberVO member, MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<String> enu = multipartRequest.getParameterNames();
		
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}
		
		member.setMemberProfileList(fileProcess(multipartRequest));
		
		return memberService.update(member).toString();
	}
	
	private List<MemberVO> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<MemberVO> fileList = new ArrayList<>();
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
					MemberVO.builder()
					.fname(fileNameOrg)
					.sname(realFolder + "/" + fileNameReal)
					.length((int) mFile.getSize())
					.ftype(mFile.getContentType())
					.build()
					);
		}
		return fileList;
	}	
	
}
