package com.jeju.app.products.flights;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.reservs.SearchDTO;


@Controller
@RequestMapping(value = "flights/*")
public class FlightController {
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public void searchPlan() throws Exception {
		System.out.println("search");
	}
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public void getList(SearchDTO searchDTO) throws Exception {
		System.out.println("list");
		
		System.out.println(searchDTO.getDepAirportNm());
		System.out.println(searchDTO.getPerson());
		System.out.println(searchDTO.getPlandComeDate());
		System.out.println(searchDTO.getPlandGoDate());
	}

}
