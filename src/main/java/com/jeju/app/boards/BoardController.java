package com.jeju.app.boards;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jeju.app.pages.Pager;

@Controller
@RequestMapping(value = "/boards/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, Pager pager) throws Exception{
		
		System.out.println("hotel List");
		
		List<BoardDTO> ar = boardService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	
	@RequestMapping(value = "cardlist", method = RequestMethod.GET)
	public void getCardList(Model model, Pager pager) throws Exception {
		
		System.out.println("diner cardList");
		
		List<BoardDTO> ar = boardService.getcardList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches) throws Exception {
		//user부분 C/S/DA/DT가 들어오면 구동
		//UserDTO userDTO = (UserDTO)session.getAttribute("user");
		boardDTO.setUserID("test");
		
		int result = boardService.add(boardDTO, session, attaches);
		
		return "redirect:./list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() throws Exception{
		return "boards/add";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail() throws Exception {
		return "boards/detail";
	}
}
