package com.jeju.app.boards;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jeju.app.boards.BoardDAO.";
	
	@Autowired
	private BoardDTO boardDTO;
	
	public List<BoardDTO> getList(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", boardDTO);
	}
	
	public int add(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add", boardDTO);
	}
}
