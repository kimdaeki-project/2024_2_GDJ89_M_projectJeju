package com.jeju.app.products;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeju.app.apis.ApiDTO;
import com.jeju.app.apis.ApiItemDTO;
import com.jeju.app.apis.ApisService;
import com.jeju.app.pages.Pager;

import projectJeju.Sample;

public class TestJackson extends Sample{
	
	private ProductApiTest productApiTest;
	@Autowired
	private ApisService apisService;
	
	
	@Test
	public void apiTest() throws Exception {
		ApiItemDTO dto = new ApiItemDTO();
		Pager pager = new Pager();
		String date = "20250321";
		dto.setDepAirportNm("NAARKSS");
		
		int result = apisService.getApiData(dto, pager, date);
		
		System.out.println(result);
	}
	
	
	
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
//		json = json.substring(json.indexOf(":")+1, json.lastIndexOf("}"));
//		System.out.println(json);
//		
//		ObjectMapper objectMapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
//		ApiDTO apiDTO = objectMapper.readValue(json, ApiDTO.class);
//		
//		System.out.println(apiDTO.getHeader().getResultCode());
//		System.out.println(apiDTO.getBody().getNumOfRows());
//		System.out.println(apiDTO.getBody().getPageNo());
//		System.out.println(apiDTO.getBody().getTotalCount());
//		for(ApiItemDTO res : apiDTO.getBody().getItems().getItem()) {
//			System.out.println(res.getAirLineNm());
//			System.out.println(res.getDepAirportNm());
//			System.out.println(res.getDepPlandTime());
//			System.out.println(res.getVihicleId());
//			System.out.println(res.getEconomyCharge());
//		}
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
