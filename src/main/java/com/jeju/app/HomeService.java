package com.jeju.app;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.app.boards.BoardDTO;
import com.jeju.app.publicBoards.PB_DTO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;
	
	public BoardDTO getMaxHit(BoardDTO boardDTO) throws Exception{
		return homeDAO.getMaxHit(boardDTO);
	}
	
	public BoardDTO getMaxHit2(BoardDTO boardDTO) throws Exception{
		return homeDAO.getMaxHit2(boardDTO);
	}
	
	public PB_DTO getNotice(PB_DTO dto) throws Exception{
		return homeDAO.getNotice(dto);
	}

}
