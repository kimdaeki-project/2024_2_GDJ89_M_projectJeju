package com.jeju.app.boards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.pages.Pager;

@Controller
@RequestMapping(value = "/boards/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, Pager pager) throws Exception{
		
		System.out.println("controller List");
		
		List<BoardDTO> ar = boardService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	
	@RequestMapping(value = "cardlist", method = RequestMethod.GET)
	public void getCardList(Model model, Pager pager) throws Exception {
		
		System.out.println("controller cardList");
		
		List<BoardDTO> ar = boardService.getcardList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	

	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public void add(BoardDTO boardDTO, Model model) throws Exception {
		int result = boardService.add(boardDTO);
	}
}
