package com.jeju.app.boards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/boards/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception{
		BoardDTO boardDTO = new BoardDTO();
		
		List<BoardDTO> ar = boardService.getList(boardDTO);
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public void add(BoardDTO boardDTO, Model model) throws Exception {
		int result = boardService.add(boardDTO);
	}
}
