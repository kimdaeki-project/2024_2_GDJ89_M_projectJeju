package com.jeju.app.boards.place;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.boards.BoardDTO;
import com.jeju.app.boards.comments.CommentDTO;
import com.jeju.app.pages.Pager;

@Controller
@RequestMapping(value = "/boards/place/*")
public class PlaceController {
	
	@Autowired
	private PlaceService placeService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, Pager pager) throws Exception{
		
		System.out.println("place List");
		
		List<BoardDTO> ar = placeService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	
	@RequestMapping(value = "cardlist", method = RequestMethod.GET)
	public void getCardList(Model model, Pager pager) throws Exception {
		
		System.out.println("place cardList");
		
		List<BoardDTO> ar = placeService.getcardList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(BoardDTO boardDTO, Model model, HttpSession session, CommentDTO commentDTO, Pager pager) throws Exception{
		Object obj = session.getAttribute("board");
		boolean check = false;
			if (obj != null) {
				HashSet<Long> ar = (HashSet<Long>)obj;
				if (!ar.contains(boardDTO.getBoardNum())) {
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
		boardDTO = placeService.getDetail(boardDTO, false);
		model.addAttribute("dto", boardDTO);
		
		return "board/detail";
	}
}
