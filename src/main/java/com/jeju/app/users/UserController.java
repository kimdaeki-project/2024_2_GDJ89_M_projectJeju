package com.jeju.app.users;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String login(UserDTO userDTO, HttpSession session, Model model) {
        try {
            userDTO = userService.login(userDTO);
        } catch (Exception e) {
            model.addAttribute("result", e.getMessage());
            return "users/login";
        }

        
        if (userDTO != null) {
            session.setAttribute("user", userDTO);
            return "redirect:/"; // 로그인 후 메인 페이지로 리다이렉트
        }

        model.addAttribute("result", "다시 로그인을 시도해 주세요");
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
        return "redirect:/"; // 회원가입 후 메인 페이지로 리다이렉트
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
    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
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

        return "mypage"; // mypage.jsp로 리턴
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

        if (result.equals("success")) {
            return "redirect:/users/mypage"; // 비밀번호 변경 후 마이페이지로 리다이렉트
        } else {
            model.addAttribute("message", result); // 오류 메시지 전달
            return "users/pwUpdate"; // 비밀번호 수정 페이지로 돌아가기
        }
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
}


    // 사용자 목록 조회
//    @RequestMapping(value = "getList", method = RequestMethod.GET)
//    public String getList(HttpSession session, Model model) throws Exception {
//        UserDTO user = (UserDTO) session.getAttribute("user");
//
//        if (user == null) {
//            return "redirect:/users/login"; // 로그인되지 않으면 로그인 페이지로 리다이렉트
//        }
//
//        // 사용자 목록을 model에 추가하여 JSP에서 사용
//        model.addAttribute("list", userService.getList()); // 사용자 목록 추가
//        return "users/getList"; // 사용자 목록 페이지
//    }

