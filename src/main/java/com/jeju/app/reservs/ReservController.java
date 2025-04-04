package com.jeju.app.reservs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeju.app.flights.FlightDTO;

@Controller
@RequestMapping(value = "reservation/")
public class ReservController {
	
	@Autowired
	private ReservService reservService;
	
	@RequestMapping(value = "payments", method = RequestMethod.GET)
	public void payments() throws Exception {
		System.out.println("payments");
	}
	
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public void addInfo(HttpSession session, SearchDTO searchDTO, Model model) throws Exception {

		searchDTO = (SearchDTO)session.getAttribute("searchInfo");
		List<FlightDTO> ar = reservService.getDetail(searchDTO);

		model.addAttribute("flightGo", ar.get(0));
		model.addAttribute("flightCome", ar.get(1));

	}
	
	@RequestMapping(value = "upgrade", method = RequestMethod.POST)
	@ResponseBody
	public SearchDTO getBusiness(FlightDTO flightDTO, SearchDTO searchDTO, HttpSession session) throws Exception {
		
		searchDTO = (SearchDTO)session.getAttribute("searchInfo");
		searchDTO = reservService.getPrestigeCharge(flightDTO, searchDTO);
		
		return searchDTO;
	}
	


}
