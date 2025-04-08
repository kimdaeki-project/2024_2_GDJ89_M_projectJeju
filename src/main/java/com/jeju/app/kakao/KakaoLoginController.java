package com.jeju.app.kakao;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@Controller
@RequestMapping("")
public class KakaoLoginController {
	
	@GetMapping("/Callback")
	public ResponseEntity<?> callback(@RequestParam("code") String code){
		
		return new ResponseEntity(HttpStatus.OK);
	}
}
