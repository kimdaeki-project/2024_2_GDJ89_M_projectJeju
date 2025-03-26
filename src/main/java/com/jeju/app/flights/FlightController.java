package com.jeju.app.flights;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.apis.ApiItemDTO;
import com.jeju.app.search.Days;




@Controller
@RequestMapping(value = "flights/*")
public class FlightController {
	
	@Autowired
	private FlightService flightService;
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public void getList(HttpServletRequest request, Model model) throws Exception {
		
		model.addAttribute("list", flightService.getList());
		
		Days days =  new Days();
		days.setSearchDay(request.getParameter("depPlandTime"));
		model.addAttribute("day", days);
		
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public void search() throws Exception {
		System.out.println("searchGET");
	}
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public void search(HttpServletRequest request) throws Exception {
		System.out.println(request.getParameter("airportId"));
		System.out.println(request.getParameter("depPlandTime"));
		flightService.flightsUpdate(request);
		System.out.println("searchPOST");
	}
	
}
