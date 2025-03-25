package com.jeju.app.publicBoards.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int add(PB_DTO dto) throws Exception{
		
		int result = noticeDAO.add(dto);
		return result;
	}

}
