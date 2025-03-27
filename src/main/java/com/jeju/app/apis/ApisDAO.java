package com.jeju.app.apis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApisDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.apis.ApisDAO.";
	
	public int getAirportsList(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"getAirportsList", dtos);
	}
	
	public int getAirlinesList(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"getAirlinesList", dtos);
	}
	
	public int getFlightsList(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"getFlightsList", dtos);
	}
	
	public int deleteAll() throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll");
	}

}
