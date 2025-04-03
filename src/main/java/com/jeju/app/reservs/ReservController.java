package com.jeju.app.reservs;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "reservation/")
public class ReservController {
	
	@RequestMapping(value = "info", method = RequestMethod.GET)
	public void addInfo(HttpSession session, SearchDTO searchDTO) throws Exception {
		System.out.println("addInfo");
		searchDTO = (SearchDTO)session.getAttribute("searchInfo");
		
		System.out.println(searchDTO.getFlightNumGo());
		System.out.println(searchDTO.getFlightNumCome());
	}
	


}
