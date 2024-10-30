package com.pilloud.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pilloud.model.UserVO;
import com.pilloud.service.MypageService;
import com.pilloud.service.UserService;

@Controller
public class MypageController {

   private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
   
   @Autowired
   private MypageService mypageservice;
   //마이페이지에 회원정보 출력
   @ResponseBody
   @RequestMapping(value="/selectUserInfo.do", method=RequestMethod.POST, produces = "application/json")
   public UserVO selectUserInfo(@RequestBody UserVO user, HttpSession session) throws Exception{
       
	   UserVO loginUser = (UserVO) session.getAttribute("user");
	   UserVO userInfo = null; 
	   if (loginUser != null) { 
		   String id = loginUser.getId();
		   user.setId(id);
		   userInfo = mypageservice.selectUserInfo(user);
	   }
	   
       //UserVO userInfo = mypageservice.selectUserInfo(user);
       
       logger.info(userInfo.toString());
       return userInfo;
       
    }
  
   //개인정보 수정(이름)
   @ResponseBody
   @RequestMapping(value="/updateName", method=RequestMethod.POST, produces = "application/json")
   public void updateName(@RequestBody UserVO user, HttpSession session) throws Exception{
       
	   UserVO loginUser = (UserVO) session.getAttribute("user");
	   
	   if (loginUser != null) { 
		   String id = loginUser.getId();
		   user.setId(id);
		   mypageservice.updateName(user);
	   }
	   
    }
   
   //개인정보 수정(연락처)
   @ResponseBody
   @RequestMapping(value="/updateTel", method=RequestMethod.POST, produces = "application/json")
   public void updateTel(@RequestBody UserVO user, HttpSession session) throws Exception{
       
	   UserVO loginUser = (UserVO) session.getAttribute("user");
	   
	   if (loginUser != null) { 
		   String id = loginUser.getId();
		   user.setId(id);
		   mypageservice.updateTel(user);
	   }
    }
   
   //개인정보 수정(생년월일)
   @ResponseBody
   @RequestMapping(value="/updateBirth", method=RequestMethod.POST, produces = "application/json")
   public void updateBirth(@RequestBody UserVO user, HttpSession session) throws Exception{
       
	   UserVO loginUser = (UserVO) session.getAttribute("user");
	   
	   if (loginUser != null) { 
		   String id = loginUser.getId();
		   user.setId(id);
		   mypageservice.updateBirth(user);
	   }
	   
       
    }
   
   /* 메인페이지 로그아웃 */
   @RequestMapping(value="/logout.do", method=RequestMethod.GET)
   public String logoutMainGET(HttpServletRequest request) throws Exception{
   	logger.info("logoutMainGET메서드 진입");
       
       HttpSession session = request.getSession();
       session.invalidate();  
       
       return "redirect:/main";
   }
   
   /* 회원탈퇴 */
   @RequestMapping(value="deleteUser", method=RequestMethod.POST)
   @ResponseBody
   public String deleteUser(HttpSession session, HttpServletRequest request, @RequestBody UserVO vo) throws Exception {
	   String id = null;
	   UserVO loginUser = (UserVO) session.getAttribute("user");
	   if (loginUser != null) { 
		   id = loginUser.getId();
		   vo.setId(id);
	   }
       // 회원 삭제 처리
   	   mypageservice.deleteUser(vo);
       
   	   // 세션 무효화 (세션 값을 삭제)
       HttpSession session2 = request.getSession();
       session2.invalidate(); 
       
       return "success";
       
   }
}