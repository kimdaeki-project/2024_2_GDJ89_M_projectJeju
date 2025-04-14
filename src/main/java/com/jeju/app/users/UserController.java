package com.jeju.app.users;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/users/*")
public class UserController {

    @Autowired(required = false)
    private UserService userService;

    // 로그인 페이지(GET)
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public void login() throws Exception {
    }

    // 로그인 처리 (POST)
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(UserDTO userDTO, HttpSession session, Model model) throws Exception {
    	
        userDTO = userService.login(userDTO);
        
        if (userDTO != null) {
            session.setAttribute("user", userDTO);
            return "redirect:/"; // 로그인 후 메인 페이지로 리다이렉트
        }

        model.addAttribute("result", "ID 또는 비밀번호가 일치하지 않습니다.");
        model.addAttribute("path", "./login");
        return "commons/result";
    }

    // 회원가입 페이지 (GET)
    @RequestMapping(value = "join", method = RequestMethod.GET)
    public void join() throws Exception {
    }

    // 회원가입 처리 (POST)
    @RequestMapping(value = "join", method = RequestMethod.POST)
    public String join(UserDTO userDTO, HttpSession session) throws Exception {
        int result = userService.join(userDTO, session.getServletContext());
        return "redirect:/users/login"; // 회원가입 후 메인 페이지로 리다이렉트
    }

    // 로그아웃 처리
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        session.setAttribute("user", null);
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/"; // 로그아웃 후 메인 페이지로 리다이렉트
    }
    // 마이페이지(GET)
    @RequestMapping(value = "mypage", method = RequestMethod.GET)
    public String myPage(HttpSession session, Model model) {
        // 세션에서 로그인한 사용자 정보를 확인
        if (session.getAttribute("user") == null) {
            // 로그인하지 않았다면 로그인 페이지로 리다이렉트
            return "redirect:/users/login"; // 로그인 페이지 URL
        }

        // 로그인한 사용자일 경우, 사용자 정보를 가져오기
        UserDTO userDTO = (UserDTO) session.getAttribute("user");
        try {
            // getDetail 메소드를 호출하여 사용자 상세 정보 조회
            UserDTO userDetail = userService.getDetail(userDTO);
            model.addAttribute("userDetail", userDetail); // 사용자 상세 정보를 모델에 추가
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "사용자 정보를 불러오는 데 실패했습니다.");
            return "commons/error";
        }

        return "users/mypage"; // mypage.jsp로 리턴
    }

    // 비밀번호 수정 페이지(GET)
    @RequestMapping(value = "pwUpdate", method = RequestMethod.GET)
    public String pwUpdate() throws Exception {
        return "users/pwUpdate"; // 비밀번호 수정 페이지
    }

    // 비밀번호 수정 처리(POST)
    @RequestMapping(value = "pwUpdate", method = RequestMethod.POST)
    public String pwUpdate(UserDTO userDTO, @RequestParam String currentPassword, 
                            @RequestParam String newPassword, @RequestParam String confirmPassword,
                            HttpSession session, Model model) throws Exception {
        UserDTO user = (UserDTO) session.getAttribute("user");

        String result = userService.pwUpdate(user, currentPassword, newPassword, confirmPassword);

        if ("success".equals(result)) {
            session.setAttribute("msg", "비밀번호가 성공적으로 변경되었습니다.");
        } else {
            session.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
        }
        return "redirect:/users/mypage";
    }
 // 이메일 수정 페이지(GET)
    @RequestMapping(value = "emailUpdate", method = RequestMethod.GET)
    public String emailUpdate() throws Exception {
        return "users/emailUpdate"; // 이메일 수정 페이지로 이동
      
    }

    // 이메일 수정 처리(POST)
    @RequestMapping(value = "emailUpdate", method = RequestMethod.POST)
    public String emailUpdate(@RequestParam("newEmail") String newEmail,
                              HttpSession session, Model model) throws Exception {
        UserDTO user = (UserDTO) session.getAttribute("user");

        String result = userService.emailUpdate(user, newEmail);

        if ("success".equals(result)) {
            session.setAttribute("msg", "이메일이 성공적으로 변경되었습니다.");
        } else {
            session.setAttribute("msg", "이메일 변경에 실패했습니다.");
        }
        return "redirect:/users/mypage";
        
        }
 
    // 전화번호 수정 페이지(GET)
    @RequestMapping(value = "phoneUpdate", method = RequestMethod.GET)
    public String phoneUpdate() throws Exception {
        return"redirect:/users/mypage"; // 전화번호 수정 페이지로 이동
    }

    // 전화번호 수정 처리(POST)
    @RequestMapping(value = "phoneUpdate", method = RequestMethod.POST)
    public String phoneUpdate(@RequestParam("newPhone") String newPhone,
                              HttpSession session, Model model) throws Exception {
        UserDTO user = (UserDTO) session.getAttribute("user");

        String result = userService.phoneUpdate(user, newPhone);

        if ("success".equals(result)) {
            session.setAttribute("msg", "전화번호가 성공적으로 변경되었습니다.");
        } else {
            session.setAttribute("msg", "전화번호 변경에 실패했습니다.");
        }
        return "redirect:/users/mypage";
    }

    // 회원탈퇴 페이지(GET)
    @RequestMapping(value = "userDelete", method = RequestMethod.GET)
    public String userDelete1(HttpSession session) {
        // 세션에 로그인한 사용자가 없다면 로그인 페이지로 리다이렉트
        if (session.getAttribute("user") == null) {
            return "redirect:/users/login"; // 로그인 페이지로 리다이렉트
        }
        return "users/userDelete"; // 회원 탈퇴 페이지로 이동
    }

    // 회원탈퇴 처리(POST)
    @RequestMapping(value = "userDelete", method = RequestMethod.POST)
    public String userDelete(HttpSession session) {
        // 세션에서 사용자 정보를 가져옵니다.
        UserDTO user = (UserDTO) session.getAttribute("user");

        // 사용자 정보가 세션에 없으면 로그인 페이지로 리다이렉트
        if (user == null) {
            return "redirect:/users/login"; // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        try {
            // 회원 탈퇴 처리
            int result = userService.userDelete(user); // userService에서 사용자 삭제

            if (result > 0) {
                // 삭제 성공 시 세션 무효화
                session.invalidate(); // 세션을 무효화하여 사용자 정보를 삭제
                return "redirect:/"; // 회원 탈퇴 후 메인 페이지로 리다이렉트
            } else {
                // 삭제 실패 시 마이페이지로 리다이렉트
                return "redirect:/users/mypage"; // 탈퇴 실패 시 마이페이지로 리다이렉트
            }
        } catch (Exception e) {
            // 예외 발생 시 로그를 찍고 마이페이지로 리다이렉트
            e.printStackTrace(); // 예외를 로그로 출력
            return "redirect:/users/mypage"; // 오류 발생 시 마이페이지로 리다이렉트
        }
    }

	@RequestMapping(value = "checkID", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> checkID(@RequestBody UserDTO userDTO) {
	    boolean exists = userService.checkIdExists(userDTO);
	    Map<String, Boolean> result = new HashMap();
	    result.put("exists", exists);
	    return result;
	}


}



