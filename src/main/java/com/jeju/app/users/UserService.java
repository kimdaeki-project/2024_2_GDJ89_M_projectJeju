package com.jeju.app.users;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;  // 기본적으로 required=true, 즉 주입을 필수로 받는 형태로 설정합니다.

    // 회원 가입 처리
    public int join(UserDTO userDTO, ServletContext context) throws Exception {
        return userDAO.join(userDTO);
    }

    // 사용자 정보 조회
    public UserDTO getDetail(UserDTO userDTO) throws Exception {
        return userDAO.getDetail(userDTO);
    }

    // 로그인 처리
    public UserDTO login(UserDTO userDTO) throws Exception {
        // 사용자 정보 조회
        UserDTO result = userDAO.getDetail(userDTO);

        // 사용자 정보가 없으면 null 리턴
        if (result == null) {
            return null;
        }

        // 비밀번호가 null이 아니면 비교하고, 비밀번호가 동일한지 확인
        if (result.getPassword() != null && result.getPassword().equals(userDTO.getPassword())) {
            return result;
        }

        // 비밀번호가 null인 경우나 일치하지 않는 경우 null 리턴
        return null;
    }

    // 아이디 중복 체크
    public boolean isUserIdAvailable(String userID) {
        return userDAO.checkUserIdExist(userID) == 0;  // 중복이 없으면 0 반환
    }

    // 회원 정보 업데이트
    public int update(UserDTO userDTO, MultipartFile profile, HttpSession session) throws Exception {
        int result = userDAO.update(userDTO);

        // 업데이트 후 새 사용자 정보를 세션에 반영
        userDTO = userDAO.getDetail(userDTO);
        session.setAttribute("user", userDTO);

        return result;
    }

    // 비밀번호 업데이트
    public String pwUpdate(UserDTO userDTO, String currentPassword, String newPassword, String confirmPassword) throws Exception {
        // 비밀번호 확인
        if (!newPassword.equals(confirmPassword)) {
            return "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.";
        }

        if (!userDTO.getPassword().equals(currentPassword)) {
            return "현재 비밀번호가 올바르지 않습니다.";
        }

        // 비밀번호 업데이트
        userDTO.setPassword(newPassword);
        userDAO.pwUpdate(userDTO);

        return "success";  // 성공적인 비밀번호 변경 메시지
    }

    // 회원 탈퇴
    public int userDelete(UserDTO userDTO) throws Exception {
        return userDAO.userDelete(userDTO);
    }
}
