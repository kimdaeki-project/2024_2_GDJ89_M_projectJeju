package com.jeju.app.apis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApisDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.apis.ApisDAO.";
	
	public int getApiData(ApiDTO apiDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"getApiData", apiDTO);
	}

}
