package com.jeju.app.users;

import java.util.List;
import java.util.Objects;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

@Service
public class UserService {

	@Autowired(required=false)
	private UserDAO userDAO;
	
	public int join (UserDTO userDTO, ServletContext context) throws Exception {
		int result = userDAO.join(userDTO);
		return result;	
	}
	  public UserDTO getDetail(UserDTO userDTO) throws Exception {
	        // 실제 DB 조회
	        return userDAO.getDetail(userDTO);
	  }
	
	public UserDTO login(UserDTO userDTO) throws Exception {
	    UserDTO result = userDAO.getDetail(userDTO);

	    if (result == null) {
	    	System.out.println("user = null");
	        return null;
	    }

	    if (Objects.equals(result.getPassword(), userDTO.getPassword())) {
	        return result;
	    }

	    return null;
	}
	public int update(UserDTO userDTO, MultipartFile profile, HttpSession session) throws Exception {
		int result = userDAO.update(userDTO);
		
		userDTO = userDAO.getDetail(userDTO);
		session.setAttribute("user", userDTO);
		
		return result;
		}
	
//	public List<UserDTO>getList(UserDTO userDTO) throws Exception {
//		return userDAO.getList(userDTO);
//	}
	public String pwUpdate(UserDTO userDTO,String currentPassword, String newPassword, String confirmPassword) throws Exception{
		
		  if (!newPassword.equals(confirmPassword)) {
	            return "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.";
	        }


	        if (!userDTO.getPassword().equals(currentPassword)) {
	            return "현재 비밀번호가 올바르지 않습니다.";
	        }

	       
	        userDTO.setPassword(newPassword);
	        userDAO.pwUpdate(userDTO);

	        return "success";
	        
	    }
	
	public int userDelete(UserDTO userDTO) throws Exception{
		
		return userDAO.userDelete(userDTO);
	
	
	
	}
}
