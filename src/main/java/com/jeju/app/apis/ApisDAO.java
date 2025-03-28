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
	
	public List<ApiItemDTO> getAirportList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getAirportList");
	}
	
	public List<ApiItemDTO> getAirlineList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getAirlineList");
	}
	
	public int addAirportsList(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"addAirportsList", dtos);
	}
	
	public int addAirlinesList(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"addAirlinesList", dtos);
	}
	
	public int getFlightsList(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"getFlightsList", dtos);
	}
	
	public int deleteAll() throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll");
	}

}
