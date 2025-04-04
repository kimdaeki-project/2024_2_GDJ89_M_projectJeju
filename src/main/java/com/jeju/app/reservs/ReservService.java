package com.jeju.app.reservs;

import java.util.List;

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

}
