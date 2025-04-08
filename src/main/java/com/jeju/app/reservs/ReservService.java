package com.jeju.app.reservs;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.app.flights.FlightDTO;

@Service
public class ReservService {
	
	@Autowired
	private ReservDAO reservDAO;
	
	public List<FlightDTO> getDetail(SearchDTO searchDTO) throws Exception {
		return reservDAO.getDetail(searchDTO);
	}
	
	public SearchDTO getPrestigeCharge(FlightDTO flightDTO, SearchDTO searchDTO) throws Exception {
		Long flightGo;
		Long flightCome;
		flightDTO.setFlightNum(searchDTO.getFlightNumGo());
		flightDTO = reservDAO.getPrestigeCharge(flightDTO);
		if(flightDTO.getPrestigeCharge() == 0) {
			flightGo = flightDTO.getEconomyCharge();
		}else {
			flightGo = flightDTO.getPrestigeCharge();
		}
		flightDTO.setFlightNum(searchDTO.getFlightNumCome());
		flightDTO = reservDAO.getPrestigeCharge(flightDTO);
		if(flightDTO.getPrestigeCharge() == 0) {
			flightCome = flightDTO.getEconomyCharge();
		}else {
			flightCome = flightDTO.getPrestigeCharge();
		}
		
		searchDTO.setAdultCharge(searchDTO.getAdult()*(flightGo+flightCome));
		searchDTO.setChildCharge(searchDTO.getChild()*(flightCome+flightGo));
		
		return searchDTO;
	}
	
	public List<BoardingInfo> getBoarderInfo(BoardingInfo boardingInfo, HttpServletRequest request, HttpSession session) throws Exception {
		SearchDTO searchDTO = (SearchDTO)session.getAttribute("searchInfo");
		List<BoardingInfo> ar = new ArrayList<BoardingInfo>();
		
		for(int i = 1; i <= Integer.parseInt(request.getParameter("aCount")); i++) {
			boardingInfo = new BoardingInfo();
			boardingInfo.setName(request.getParameter("aName"+i));
			boardingInfo.setBirth(request.getParameter("aBirth"+i));
			boardingInfo.setChargeDiv(request.getParameter("chargeDiv"));
			boardingInfo.setReservNum(request.getParameter("reservNum"));
			boardingInfo.setfNumGo(searchDTO.getFlightNumGo());
			boardingInfo.setfNumCome(searchDTO.getFlightNumCome());
			boardingInfo.setDiv("adult");
			ar.add(boardingInfo);
		}
		for(int i = 1; i <= Integer.parseInt(request.getParameter("cCount")); i++) {
			boardingInfo = new BoardingInfo();
			boardingInfo.setName(request.getParameter("cName"+i));
			boardingInfo.setBirth(request.getParameter("cBirth"+i));
			boardingInfo.setChargeDiv(request.getParameter("chargeDiv"));
			boardingInfo.setReservNum(request.getParameter("reservNum"));
			boardingInfo.setfNumGo(searchDTO.getFlightNumGo());
			boardingInfo.setfNumCome(searchDTO.getFlightNumCome());
			boardingInfo.setDiv("child");
			ar.add(boardingInfo);
		}
		for(int i = 1; i <= Integer.parseInt(request.getParameter("iCount")); i++) {
			boardingInfo = new BoardingInfo();
			boardingInfo.setName(request.getParameter("iName"+i));
			boardingInfo.setBirth(request.getParameter("iBirth"+i));
			boardingInfo.setChargeDiv(request.getParameter("chargeDiv"));
			boardingInfo.setReservNum(request.getParameter("reservNum"));
			boardingInfo.setfNumGo(searchDTO.getFlightNumGo());
			boardingInfo.setfNumCome(searchDTO.getFlightNumCome());
			boardingInfo.setDiv("infant");
			ar.add(boardingInfo);
		}
		
		session.setAttribute("boarderList", ar);
		
		return ar;
	}
	
	public void flightsUpdate(HttpSession session, List<BoardingInfo> ar) throws Exception {
		ar = (List<BoardingInfo>)session.getAttribute("boarderList");
		
		FlightDTO flightDTO = new FlightDTO();
		flightDTO.setFlightNum(ar.get(0).getfNumGo());
		if(reservDAO.flightsCheck(flightDTO) == null) {
			reservDAO.flightsUpdate(flightDTO);
		}
		
		flightDTO = new FlightDTO();
		flightDTO.setFlightNum(ar.get(0).getfNumCome());
		if(reservDAO.flightsCheck(flightDTO) == null) {
			reservDAO.flightsUpdate(flightDTO);
		}
	}
	
	public int reservate(ReservDTO reservDTO, HttpSession session, HttpServletRequest request) throws Exception {
		reservDTO.setReservNum(request.getParameter("reservNum"));
		reservDTO.setUsetId("user"); // session에서 꺼내와야함
		
		return reservDAO.reservate(reservDTO);
	}
	
	public int addBoarderList(List<BoardingInfo> ar) throws Exception {
		return reservDAO.addBoarderList(ar);
	}

}
