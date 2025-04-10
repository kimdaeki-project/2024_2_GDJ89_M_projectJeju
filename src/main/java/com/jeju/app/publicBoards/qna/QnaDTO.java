package com.jeju.app.publicBoards.qna;

import com.jeju.app.publicBoards.PB_DTO;

public class QnaDTO extends PB_DTO {
	
	private Long boardDepth;
	private Long boardRef;
	private Long boardStep;
	
	
	public Long getBoardDepth() {
		return boardDepth;
	}
	public void setBoardDepth(Long boardDepth) {
		this.boardDepth = boardDepth;
	}
	public Long getBoardRef() {
		return boardRef;
	}
	public void setBoardRef(Long boardRef) {
		this.boardRef = boardRef;
	}
	public Long getBoardStep() {
		return boardStep;
	}
	public void setBoardStep(Long boardStep) {
		this.boardStep = boardStep;
	}
}
