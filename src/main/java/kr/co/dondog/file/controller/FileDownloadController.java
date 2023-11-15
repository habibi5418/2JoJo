package kr.co.dondog.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dondog.board.vo.BoardImgVO;
import kr.co.dondog.dog.vo.DogVO;
import kr.co.dondog.file.service.FileService;


@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "/dondog_file";

	@Autowired
	FileService fileService;
	
	@RequestMapping("/dogProfile/download")
	protected void dogProfileDownload(@RequestParam("dnum") int dnum,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		DogVO dogProfile = fileService.getProfile(dnum); 
		if (dogProfile != null) {
			String filePath = CURR_IMAGE_REPO_PATH + dogProfile.getSname();  
			File image = new File(filePath);
			FileInputStream in = new FileInputStream(image);
			
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer); 
				if (count == -1) 
					break;
				out.write(buffer, 0, count);
			}
			in.close();
			
		}
		out.close();
	}

	@RequestMapping("/boardImg/download")
	protected void boardImgDownload(@RequestParam("inum") int dnum,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		BoardImgVO boardImg = fileService.getImg(dnum); 
		if (boardImg != null) {
			String filePath = CURR_IMAGE_REPO_PATH + boardImg.getSname();  
			File image = new File(filePath);
			FileInputStream in = new FileInputStream(image);
			
			byte[] buffer = new byte[1024 * 8];
			while (true) {
				int count = in.read(buffer); 
				if (count == -1) 
					break;
				out.write(buffer, 0, count);
			}
			in.close();
			
		}
		out.close();
	}
	
	
}
