package com.jeju.app;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.boards.BoardDTO;
import com.jeju.app.publicBoards.PB_DTO;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jeju.app.HomeDAO.";
	
	public BoardDTO getMaxHit(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMaxHit", boardDTO);
	}
	
	public BoardDTO getMaxHit2(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMaxHit2", boardDTO);
	}
	
	public PB_DTO getNotice(PB_DTO dto) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNotice", dto);
	}

}
