package com.jeju.app.apis;

public class ApiDTO {
	
	private ApiHeaderDTO header;
	private ApiBodyDTO body;
	
	
	public ApiHeaderDTO getHeader() {
		return header;
	}
	public void setHeader(ApiHeaderDTO header) {
		this.header = header;
	}
	public ApiBodyDTO getBody() {
		return body;
	}
	public void setBody(ApiBodyDTO body) {
		this.body = body;
	}

}
