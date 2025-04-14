package com.jeju.app.users;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(UserDTO userDTO, HttpSession session, Model model) throws Exception {

        Map<String, Integer> failMap = (Map<String, Integer>) session.getAttribute("failMap");
        if (failMap == null) {
            failMap = new HashMap<String, Integer>();
        }

        String userID = userDTO.getUserID();
        int failCount = failMap.containsKey(userID) ? failMap.get(userID) : 0;

        if (failCount >= 5) {
            model.addAttribute("result", "아이디 또는 비밀번호를 5회 이상 잘못 입력하셨습니다. 로그인이 제한됩니다.");
            model.addAttribute("path", "./login");
            return "commons/result";
        }

        UserDTO loginUser = userService.login(userDTO);

        if (loginUser != null) {
            session.setAttribute("user", loginUser);
            failMap.remove(userID);
            session.setAttribute("failMap", failMap);

            model.addAttribute("result", loginUser.getUserID() + "님, 환영합니다!");
            model.addAttribute("path", "/");
            return "commons/result"; // 메인 페이지로 alert 후 이동
        }

        failCount++;
        failMap.put(userID, failCount);
        session.setAttribute("failMap", failMap);

        model.addAttribute("result", "ID 또는 비밀번호가 일치하지 않습니다. (" + failCount + "/5)");
        model.addAttribute("path", "./login");
        return "commons/result";
    }

    // 회원가입 페이지 (GET)
    @RequestMapping(value = "join", method = RequestMethod.GET)
    public void join() throws Exception {
    }

    // 회원가입 처리 (POST)
    @RequestMapping(value = "join", method = RequestMethod.POST)
    public String join(UserDTO userDTO, HttpSession session,Model model) throws Exception {
        int result = userService.join(userDTO, session.getServletContext());
       
        model.addAttribute("result", "회원가입이 완료되었습니다.");
        model.addAttribute("path", "./login"); // 로그인 페이지로 이동
        return "commons/result"; // 메시지 출력 후 이동
    }

    // 로그아웃 처리
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session, Model model) throws Exception {
        session.invalidate();

        model.addAttribute("result", "로그아웃 되었습니다.");
        model.addAttribute("path", "/"); // 메인 페이지로 이동
        return "commons/result";
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

    @RequestMapping(value = "pwUpdate", method = RequestMethod.POST)
    public String pwUpdate(UserDTO userDTO,
                           @RequestParam String currentPassword,
                           @RequestParam String newPassword,
                           @RequestParam String confirmPassword,
                           HttpSession session,
                           Model model) throws Exception {

        UserDTO user = (UserDTO) session.getAttribute("user");

        String result = userService.pwUpdate(user, currentPassword, newPassword, confirmPassword);

        if ("success".equals(result)) {
            model.addAttribute("result", "비밀번호가 성공적으로 변경되었습니다.");
        } else {
            model.addAttribute("result", "비밀번호 성공적으로 변경되었습니다.");
        }

        model.addAttribute("path", "./mypage");
        return "commons/result";
    }

 // 이메일 수정 페이지(GET)
    @RequestMapping(value = "emailUpdate", method = RequestMethod.GET)
    public String emailUpdate() throws Exception {
        return "users/emailUpdate"; // 이메일 수정 페이지로 이동
      
    }

    @RequestMapping(value = "emailUpdate", method = RequestMethod.POST)
    public String emailUpdate(@RequestParam("newEmail") String newEmail,
                              HttpSession session, Model model) throws Exception {
        UserDTO user = (UserDTO) session.getAttribute("user");

        String result = userService.emailUpdate(user, newEmail);

        if (result != null && result.trim().equalsIgnoreCase("success")) {
            // 세션 업데이트
            user.setEmail(newEmail);
            session.setAttribute("user", user);
            model.addAttribute("result", "이메일이 성공적으로 변경되었습니다.");
        } else {
            model.addAttribute("result", "이메일이 성공적으로 변경되었습니다.");
        }

        model.addAttribute("path", "./mypage"); // 마이페이지로 이동
        return "commons/result"; // 메시지를 alert로 띄우는 JSP 공통 페이지
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

        // 로그인 상태 확인
        if (user == null) {
            model.addAttribute("result", "로그인이 필요합니다.");
            model.addAttribute("path", "./login");
            return "commons/result";
        }

        String result = userService.phoneUpdate(user, newPhone);
        System.out.println("phoneUpdate 결과: " + result); // 디버깅용 로그

        if ("success".equalsIgnoreCase(result != null ? result.trim() : "")) {
            user.setPhone(newPhone);
            session.setAttribute("user", user);
            model.addAttribute("result", "전화번호가 성공적으로 변경되었습니다.");
        } else {
            model.addAttribute("result", "전화번호가 성공적으로 변경되었습니다.");
        }

        model.addAttribute("path", "./mypage");
        return "commons/result";
    }



    // 회원탈퇴 페이지(GET)
    @RequestMapping(value = "userDelete", method = RequestMethod.GET)
    public String userDeleteForm(HttpSession session, Model model) {
        // 로그인한 사용자 확인
        if (session.getAttribute("user") == null) {
            model.addAttribute("result", "로그인이 필요합니다.");
            model.addAttribute("path", "./login");
            return "commons/result";
        }

        return "users/userDelete"; // 회원 탈퇴 확인 페이지로 이동
    }
    @RequestMapping(value = "userDelete", method = RequestMethod.POST)
    public String userDelete(HttpSession session, Model model) {
        // 세션에서 사용자 정보를 가져옵니다.
        UserDTO user = (UserDTO) session.getAttribute("user");

        if (user == null) {
            model.addAttribute("result", "로그인이 필요한 서비스입니다.");
            model.addAttribute("path", "./login");
            return "commons/result";
        }

        try {
            int result = userService.userDelete(user);

            if (result > 0) {
                session.invalidate();
                model.addAttribute("result", "회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
                model.addAttribute("path", "/");
            } else {
                model.addAttribute("result", "회원 탈퇴에 실패했습니다.");
                model.addAttribute("path", "./mypage");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("result", "오류가 발생했습니다. 다시 시도해주세요.");
            model.addAttribute("path", "./mypage");
        }

        return "commons/result";
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



