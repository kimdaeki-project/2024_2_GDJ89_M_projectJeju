package com.jeju.app.boards.comments;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jeju.app.boards.comments.CommentDAO.";
	
	public List<CommentDTO> getCommentsList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCommentsList", map);
	}
	
	public int addComments(CommentDTO commentDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"addComments", commentDTO);
	}
	
	public Long getCommentsCount(CommentDTO commentDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCommentsCount", commentDTO);
	}
	
	public int deleteComments(CommentDTO commentDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteComments", commentDTO);
	}
	
	public int updateComments(CommentDTO commentDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateComments", commentDTO);
	}

}
