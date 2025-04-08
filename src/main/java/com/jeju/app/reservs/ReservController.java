package com.jeju.app.reservs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping(value = "userCheck", method = RequestMethod.POST)
	public String userCheck(HttpServletRequest request, Model model) throws Exception {

		// 유저 정보 확인
		
		model.addAttribute("result", "name");
		return "commons/ajaxResult";
	}
	
	@RequestMapping(value = "boarderInfo", method = RequestMethod.POST)
	public void boarderInfo(HttpServletRequest request, BoardingInfo boardingInfo, HttpSession session) throws Exception {
		reservService.getBoarderInfo(boardingInfo, request, session);
	}
	
	@RequestMapping(value = "success", method = RequestMethod.GET)
	public void success(HttpSession session, HttpServletRequest request, ReservDTO reservDTO) throws Exception {
		List<BoardingInfo> ar = (List<BoardingInfo>)session.getAttribute("boarderList");
		if(ar.get(0).getReservNum().equalsIgnoreCase(request.getParameter("reservNum"))) {
			System.out.println(reservService.flightsUpdate(session, ar));
			reservService.reservate(reservDTO, session, request);
			int result = reservService.addBoarderList(ar);
			System.out.println(result);
		}
	}
	
	@RequestMapping(value = "fail", method = RequestMethod.GET)
	public void fail() throws Exception {
		System.out.println("fail");
	}

}
