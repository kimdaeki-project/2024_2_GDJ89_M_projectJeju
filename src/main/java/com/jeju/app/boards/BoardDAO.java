package com.jeju.app.boards;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.pages.Pager;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jeju.app.boards.BoardDAO.";

	
	public List<BoardDTO> getPlaceList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPlaceList", pager);
	}
	
	public List<BoardDTO> getDinerList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getDinerList", pager);
	}
	
	public List<BoardDTO> getHotelList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getHotelList", pager);
	}
	
	public int add(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add", boardDTO);
	}
	
	public Long getTotalcount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	public int addFiles(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"addFile", boardFileDTO);
	}
}
