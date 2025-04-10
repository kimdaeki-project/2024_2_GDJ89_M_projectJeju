package com.jeju.app.publicBoards.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jeju.app.pages.PB_Pager;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.publicBoards.qna.QnaDAO.";
	
	public List<QnaDTO> getList(PB_Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public QnaDTO getDetail(QnaDTO qnaDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", qnaDTO);
	}
	
	public int add(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add", qnaDTO);
	}
	
	public int update(QnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", qnaDTO);
	}
	
	public int delete(QnaDTO qnaDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", qnaDTO);
	}
	
	public int reply(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"reply", qnaDTO);
	}
	
	public int updateStep(QnaDTO qnaDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateStep", qnaDTO);
	}

}
