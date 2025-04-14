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

	
	@Autowired
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
	
	public String pwUpdate(UserDTO userDTO,String currentPassword, String newPassword, String confirmPassword) throws Exception{
		
		  if (!newPassword.equals(confirmPassword)) {
	            return "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.";
	        }


	        if (!userDTO.getPassword().equals(currentPassword)) {
	            return "현재 비밀번호가 올바르지 않습니다.";
	        }

	       
	        userDTO.setPassword(newPassword);
	        userDAO.pwUpdate(userDTO);

	        return "";
	        
	    }
	
	public String emailUpdate(UserDTO userDTO, String newEmail) throws Exception {

	    if (newEmail == null || newEmail.isEmpty()) {
	        return "이메일을 입력해주세요.";
	    }

	    if (!newEmail.contains("@") || !newEmail.contains(".")) {
	        return "유효한 이메일 형식이 아닙니다.";
	    }

	    userDTO.setEmail(newEmail);
	    userDAO.emailUpdate(userDTO); // DAO에서 이메일 수정 처리

	    return "/users/mypage";
	}
	public String phoneUpdate(UserDTO userDTO, String newPhone) throws Exception {

	    if (newPhone == null || newPhone.isEmpty()) {
	        return "전화번호를 입력해주세요.";
	    }

	    // 010-xxxx-xxxx 형식 검사
	    if (!newPhone.matches("^01[016789]-?\\d{3,4}-?\\d{4}$")) {
	        return "유효한 전화번호 형식이 아닙니다.";
	    }

	    userDTO.setPhone(newPhone);
	    userDAO.phoneUpdate(userDTO); // DAO에서 전화번호 수정 처리

	    return "/users/mypage";
	}
	
	public int userDelete(UserDTO userDTO) throws Exception{
		
		return userDAO.userDelete(userDTO);

	}
    //id 중복 검사 
    public boolean checkIdExists(UserDTO userDTO) {
        return userDAO.countByUserId(userDTO) > 0;
    }
    
    

	
	public List<BoardDTO> getMyList(MyPager pager, HttpSession session, @RequestParam("userID") UserDTO userDTO) throws Exception{
		
		pager.setPerPage(10L);
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
