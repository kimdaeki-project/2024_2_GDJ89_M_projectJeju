package com.jeju.app.publicBoards.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jeju.app.pages.PB_Pager;
import com.jeju.app.pages.Pager;
import com.jeju.app.publicBoards.PB_DTO;
import com.jeju.app.publicBoards.PB_Service;

@Service
public class NoticeService implements PB_Service {
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<PB_DTO> getList(PB_Pager pager) throws Exception {
		
		Long totalCount = noticeDAO.getTotalCount(pager);
		
		pager.make(totalCount);
		pager.makeNum();
		
		List<PB_DTO> ar = noticeDAO.getList(pager);
		
		
		return ar;
	}
	
	@Override
	public int add(PB_DTO dto, HttpSession session) throws Exception{
		int result = noticeDAO.add(dto);
		System.out.println("serAdd"+result);
		return result;
	}

	@Override
	public int delete(PB_DTO dto, HttpSession session) throws Exception {
		int result = noticeDAO.delete(dto);
		return result;
	}

	@Override
	public int update(PB_DTO dto, HttpSession session) throws Exception {
		int result = noticeDAO.update(dto);
		return result;
	}

	@Override
	public PB_DTO getDetail(PB_DTO dto) throws Exception {
		
		return noticeDAO.getDetail(dto);
	}

}
