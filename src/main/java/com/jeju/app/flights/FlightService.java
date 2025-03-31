package com.jeju.app.flights;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.stereotype.Service;

import com.jeju.app.apis.ApiItemDTO;
import com.jeju.app.apis.ApisService;
import com.jeju.app.pages.Pager;
import com.jeju.app.reservs.SearchDTO;
import com.jeju.app.search.Days;

@Service
public class FlightService {
	
	@Autowired
	private FlightDAO flightDAO;
	@Autowired
	private ApisService apisService;
	
	public List<FlightDTO> getList(HttpServletRequest request) throws Exception {
		
		Calendar ca = Calendar.getInstance();
		int h = ca.get(Calendar.HOUR_OF_DAY);
		int m = ca.get(Calendar.MINUTE);
		String hour = h+"";
		String minute = m+"";
		if(h<10) {
			hour = "0"+h;
		}
		if(m < 10) {
			minute = "0"+m;
		}
		String now = new Date(ca.getTimeInMillis()).toString().replace("-", "")+hour+minute;

		Map<String, String> map = new HashMap<String, String>();
		map.put("today", now);
		map.put("depPlandTime", request.getParameter("depPlandTime"));
		map.put("depAirportId", request.getParameter("depAirportId"));
		map.put("arrAirportId", request.getParameter("arrAirportId"));
		
		if(request.getParameter("airlineNm") != "" && request.getParameter("airlineNm") != null) {
			map.put("airlineId", request.getParameter("airlineNm"));
			return flightDAO.getListByAirline(map);
		}

		
		return flightDAO.getList(map);
	}
	
	public List<FlightDTO> getListCome(HttpServletRequest request, SearchDTO searchDTO, HttpSession session) throws Exception {
		
		searchDTO = (SearchDTO)session.getAttribute("searchInfo");
	
		Calendar ca = Calendar.getInstance();
		int h = ca.get(Calendar.HOUR_OF_DAY);
		int m = ca.get(Calendar.MINUTE);
		String hour = h+"";
		String minute = m+"";
		if(h<10) {
			hour = "0"+h;
		}
		if(m < 10) {
			minute = "0"+m;
		}
		String now = new Date(ca.getTimeInMillis()).toString().replace("-", "")+hour+minute;

		Map<String, String> map = new HashMap<String, String>();
		map.put("today", now);
		map.put("depPlandTime", searchDTO.getDepPlandTimeToCome());
		map.put("depAirportId", request.getParameter("arrAirportId"));
		map.put("arrAirportId", request.getParameter("depAirportId"));
		
		if(request.getParameter("airlineNm") != "" && request.getParameter("airlineNm") != null) {
			map.put("airlineId", request.getParameter("airlineNm"));
			return flightDAO.getListByAirline(map);
		}

		
		return flightDAO.getList(map);
	}
	
//	public void flightsUpdate(HttpServletRequest request) throws Exception {
//		
//		int result = apisService.deleteAll();
//		
//		System.out.println("delete : "+result);
//		result = 0;
//		
//		ApiItemDTO dto = new ApiItemDTO();
//		dto.setAirportId((String)request.getParameter("airportId"));
//		
//		Days days = new Days();
//		
//		days.setSearchDay(request.getParameter("depPlandTime"));
//		
//		for(int i = 0; i < 7; i++) {
//			
//			Calendar ca = days.stringToCalendar(days.getB3Day().toString());
//			ca.set(Calendar.DATE, ca.get(Calendar.DATE)+i);
//			
//			Date d = new Date(ca.getTimeInMillis());
//			String date = d.toString().replace("-", "");
//			
//			result = result + apisService.getFlightsList(dto, date);
//			System.out.println("insert : "+result);
//		}
//		
//	}

}
