package com.pilloud.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pilloud.model.UserVO;
import com.pilloud.service.UserService;

@Controller
public class UserController {

   private static final Logger logger = LoggerFactory.getLogger(UserController.class);
   
   @Autowired
   private UserService userservice;
   
   //회원가입 페이지 이동
   @RequestMapping(value = "/signup", method = RequestMethod.GET)
   public void signGET() {
      
      logger.info("회원가입 페이지 진입");
            
   }
   //회원가입
    @RequestMapping(value="/signup", method=RequestMethod.POST)
    public String signPOST(UserVO user) throws Exception{
       
       logger.info("signup 진입");
       
       // 회원가입 서비스 실행
       userservice.userSignup(user);
       
       logger.info("signup Service 성공");
       
       return "redirect:/login"; // 로그인 후 이동되는 경로
       
    }
   
   //로그인 페이지 이동
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public void loginGET() {
      
      logger.info("로그인 페이지 진입");
         
   }
   
   //메인 페이지 이동
   @RequestMapping(value = "/main", method = RequestMethod.GET)
   public void mainGET() {
      
      logger.info("로그인 페이지 진입");
         
   }
   
   //영양제 페이지 이동
   @RequestMapping(value = "/supplement", method = RequestMethod.GET)
   public void supplementGET() {
      
      logger.info("영양제 페이지 진입");
         
   }
   
   // 아이디 중복 검사
   @RequestMapping(value = "/idChk", method = RequestMethod.POST)
   @ResponseBody
   public String idChkPOST(String id) throws Exception{
      
      // logger.info("idChk() 진입");
      
      int result = userservice.idCheck(id);
      
      logger.info("결과값 = " + result);
      
      if(result != 0) {
         
         return "fail";   // 중복 아이디가 존재
         
      } else {
         
         return "success";   // 중복 아이디 x
         
      }   
   }
   
   /* 로그인 */
   @RequestMapping(value="login", method=RequestMethod.POST)
   public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception{
   	HttpSession session = request.getSession();
       String rawPw = "";
       String encodePw = "";
       
       UserVO lvo = userservice.userLogin(user);
      
       if(lvo != null) {            // 일치하는 아이디 존재시
           
       	rawPw = user.getPw();        // 사용자가 제출한 비밀번호
           encodePw = lvo.getPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
           
//           if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
               lvo.setPw("");                    // 인코딩된 비밀번호 정보 지움
               session.setAttribute("user", lvo);     // session에 사용자의 정보 저장
               
               logger.info("로그인 사용자 정보: " + lvo);  // 모든 필드가 채워졌는지 확인
               
               return "redirect:/main";        // 메인페이지 이동
               
//           } else {
//               rttr.addFlashAttribute("result", 0);            
//               return "redirect:/login";    // 로그인 페이지로 이동
//           }
           
       } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
           rttr.addFlashAttribute("result", 0);            
           return "redirect:/login";    // 로그인 페이지로 이동
       }

   }
}