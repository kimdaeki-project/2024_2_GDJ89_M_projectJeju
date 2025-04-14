package com.jeju.app.publicBoards.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.pages.PB_Pager;
import com.jeju.app.publicBoards.PB_DTO;
import com.jeju.app.users.UserDTO;

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
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(PB_DTO dto, HttpSession session, Model model) throws Exception{
		dto = noticeService.getDetail(dto);
		model.addAttribute("dto", dto);
		
		return "notice/detail";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(PB_DTO dto, HttpSession session, Model model) throws Exception {
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		dto.setUserID(userDTO.getUserID());
		int result = noticeService.add(dto, session);
		System.out.println("conAdd"+result);
		return "redirect:./list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(HttpSession session, Model model, PB_DTO dto) throws Exception{
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		if(userDTO.getUserID().equals("admin")) {
			return "notice/add";		
		}else {
			String path = "list";
			String s = "관리자만 작성할 수 있습니다.";
			model.addAttribute("path", path);
			model.addAttribute("result", s);
			return "commons/result";
		}
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(PB_DTO dto, HttpSession session, Model model) throws Exception{
		dto = noticeService.getDetail(dto);
		String path = "list";
		int result = noticeService.delete(dto, session);
		String s = "삭제를 실패했습니다.";
		if (result>0) {
			s = "삭제를 성공했습니다.";	
		}
		model.addAttribute("result", s);
		model.addAttribute("path", path);
		return "commons/result";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(PB_DTO dto, HttpSession session, Model model) throws Exception{
		
		int result = noticeService.update(dto, session);
		
		return "redirect:./detail?boardNum="+dto.getBoardNum();
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(PB_DTO dto, Model model) throws Exception{
		dto = noticeService.getDetail(dto);
		model.addAttribute("dto", dto);
		
		return "notice/update";
	}
	
	
}
