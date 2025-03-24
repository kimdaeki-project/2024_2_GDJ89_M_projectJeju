package com.jeju.app.flights;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
@RequestMapping(value = "flights/*")
public class FlightController {
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList() throws Exception {
		System.out.println("list");
		
	}
	
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public void search() throws Exception {
		System.out.println("search");
	}
	
}
