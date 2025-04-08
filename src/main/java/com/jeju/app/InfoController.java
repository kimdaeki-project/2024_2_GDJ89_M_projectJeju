package com.jeju.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/information/*")
public class InfoController {
	
	@RequestMapping(value = "mark", method = RequestMethod.GET)
	public void information() throws Exception{
	}
	
	@RequestMapping(value = "char")
	public void charactor() throws Exception{
	}
	
	@RequestMapping(value = "location")
	public void location() throws Exception{
	}
	
	@RequestMapping(value = "special")
	public void special() throws Exception{
	}
}
