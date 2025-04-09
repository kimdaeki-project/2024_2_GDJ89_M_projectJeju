package com.jeju.app.users;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jeju.app.users.UserDAO.";
	
	public int join(UserDTO userDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"join", userDTO);
	}
	public int update(UserDTO userDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", userDTO);
	}
	public UserDTO getDetail(UserDTO userDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail",userDTO);
	}
	public int pwUpdate(UserDTO userDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"pwUpdate", userDTO);
	}
	public int userDelete(UserDTO userDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"userDelete", userDTO);
	}
	public List<UserDTO> getList (UserDTO userDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", userDTO);
				
	}
	public int checkUserIdExist(String userID) {
		// TODO Auto-generated method stub
		return 0;
	}
}