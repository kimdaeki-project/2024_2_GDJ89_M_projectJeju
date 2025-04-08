package com.jeju.app.publicBoards.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.pages.PB_Pager;
import com.jeju.app.publicBoards.PB_DTO;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, PB_Pager pager) throws Exception{
		List<PB_DTO> ar = noticeService.getList(pager);
		
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void add(PB_DTO dto) throws Exception {
		int result = noticeService.add(dto);
	}
}
