package com.jeju.app.flights;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FlightDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.flights.FlightDAO.";
	
	
	public List<FlightDTO> getList(Map<String, String> map) throws Exception{
		
		List<FlightDTO> ar = new ArrayList<FlightDTO>();
		
		return sqlSession.selectList(NAMESPACE+"getList", map);
	}
	
	public List<FlightDTO> getListByAirline(Map<String, String> map) throws Exception {
		
		List<FlightDTO> ar = new ArrayList<FlightDTO>();
		
		return sqlSession.selectList(NAMESPACE+"getListByAirline", map);
	}
	
}
