package com.jeju.app.publicBoards.qna;

import com.jeju.app.publicBoards.PB_DTO;

public class QnaDTO extends PB_DTO {
	
	private Long boardDepth;
	private Long boardRep;
	private Long boardStep;
	
	
	public Long getBoardDepth() {
		return boardDepth;
	}
	public void setBoardDepth(Long boardDepth) {
		this.boardDepth = boardDepth;
	}
	public Long getBoardRep() {
		return boardRep;
	}
	public void setBoardRep(Long boardRep) {
		this.boardRep = boardRep;
	}
	public Long getBoardStep() {
		return boardStep;
	}
	public void setBoardStep(Long boardStep) {
		this.boardStep = boardStep;
	}
}
