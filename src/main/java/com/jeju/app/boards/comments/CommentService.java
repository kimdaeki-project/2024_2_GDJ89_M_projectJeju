package com.jeju.app.boards.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.app.pages.Pager;
import com.jeju.app.users.UserDTO;

@Service
public class CommentService {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public List<CommentDTO> getCommentsList(Pager pager, CommentDTO commentDTO) throws Exception{
		System.out.println("service CommentList");
		
		Long totalCount = commentDAO.getCommentsCount(commentDTO);
		System.out.println(totalCount);
		pager.make(totalCount);
		pager.makeNum();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comments", commentDTO);
		map.put("pager", pager);
		
		List<CommentDTO> ar = commentDAO.getCommentsList(map);
		
		return ar;
	}
	
	public int addComments(CommentDTO commentDTO, HttpSession session) throws Exception{
		
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		commentDTO.setUserID(userDTO.getUserID());
		
		return commentDAO.addComments(commentDTO);
	}
	
	public int deleteComments(CommentDTO commentDTO) throws Exception{
		return commentDAO.deleteComments(commentDTO);
	}
	
	public int updateComments(CommentDTO commentDTO) throws Exception{
		return commentDAO.updateComments(commentDTO);
	}
}
