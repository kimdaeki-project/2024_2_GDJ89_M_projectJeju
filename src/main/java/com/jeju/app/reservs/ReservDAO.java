package com.jeju.app.reservs;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.flights.FlightDTO;

@Repository
public class ReservDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.reservs.ReservDAO.";
	
	public List<FlightDTO> getDetail(SearchDTO searchDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getDetail", searchDTO);
	}
	
	public FlightDTO getPrestigeCharge(FlightDTO flightDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPrestigeCharge", flightDTO);
	}
	
	public void userCheck() throws Exception {
		
	}

}
