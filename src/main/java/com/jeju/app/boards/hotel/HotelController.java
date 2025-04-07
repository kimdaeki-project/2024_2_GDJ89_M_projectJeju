package com.jeju.app.boards.hotel;

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
@RequestMapping(value = "/boards/hotel/*")
public class HotelController {
	
	@Autowired
	private HotelService hotelService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, Pager pager) throws Exception{
		
		System.out.println("hotel List");
		
		List<BoardDTO> ar = hotelService.getList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}
	
	@RequestMapping(value = "cardlist", method = RequestMethod.GET)
	public void getCardList(Model model, Pager pager) throws Exception {
		
		System.out.println("diner cardList");
		
		List<BoardDTO> ar = hotelService.getcardList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
	}

}
