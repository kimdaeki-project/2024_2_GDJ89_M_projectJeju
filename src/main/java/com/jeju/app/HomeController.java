package com.jeju.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.boards.BoardDTO;
import com.jeju.app.publicBoards.PB_DTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService homeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, BoardDTO boardDTO, PB_DTO dto) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		BoardDTO max = homeService.getMaxHit(boardDTO);
		BoardDTO max2 = homeService.getMaxHit2(boardDTO);
		PB_DTO notice = homeService.getNotice(dto);
		
		model.addAttribute("list", max);
		model.addAttribute("list2", max2);
		model.addAttribute("notice", notice);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	
}
