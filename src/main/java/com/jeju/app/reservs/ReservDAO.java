package com.jeju.app.reservs;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.flights.FlightDTO;
import com.jeju.app.users.UserDTO;

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
	
	public UserDTO userCheck(UserDTO userDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"userCheck", userDTO);
	}
	
	public FlightDTO getFlight(FlightDTO flightDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getFlight", flightDTO);
	}
	
	public FlightDTO flightsCheck(FlightDTO flightDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"flightsCheck", flightDTO);
	}
	
	public int flightsUpdate(FlightDTO flightDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"flightsUpdate", flightDTO);
	}
	
	public int reservate(ReservDTO reservDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"reservate", reservDTO);
	}
	
	public int addBoarderList(List<BoardingInfo> boarders) throws Exception {
		return sqlSession.insert(NAMESPACE+"addBoarderList", boarders);
	}
	
	public List<ReservDTO> getReservationsList(UserDTO userDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getReservationsList", userDTO);
	}
	
	public FlightDTO getFlightGo(ReservDTO reservDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getFlightGo", reservDTO);
	}
	
	public FlightDTO getFlightCome(ReservDTO reservDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getFlightCome", reservDTO);
	}
	
	public List<BoardingInfo> getBoardingInfo(ReservDTO reservDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBoardingInfo", reservDTO);
	}

}
