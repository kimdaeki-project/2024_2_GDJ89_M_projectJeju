package com.jeju.app;

import java.sql.SQLException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorController {
	
	@ExceptionHandler(NullPointerException.class)
	public String error1() {
		return "errors/error_500";
	}
	
	@ExceptionHandler(SQLException.class)
	public String error2() {
		return "errors/error_500";
	}
	
	@ExceptionHandler(Exception.class)
	public String error3(Model model, Exception exception) {
		model.addAttribute("result", exception);
		return "errors/error_500";
	}

}
