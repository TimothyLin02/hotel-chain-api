package com.timlin.demo.hotelchain.exception;

import java.util.Map;

import org.springframework.http.HttpStatus;

public class JsonResponse {

	private HttpStatus httpStatus;
	private Map<String, Object> payload;
	
	public JsonResponse(HttpStatus httpStatus, Map<String, Object> payload) {
		this.httpStatus = httpStatus;
		this.payload = payload;
	}
	
	public HttpStatus getHttpStatus() {
		return httpStatus;
	}
	
	public Map<String, Object> getPayload() {
		return payload;
	}
}
