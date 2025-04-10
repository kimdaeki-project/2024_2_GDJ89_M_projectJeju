package com.jeju.app.publicBoards.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.pages.PB_Pager;
import com.jeju.app.users.UserDTO;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList(Model model, PB_Pager pager) throws Exception{
		
		List<QnaDTO> ar = qnaService.getList(pager);
		
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(Model model, QnaDTO qnaDTO) throws Exception{
		qnaDTO = qnaService.getDetail(qnaDTO);
		model.addAttribute("dto", qnaDTO);
		
		return "qna/detail";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public String reply(@ModelAttribute("dto") QnaDTO qnaDTO) throws Exception{
		return "qna/add";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String reply(QnaDTO qnaDTO, HttpSession session) throws Exception{
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		
		qnaDTO.setUserID(userDTO.getUserID());
		
		int result = qnaService.reply(qnaDTO);
		
		return "redirect:./list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(QnaDTO qnaDTO, HttpSession session) throws Exception{
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		
		qnaDTO.setUserID(userDTO.getUserID());
		
		int result = qnaService.add(qnaDTO);
		
		return "redirect:./list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() throws Exception{
		return "qna/add";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(QnaDTO qnaDTO, Model model) throws Exception{
		qnaDTO = qnaService.getDetail(qnaDTO);
		model.addAttribute("dto", qnaDTO);
		
		return "qna/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(QnaDTO qnaDTO) throws Exception{
		int result = qnaService.update(qnaDTO);
		
		return "redirect:./detail?boardNum="+qnaDTO.getBoardNum();
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(QnaDTO qnaDTO, Model model) throws Exception{
		qnaDTO = qnaService.getDetail(qnaDTO);
		String path = "list";
		
		int result = qnaService.delete(qnaDTO);
		
		String s = "삭제를 실패했습니다.";
		
		if (result > 0) {
			s = "삭제를 실패했습니다.";
		}
		
		model.addAttribute("result", s);
		model.addAttribute("path", path);
		
		return "commons/result";
	}
}
