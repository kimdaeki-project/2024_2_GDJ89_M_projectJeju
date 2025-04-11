package com.jeju.app.boards.comments;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.pages.Pager;

@Controller
@RequestMapping(value = "/boards/*")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "commentsList", method = RequestMethod.GET)
	public String commentsList(Model model, CommentDTO commentDTO, Pager pager) throws Exception{
		
		List<CommentDTO> ar = commentService.getCommentsList(pager, commentDTO);
		
		model.addAttribute("list", ar);
		
		return "commons/commentsList";
	}
	
	@RequestMapping(value = "addComments", method = RequestMethod.POST)
	public String addComments(Model model, CommentDTO commentDTO, HttpSession session) throws Exception{
		
		int result = commentService.addComments(commentDTO, session);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "deleteComments", method = RequestMethod.POST)
	public String deleteComments(Model model, CommentDTO commentDTO) throws Exception{
		
		int result = commentService.deleteComments(commentDTO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "updateComments", method = RequestMethod.POST)
	public String updateComments(Model model, CommentDTO commentDTO) throws Exception{
		
		int result = commentService.updateComments(commentDTO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
}
