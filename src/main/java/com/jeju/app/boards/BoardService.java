package com.jeju.app.boards;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jeju.app.files.FileManager;
import com.jeju.app.pages.Pager;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
	private FileManager fileManager;
	
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

	
//	public int add(BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches) throws Exception {
//		int result = boardDAO.add(boardDTO);
//		
//		for (MultipartFile attach : attaches) {
//			if (attach.isEmpty()) {
//				continue;
//			}
//			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
//			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
//			result = boardDAO.addFiles(boardFileDTO);
//		}
//		
//		return result;
//	}
//	
//	public BoardFileDTO fileSave(MultipartFile attach, ServletContext context) throws Exception {
//		String path = context.getRealPath("/resources/images/");
//		
//		System.out.println(path);
//		
//		File file = new File(path);
//		
//		if (!file.exists()) {
//			file.mkdirs();
//		}
//		
//		String fileName = fileManager.fileSave(path, attach);
//		
//		BoardFileDTO boardFileDTO = new BoardFileDTO();
//		
//		boardFileDTO.setFileName(fileName);
//		boardFileDTO.setOldName(attach.getOriginalFilename());
//		
//		return boardFileDTO;
//	}
}
