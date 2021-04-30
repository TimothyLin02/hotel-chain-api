package com.timlin.demo.hotelchain.exception;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class HCErrorHandler extends ResponseEntityExceptionHandler {
	static Logger logger = LoggerFactory.getLogger(HCErrorHandler.class);

	@ExceptionHandler({ Throwable.class })
	public ResponseEntity<Object> handleAll(final Throwable ex, final WebRequest request) {
		logger.error("Unhandled exception occured", ex);

		Map<String, Object> payload = new HashMap<>();
		payload.put("Exception", ex.toString());
    	JsonResponse resp = new JsonResponse(HttpStatus.BAD_REQUEST, payload);

		return ResponseEntity
				.status(resp.getHttpStatus())
				.contentType(MediaType.APPLICATION_JSON)
				.body(resp.getPayload());
	}
	
	

}
