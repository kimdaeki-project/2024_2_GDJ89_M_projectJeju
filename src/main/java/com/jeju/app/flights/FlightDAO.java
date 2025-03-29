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
	
	
	public List<List<FlightDTO>> getList(Map<String, String> map) throws Exception{
		List<List<FlightDTO>> ars = new ArrayList<List<FlightDTO>>();
		
		List<FlightDTO> ar = new ArrayList<FlightDTO>();
		ar = sqlSession.selectList(NAMESPACE+"getListB2", map);
		ars.add(ar);
		
		ar = new ArrayList<FlightDTO>();
		ar = sqlSession.selectList(NAMESPACE+"getListB1", map);
		ars.add(ar);
		
		ar = new ArrayList<FlightDTO>();
		ar = sqlSession.selectList(NAMESPACE+"getListDd", map);
		ars.add(ar);
		
		ar = new ArrayList<FlightDTO>();
		ar = sqlSession.selectList(NAMESPACE+"getListA1", map);
		ars.add(ar);
		
		ar = new ArrayList<FlightDTO>();
		ar = sqlSession.selectList(NAMESPACE+"getListA2", map);
		ars.add(ar);
		
		return ars;
	}
	
}
