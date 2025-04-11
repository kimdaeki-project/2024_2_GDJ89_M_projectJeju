package com.jeju.app.users;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jeju.app.boards.BoardDAO;
import com.jeju.app.boards.BoardDTO;
import com.jeju.app.pages.MyPager;
import com.jeju.app.pages.Pager;

@Service
public class UserService {

	@Autowired(required=false)
	private UserDAO userDAO;
	
	@Autowired
	private BoardDAO boardDAO;
	
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

	    if (result.getPassword().equals(userDTO.getPassword())) {
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
	
	public List<BoardDTO> getMyList(MyPager pager, HttpSession session, @RequestParam("userID") UserDTO userDTO) throws Exception{
		
		pager.setPerPage(5L);
		pager.makeNum();
		
		userDTO = (UserDTO)session.getAttribute("user");
		BoardDTO dto = new BoardDTO();
		dto.setUserID(userDTO.getUserID());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userID", userDTO.getUserID());
		map.put("startNum", pager.getStartNum());
		map.put("endNum", pager.getEndNum());
		List<BoardDTO> ar = boardDAO.getMyList(map);
		
		return ar;
	}
}
