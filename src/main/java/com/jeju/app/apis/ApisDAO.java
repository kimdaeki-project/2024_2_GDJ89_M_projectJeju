package com.jeju.app.apis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApisDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.apis.ApisDAO.";
	
	
	public int getApiData(List<ApiItemDTO> dtos) throws Exception {
		return sqlSession.insert(NAMESPACE+"getApiData", dtos);
	}
	
	public int deleteAll() throws Exception {
		return sqlSession.delete(NAMESPACE+"deleteAll");
	}

}
