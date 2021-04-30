package com.timlin.demo.hotelchain.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HCErrorController implements ErrorController {
	static Logger logger = LoggerFactory.getLogger(HCErrorController.class);

    @RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	@ExceptionHandler(Throwable.class)
	public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
    	Throwable th = (Throwable)request.getAttribute("javax.servlet.error.exception");
		Map<String, Object> payload = new HashMap<>();
		payload.put("Exception", th+"");
		return new ResponseEntity<Map<String, Object>>(payload, HttpStatus.BAD_REQUEST);
	}
    
    @Override
    public String getErrorPath() {
        return null;
    }
    
    
}
