package com.jeju.app.boards.place;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.app.boards.BoardDAO;
import com.jeju.app.boards.BoardDTO;
import com.jeju.app.pages.Pager;

@Service
public class PlaceService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> getList(Pager pager) throws Exception{
		
		System.out.println("service List");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalcount(pager);
		
		pager.make(totalCount);
		pager.makeNum();
		List<BoardDTO> ar = boardDAO.getPlaceList(pager);
		
		return ar;
	}
	
	public List<BoardDTO> getcardList(Pager pager) throws Exception{
		
		System.out.println("service CardList");
		
		pager.setKind("k1");
		
		Long totalCount = boardDAO.getTotalcount(pager);
		
		pager.cardMake(totalCount);
		pager.makeNum();
		
		List<BoardDTO> ar = boardDAO.getPlaceList(pager);
		
		return ar;
	}
	
	public BoardDTO getDetail(BoardDTO boardDTO, boolean check) throws Exception{
		
		if(check) {
			boardDAO.updateHits(boardDTO);
		}
		
		return boardDAO.getDetail(boardDTO);
	}
}
