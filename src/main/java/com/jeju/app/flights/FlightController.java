package com.jeju.app.flights;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.reservs.SearchDTO;
import com.jeju.app.search.Days;




@Controller
@RequestMapping(value = "flights/*")
public class FlightController {
	
	@Autowired
	private FlightService flightService;
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public void getList(HttpServletRequest request, Model model, SearchDTO searchDTO, HttpSession session) throws Exception {
		
		searchDTO = (SearchDTO)session.getAttribute("searchInfo");
		if(request.getParameter("flightNum") != null) {
			searchDTO.setFlightNumGo(request.getParameter("flightNum"));			
		}
		
		if(searchDTO.getFlightNumGo() == null) {
			Days days =  new Days();
			days.setSearchDay(request.getParameter("depPlandTime"));
			model.addAttribute("day", days);
			model.addAttribute("depAirportId", request.getParameter("depAirportId"));
			model.addAttribute("arrAirportId", searchDTO.getArrAirportId());
			model.addAttribute("list", flightService.getList(request));
			model.addAttribute("journey", "가는 편");
		}else if(searchDTO.getFlightNumGo() != null) {
			Days days =  new Days();
			days.setSearchDay(request.getParameter("depPlandTime"));
			model.addAttribute("day", days);
			model.addAttribute("depAirportId", request.getParameter("depAirportId"));
			model.addAttribute("arrAirportId", searchDTO.getDepAirportId());
			model.addAttribute("list", flightService.getListCome(request, searchDTO, session));
			model.addAttribute("journey", "오는 편");
		}
		
		model.addAttribute("depPlandTimeToCome", searchDTO.getDepPlandTimeToCome());

	}
	
	
//	@RequestMapping(value = "updateList", method = RequestMethod.POST)
//	@ResponseBody
//	public List<FlightDTO> updateList(HttpServletRequest request) throws Exception {
//
//		return flightService.getList(request);
//	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public void search() throws Exception {
		
	}
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public void search(SearchDTO searchDTO, HttpSession session) throws Exception {
		
		session.setAttribute("searchInfo", searchDTO);
		
	}
	
	@RequestMapping(value = "getFlightCome", method = RequestMethod.POST)
	public void getFlightCome(SearchDTO searchDTO, HttpSession session, HttpServletRequest request) throws Exception {

		searchDTO = (SearchDTO)session.getAttribute("searchInfo");
		searchDTO.setFlightNumCome(request.getParameter("flightNum"));
		
	}
	
	
}
