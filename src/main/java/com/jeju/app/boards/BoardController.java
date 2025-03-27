package com.jeju.app.boards;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jeju.app.pages.Pager;

@Controller
@RequestMapping(value = "/boards/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches, Model model) throws Exception {
		//user부분 C/S/DA/DT가 들어오면 구동
		//UserDTO userDTO = (UserDTO)session.getAttribute("user");
		System.out.println("before");
		boardDTO.setUserID("test");
		
		int result = boardService.add(boardDTO, session, attaches);
		System.out.println("after"+boardDTO.getBoardNum());
		
		return "redirect:./place/list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() throws Exception{
		
		System.out.println("get");
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
	public String detail(BoardDTO boardDTO, Model model, HttpSession session) throws Exception {
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
			check=true;
		}
		boardDTO=boardService.getDetail(boardDTO, check);
		model.addAttribute("dto", boardDTO);
		return "boards/detail";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(BoardDTO boardDTO, Model model) throws Exception{
		boardDTO = boardService.getDetail(boardDTO, false);
		model.addAttribute("dto", boardDTO);
		
		return "boards/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches) throws Exception{
		int result = boardService.update(boardDTO, session, attaches);
		
		return "redirect:./detail?boardNum="+boardDTO.getBoardNum();
	}
}
