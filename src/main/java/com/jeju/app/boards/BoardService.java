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
	
	public int add(BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches) throws Exception {
		int result = boardDAO.add(boardDTO);
		System.out.println("fileAdd");
		for (MultipartFile attach : attaches) {
			if (attach.isEmpty()) {
				System.out.println("fileEmpty");
				continue;
			}
			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = boardDAO.addFiles(boardFileDTO);
		}
		
		return result;
	}
	
	public BoardDTO getDetail(BoardDTO boardDTO, boolean check) throws Exception{
		
		if (check) {
			boardDAO.updateHits(boardDTO);
		}
		return boardDAO.getDetail(boardDTO);
	}
	
	public BoardFileDTO fileSave(MultipartFile attach, ServletContext context) throws Exception {
		String path = context.getRealPath("/resources/images/");
		
		System.out.println(path);
		
		File file = new File(path);
		
		if (!file.exists()) {
			file.mkdirs();
		}
		
		String fileName = fileManager.fileSave(path, attach);
		
		BoardFileDTO boardFileDTO = new BoardFileDTO();
		
		boardFileDTO.setFileName(fileName);
		boardFileDTO.setOldName(attach.getOriginalFilename());
		
		return boardFileDTO;
	}
	
	public int update(BoardDTO boardDTO, HttpSession session, MultipartFile[] attaches) throws Exception{
		int result = boardDAO.update(boardDTO);
		for (MultipartFile attach : attaches) {
			if (attach.isEmpty()) {
				continue;
			}
			BoardFileDTO boardFileDTO = this.fileSave(attach, session.getServletContext());
			
			boardFileDTO.setBoardNum(boardDTO.getBoardNum());
			result = boardDAO.addFiles(boardFileDTO);
		}
		
		return result;
		
	}
}
