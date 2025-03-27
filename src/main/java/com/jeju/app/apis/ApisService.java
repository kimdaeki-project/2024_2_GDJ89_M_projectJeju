package com.jeju.app.apis;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jeju.app.pages.Pager;

@Service
public class ApisService {
	
	@Autowired
	private ApisDAO apisDAO;
	private final String SERVICEKEY = "J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D";
	
	
	public int deleteAll() throws Exception {
		return apisDAO.deleteAll();
	}
	
	public int getAirportsList() throws Exception {
		ApiBodyDTO apiBodyDTO = this.jsonToObject();
		if(apiBodyDTO == null) {
			return 0;
		}
		List<ApiItemDTO> ar = new ArrayList<ApiItemDTO>();
		
		for(ApiItemDTO apiItemDTO : apiBodyDTO.getItems().getItem()) {
			ar.add(apiItemDTO);
		}
		
		return apisDAO.getAirportsList(ar);
	}
	
	public int getAirlinesList() throws Exception {
		ApiBodyDTO apiBodyDTO = this.jsonToObject();
		if(apiBodyDTO == null) {
			return 0;
		}
		List<ApiItemDTO> ar = new ArrayList<ApiItemDTO>();
		
		for(ApiItemDTO apiItemDTO : apiBodyDTO.getItems().getItem()) {
			ar.add(apiItemDTO);
		}
		
		return apisDAO.getAirlinesList(ar);
	}
	
	public int getFlightsList(ApiItemDTO dto, String date) throws Exception {
		ApiBodyDTO apiBodyDTO = this.jsonToObject(dto, date);
		if(apiBodyDTO == null) {
			return 0;
		}
		List<ApiItemDTO> ar = new ArrayList<ApiItemDTO>();
		
		for(ApiItemDTO apiItemDTO : apiBodyDTO.getItems().getItem()) {
			if(apiItemDTO.getEconomyCharge()==null) {
				apiItemDTO.setEconomyCharge(0L);
			}
			if(apiItemDTO.getPrestigeCharge()==null) {
				apiItemDTO.setPrestigeCharge(0L);
			}
			UUID uuid = UUID.randomUUID();
			
			apiItemDTO.setFlightNum(uuid.toString());
			ar.add(apiItemDTO);
		}
		
		
		return apisDAO.getFlightsList(ar);
		
	}
	
	public ApiBodyDTO jsonToObject() throws Exception {
		String json = this.getAirportList();
		json = json.substring(json.indexOf("body")+6, json.lastIndexOf("}")-1);
		
		if(json.substring(json.lastIndexOf(":")+1, json.lastIndexOf("}")).equals("0")) {
			ApiBodyDTO apiBodyDTO = new ApiBodyDTO();
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		ApiBodyDTO apiBodyDTO = mapper.readValue(json, ApiBodyDTO.class);
		
		return apiBodyDTO;
	}
	
	public ApiBodyDTO jsonToObject(ApiItemDTO dto, String date) throws Exception {
		String json = this.getFlightList(dto, date);
		json = json.substring(json.indexOf("body")+6, json.lastIndexOf("}")-1);
		
		if(json.substring(json.lastIndexOf(":")+1, json.lastIndexOf("}")).equals("0")) {
			ApiBodyDTO apiBodyDTO = new ApiBodyDTO();
			return null;
		}
		
		ObjectMapper mapper = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		ApiBodyDTO apiBodyDTO = mapper.readValue(json, ApiBodyDTO.class);
		
		return apiBodyDTO;
	}
	
	private String getFlightList(ApiItemDTO dto, String date) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getFlightOpratInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + SERVICEKEY); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
        urlBuilder.append("&" + URLEncoder.encode("depAirportId","UTF-8") + "=" + URLEncoder.encode(dto.getAirportId(), "UTF-8")); /*출발공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("arrAirportId","UTF-8") + "=" + URLEncoder.encode("NAARKPC", "UTF-8")); /*도착공항ID*/
        urlBuilder.append("&" + URLEncoder.encode("depPlandTime","UTF-8") + "=" + URLEncoder.encode(date, "UTF-8")); /*출발일(YYYYMMDD)*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("150", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        if(dto.getAirlineId()!=null) {
        	urlBuilder.append("&" + URLEncoder.encode("airlineId","UTF-8") + "=" + URLEncoder.encode(dto.getAirlineId(), "UTF-8")); /*항공사ID*/
        }
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
//        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
		
		
		return sb.toString();
	}
	
	private String getAirlineList() throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getAirmanList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + SERVICEKEY); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();

        return sb.toString();
	}
	
	private String getAirportList() throws Exception {
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1613000/DmstcFlightNvgInfoService/getArprtList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + SERVICEKEY); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*데이터 타입(xml, json)*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        return sb.toString();
	}

}
