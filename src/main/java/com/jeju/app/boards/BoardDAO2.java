package com.jeju.app.boards;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO2 {
	
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE = "com.jeju.app.boards.BoardDAO2.";
	
	public List<BoardDTO2> getPlaceHeartList(Map<String, Object> map) throws Exception{
		return sqlsession.selectList(NAMESPACE+"getPlaceHeartList", map);
	}
	
	public List<BoardDTO2> getDinerList(Map<String, Object> map) throws Exception{
		return sqlsession.selectList(NAMESPACE+"getDinerHeartList", map);
	}
	
	public List<BoardDTO2> getHotelList(Map<String, Object> map) throws Exception{
		return sqlsession.selectList(NAMESPACE+"getHotelHeartList", map);
	}
	
}
