package com.jeju.app.boards;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.app.pages.Pager;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		System.out.println("service List");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalcount(pager);
		
		pager.make(totalCount);
		pager.makeNum();
		List<BoardDTO> ar = boardDAO.getList(pager);
		
		return ar;
	}
	
	public List<BoardDTO> getcardList(Pager pager) throws Exception{
		
		System.out.println("service CardList");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalcount(pager);
		
		pager.cardMake(totalCount);
		pager.makeNum();
		
		List<BoardDTO> ar = boardDAO.getCardList(pager);
		
		return ar;
	}

	
	public int add(BoardDTO boardDTO) throws Exception {
		int result = boardDAO.add(boardDTO);
		
		return result;
	}
}
