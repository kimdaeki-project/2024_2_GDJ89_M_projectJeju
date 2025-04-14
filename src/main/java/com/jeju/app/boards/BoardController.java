package com.jeju.app.boards;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeju.app.boards.hearts.HeartDTO;
import com.jeju.app.pages.Pager;
import com.jeju.app.users.UserDTO;

@Controller
@RequestMapping(value = "/boards/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute BoardDTO boardDTO, HttpSession session, MultipartFile files, Model model) throws Exception {
		//user부분 C/S/DA/DT가 들어오면 구동
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		boardDTO.setUserID(userDTO.getUserID());
		System.out.println(files.getOriginalFilename());
		int result = boardService.add(boardDTO, session, files);
		
		return "redirect:./place/list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() throws Exception{
		return "boards/add";
	}
	
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String Check(BoardDTO boardDTO, Model model) throws Exception{
		int result = 0;
		if(boardDTO.getLocation().equals("lo1")) {
			result = 1;
		}
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";	
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(BoardDTO boardDTO, Model model, HttpSession session, @RequestParam("boardNum") Long boardNum, HeartDTO heartDTO) throws Exception {
		Object obj = session.getAttribute("board");
		boolean check = false;
		if (obj != null) {
			HashSet<Long> ar = (HashSet<Long>)obj;
			if(!ar.contains(boardDTO.getBoardNum())) {
				check=true;
			}else {
				ar.add(boardDTO.getBoardNum());
			}
		}else {
			HashSet<Long> num = new HashSet<Long>();
			num.add(boardDTO.getBoardNum());
			session.setAttribute("board", num);
			System.out.println(boardDTO.getBoardHits());
			check=true;
		}
		boardDTO=boardService.getDetail(boardDTO, check);
		
		model.addAttribute("dto", boardDTO);
		
		//좋아요 기능
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		if (userDTO==null) {
			heartDTO.setUserID("null");
		}else {
			heartDTO.setUserID(userDTO.getUserID());
			heartDTO = boardService.findHeart(heartDTO);
			
		}
		model.addAttribute("heart", heartDTO);
		
		return "boards/detail";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.POST)
	public String heart(HeartDTO heartDTO, HttpSession session) throws Exception{
			UserDTO userDTO = (UserDTO)session.getAttribute("user");
			
			heartDTO.setUserID(userDTO.getUserID());
			boardService.insertHeart(heartDTO);
		
		return "redirect:./detail?boardNum="+heartDTO.getBoardNum();
	}
	
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(BoardDTO boardDTO, Model model, HttpSession session, HttpServletRequest request) throws Exception{
		boardDTO = boardService.getDetail(boardDTO, false);
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		String userID = request.getParameter("userID");
		if (userID.equals(userDTO.getUserID())) {
			model.addAttribute("dto", boardDTO);
		
		return "boards/update";
		}else {
			String path = "";
			if(boardDTO.getCategory()==1) {
				path = "place/list";
			} else if (boardDTO.getCategory()==2) {
				path = "diner/list";
			}else {
				path = "hotel/list";
			}
			int result = 0;
			String s = "글쓴이만 수정할 수 있습니다.";
			model.addAttribute("result", s);
			model.addAttribute("path", path);
		}
		
		return "commons/result"; 
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches, HttpServletRequest request) throws Exception{
		
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		String userID = request.getParameter("userID");
		System.out.println(userDTO.getUserID()+"session");
		System.out.println(userID+"board");
		if (userID.equals(userDTO.getUserID())) {
			int result = boardService.update(boardDTO, session, attaches);
		} else {
			
		}
		return "redirect:./detail?boardNum="+boardDTO.getBoardNum();
		
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(BoardDTO boardDTO, HttpSession session, Model model, HttpServletRequest request) throws Exception{
		boardDTO = boardService.getDetail(boardDTO, false);
		String path = "";
		if(boardDTO.getCategory()==1) {
			path = "place/list";
		} else if (boardDTO.getCategory()==2) {
			path = "diner/list";
		}else {
			path = "hotel/list";
		}
		String s = "";
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		String userID = request.getParameter("userID");
		
		if (userID.equals(userDTO.getUserID())) {
			int result = boardService.delete(boardDTO, session);
			if (result>0) {
				s = "삭제를 성공했습니다.";	
			}else {
				s = "삭제를 실패했습니다.";
			}
		}else {
			s = "글쓴이만 삭제할 수 있습니다.";
		}
		
		
		model.addAttribute("result", s);
		model.addAttribute("path", path);
		
		return "commons/result";
	}
	
	@RequestMapping(value = "fileDelete", method = RequestMethod.POST)
	public String fileDelete(BoardFileDTO boardFileDTO, Model model, HttpSession session) throws Exception{
		int result = boardService.fileDelete(boardFileDTO, session);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "detailFiles", method = RequestMethod.POST)
	public String detailFiles(MultipartFile uploadFile, HttpSession session, Model model, BoardDTO boardDTO) throws Exception{
		String fileName = boardService.detailFiles(session, uploadFile, boardDTO);
		fileName = "/resources/images/boards/"+fileName;
		model.addAttribute("result", fileName);
		
		return "commons/ajaxResult";
	}
}
