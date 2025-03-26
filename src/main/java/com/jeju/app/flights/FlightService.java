package com.jeju.app.flights;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.stereotype.Service;

import com.jeju.app.apis.ApiItemDTO;
import com.jeju.app.apis.ApisService;
import com.jeju.app.pages.Pager;
import com.jeju.app.search.Days;

@Service
public class FlightService {
	
	@Autowired
	private FlightDAO flightDAO;
	@Autowired
	private ApisService apisService;
	
	public List<FlightDTO> getList() throws Exception {
		
		Calendar ca = Calendar.getInstance();
		String now = ca.get(Calendar.YEAR)+"0"+(ca.get(Calendar.MONTH)+1)+""+ca.get(Calendar.DATE)+""+ca.get(Calendar.HOUR_OF_DAY)+""+ca.get(Calendar.MINUTE);
		Map<String, String> map = new HashMap<String, String>();
		map.put("today", now);
		
		return flightDAO.getList(map);
	}
	
	public void flightsUpdate(HttpServletRequest request) throws Exception {
		
		int result = apisService.deleteAll();
		
		System.out.println("delete : "+result);
		result = 0;
		
		ApiItemDTO dto = new ApiItemDTO();
		dto.setAirportId((String)request.getParameter("airportId"));
		
		Days days = new Days();
		
		days.setSearchDay(request.getParameter("depPlandTime"));
		
		for(int i = 0; i < 7; i++) {
			
			Calendar ca = days.stringToCalendar(days.getB3Day().toString());
			ca.set(Calendar.DATE, ca.get(Calendar.DATE)+i);
			
			Date d = new Date(ca.getTimeInMillis());
			String date = d.toString().replace("-", "");
			
			result = result + apisService.getApiData(dto, date);
			System.out.println("insert : "+result);
		}
		
	}

}
