package com.jeju.app.kakao;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/login")
public class KakaoLoginPageController {
	
	@Value("c427655e82865619e43b136eb1ffab95")
	private String client_id;
	
	@Value("https://localhost/callback")
	private String redirect_uri;
	
	@GetMapping("/page")
	public String loginPage(Model model) throws Exception{
		String location = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirect_uri;
		model.addAttribute("location", location);

		return "login";
	}
}
