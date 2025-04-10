package com.jeju.app.publicBoards.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.pages.PB_Pager;
import com.jeju.app.pages.Pager;
import com.jeju.app.publicBoards.PB_DAO;
import com.jeju.app.publicBoards.PB_DTO;

@Repository
public class NoticeDAO implements PB_DAO {
	

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jeju.app.publicBoards.notice.NoticeDAO.";

	@Override
	public Long getTotalCount(PB_Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager); 
	}

	@Override
	public List<PB_DTO> getList(PB_Pager pager) throws Exception {

		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public PB_DTO getDetail(PB_DTO dto) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getDetail", dto);
	}

	@Override
	public int add(PB_DTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"add", dto);
	}
	
	@Override
	public int delete(PB_DTO dto) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", dto);
	}
	
	@Override
	public int update(PB_DTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"update", dto);
	}

}
