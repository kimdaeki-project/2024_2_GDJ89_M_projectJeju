package com.jeju.app.products.flights;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jeju.app.reservs.SearchDTO;


@Controller
@RequestMapping(value = "flights/*")
public class FlightController {
	
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void getList() throws Exception {
		System.out.println("list");
		
	}

}
