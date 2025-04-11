package com.jeju.app.products;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeju.app.apis.ApiBodyDTO;
import com.jeju.app.apis.ApiItemDTO;
import com.jeju.app.apis.ApisService;
import com.jeju.app.flights.FlightDTO;
import com.jeju.app.flights.FlightService;
import com.jeju.app.pages.Pager;
import com.jeju.app.reservs.ReservDTO;
import com.jeju.app.reservs.ReservService;
import com.jeju.app.users.UserDTO;

import projectJeju.Sample;

public class TestJackson extends Sample{
	
	private ProductApiTest productApiTest;
	@Autowired
	private ApisService apisService;
	@Autowired
	private FlightService flightService;
	@Autowired
	private ReservService reservService;
	
	@Test
	public void getReservatonsList() throws Exception {
		UserDTO userDTO = new UserDTO();
		userDTO.setUserID("test");
		List<ReservDTO> ar = reservService.getReservationsList(userDTO);
		System.out.println(ar.size());
		System.out.println(ar.get(4).getBoarders().get(0).getName());
		System.out.println(ar.get(0).getfGo().getDepPlandTime());
	}
	
//	@Test
//	public void deleteInsert() throws Exception {
//		System.out.println(apisService.initFlightsList());
//	}
	
//	@Test
//	public void getListTest() throws Exception {
//		List<FlightDTO> ar = flightService.getList();
//		
//		for(FlightDTO dto : ar) {
//			System.out.println(dto.getFlightNum());
//			System.out.println(dto.getEconomyCharge());
//			System.out.println(dto.getVihicleId());
//			System.out.println(dto.getDepPlandTime());
//		}
//	}
	
	
//	@Test
//	public void apiTest() throws Exception {
//		ApiItemDTO dto = new ApiItemDTO();
//		Pager pager = new Pager();
//		Calendar ca = Calendar.getInstance();
//		System.out.println(ca.get(Calendar.YEAR));
//		System.out.println(ca.get(Calendar.MONTH)+1);
//		System.out.println(ca.get(Calendar.DATE));
//		
//		String date = ca.get(Calendar.YEAR)+"0"+(ca.get(Calendar.MONTH)+1)+""+ca.get(Calendar.DATE);
//		dto.setDepAirportNm("NAARKSS");
//		
//		int result = apisService.getApiData(dto, pager, date);
//		
//		System.out.println(result);
//	}
//	
	
	
//	@Test
//	public void jsonToObject() throws Exception {
//		String json = productApiTest.main();
//		json = json.substring(json.indexOf("body")+6, json.lastIndexOf("}")-1);
//		System.out.println(json);
//		
//		ObjectMapper objectMapper = new ObjectMapper();
//		ApiDTO apiDTO = objectMapper.readValue(json, ApiDTO.class);
//		
//		System.out.println(apiDTO.getItems());	
//	}
	
//	@Test
//	public void jsonToObject2() throws Exception {
//		String json = productApiTest.main();
//		json = json.substring(json.indexOf("body")+6, json.lastIndexOf("}")-1);
//		System.out.println(json);
//		
//		ObjectMapper objectMapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//		ApiBodyDTO apiBodyDTO = objectMapper.readValue(json, ApiBodyDTO.class);
//		
//		System.out.println(apiBodyDTO.getTotalCount());
//		
//		for(ApiItemDTO dto : apiBodyDTO.getItems().getItem()) {
//			System.out.println(dto.getAirlineNm());
//			System.out.println(dto.getVihicleId());
//		}
//		
//	}
	
//	@Test
//	public void jsonToObject3() throws Exception {
//		String json = productApiTest.getAirportList();
//		json = json.substring(json.indexOf(":")+1, json.lastIndexOf("}"));
//		System.out.println(json);
//		
//		ObjectMapper mapper = new ObjectMapper();
//		ApiDTO apiDTO = mapper.readValue(json, ApiDTO.class);
//		
//	}

}
