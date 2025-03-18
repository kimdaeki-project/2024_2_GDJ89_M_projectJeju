package com.jeju.app.boards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> getList(BoardDTO boardDTO) throws Exception{
		List<BoardDTO> ar = boardDAO.getList(boardDTO);
		
		return ar;
	}
	
	public int add(BoardDTO boardDTO) throws Exception {
		int result = boardDAO.add(boardDTO);
		
		return result;
	}
}
