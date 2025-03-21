package com.jeju.app.publicBoards;

import java.util.List;

import com.jeju.app.pages.PB_Pager;
import com.jeju.app.pages.Pager;

public interface PB_Service {
	
	public List<PB_DTO> getList(PB_Pager pager) throws Exception;
	
	public int add(PB_DTO dto) throws Exception;

}
