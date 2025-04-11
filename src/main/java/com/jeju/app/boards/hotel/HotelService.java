package com.jeju.app.boards.hotel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.app.boards.BoardDAO;
import com.jeju.app.boards.BoardDTO;
import com.jeju.app.boards.BoardDTO2;
import com.jeju.app.boards.BoardFileDTO;
import com.jeju.app.boards.comments.CommentDAO;
import com.jeju.app.boards.comments.CommentDTO;
import com.jeju.app.pages.Pager;
import com.jeju.app.users.UserDTO;

@Service
public class HotelService {
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private CommentDAO commentDAO;
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		System.out.println("service List");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalcount3(pager);
		pager.make(totalCount);
		pager.makeNum();
		List<BoardDTO> ar = boardDAO.getHotelList(pager);
		
		return ar;
	}
	
	public List<BoardDTO2> getcardList(Pager pager) throws Exception{
		
		System.out.println("service CardList");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalcount3(pager);
		pager.cardMake(totalCount);
		pager.makeNum();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchKind", pager.getSearchKind());
		map.put("startNum", pager.getStartNum());
		map.put("endNum", pager.getEndNum());
		map.put("search", pager.getSearch());
		map.put("locationKind", pager.getLocationKind());
		map.put("kind", pager.getKind());
		
		
		List<BoardDTO2> ar = boardDAO.getHotelCardList(map);
		
		return ar;
	}
	
	public List<BoardDTO2> getHeartList(Pager pager, HttpSession session, @RequestParam("userID") UserDTO userDTO) throws Exception{
		
		System.out.println("service CardList");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalHeartCount3(pager);
		pager.cardMake(totalCount);
		pager.makeNum();
		
		userDTO = (UserDTO)session.getAttribute("user");
		System.out.println(userDTO.getUserID());
		BoardDTO2 dto = new BoardDTO2();
		dto.setUserID(userDTO.getUserID());
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userID", userDTO.getUserID());
		map.put("searchKind", pager.getSearchKind());
		map.put("startNum", pager.getStartNum());
		map.put("endNum", pager.getEndNum());
		map.put("search", pager.getSearch());
		map.put("locationKind", pager.getLocationKind());
		map.put("kind", pager.getKind());
		
		
		List<BoardDTO2> ar = boardDAO.getHotelHeartList(map);
		
		return ar;
	}
	
	//Comment
	
	public int addComments(CommentDTO commentDTO) throws Exception{
		return commentDAO.addComments(commentDTO);
	}
	
	public List<CommentDTO> getCommentsList(Pager pager, CommentDTO commentDTO) throws Exception{
		System.out.println("service CommentList");
		
		Long totalCount = commentDAO.getCommentsCount(commentDTO);
		
		pager.make(totalCount);
		pager.makeNum();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comments", map);
		map.put("pager", pager);
		
		List<CommentDTO> ar = commentDAO.getCommentsList(map);
		
		return ar;
	}
	
	public int deleteComments(CommentDTO commentDTO) throws Exception{
		return commentDAO.deleteComments(commentDTO);
	}
	
	public int updateComments(CommentDTO commentDTO) throws Exception{
		return commentDAO.updateComments(commentDTO);
	}
	
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception{
		return boardDAO.getFileDetail(boardFileDTO);
	}

}
