package com.jeju.app.publicBoards.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.app.pages.PB_Pager;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	public List<QnaDTO> getList(PB_Pager pager) throws Exception{
		List<QnaDTO> ar = qnaDAO.getList(pager);
		
		return ar;
	}
	
	public QnaDTO getDetail(QnaDTO qnaDTO) throws Exception{
		qnaDTO = qnaDAO.getDetail(qnaDTO);
		
		return qnaDTO;
	}
	
	public int add(QnaDTO qnaDTO) throws Exception{
		int result = qnaDAO.add(qnaDTO);
		
		return result;
	}
	
	public int update(QnaDTO qnaDTO) throws Exception{
		int result = qnaDAO.update(qnaDTO);
		
		return result;
	}
	
	public int delete(QnaDTO qnaDTO) throws Exception{
		int result = qnaDAO.delete(qnaDTO);
		
		return result;
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception{
		QnaDTO parent = qnaDAO.getDetail(qnaDTO);
		
		qnaDTO.setBoardRef(parent.getBoardRef());
		qnaDTO.setBoardStep(parent.getBoardStep()+1);
		qnaDTO.setBoardDepth(parent.getBoardDepth()+1);
		
		int result = qnaDAO.updateStep(qnaDTO);
		
		result = qnaDAO.reply(qnaDTO);
		
		return result;
	}
}
