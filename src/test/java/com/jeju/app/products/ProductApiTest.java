package com.jeju.app.products;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ProductApiTest {
	public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "J0mHq1R1fL8PBzcOJXPlaICPhvWctJpIQoAUJNzx1fUeMzFU9bjNRoAuwfN%2FC1w79pvPN5onz8835x6feTa2yA%3D%3D");
        /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("schDate","UTF-8") + "=" + URLEncoder.encode("20250318", "UTF-8")); /*검색일자*/
        urlBuilder.append("&" + URLEncoder.encode("schDeptCityCode","UTF-8") + "=" + URLEncoder.encode("GMP", "UTF-8")); /*도착 도시 코드*/
        urlBuilder.append("&" + URLEncoder.encode("schArrvCityCode","UTF-8") + "=" + URLEncoder.encode("PUS", "UTF-8")); /*출항 도시 코드*/
        urlBuilder.append("&" + URLEncoder.encode("schAirLine","UTF-8") + "=" + URLEncoder.encode("AB", "UTF-8")); /*항공편 코드*/
        urlBuilder.append("&" + URLEncoder.encode("schFlightNum","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*항공편 넘버*/
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
        System.out.println(sb.toString());
    }
}
