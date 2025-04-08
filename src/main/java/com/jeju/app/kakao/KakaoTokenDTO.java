package com.jeju.app.kakao;

import org.springframework.beans.factory.annotation.Required;

public class KakaoTokenDTO {
	
	public String tokenType;
	public String accessToken;
	public String idToken;
	public Integer expiresIn;
	public String refreshToken;
	public Integer refreshTokenExpiresIn;
	public String scope;
}
