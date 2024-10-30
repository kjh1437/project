package com.pilloud.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pilloud.model.PillVO;
import com.pilloud.model.UserVO;
import com.pilloud.service.BookmarkService;

@Controller
public class BookmarkController {
	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	
	@Autowired
	private BookmarkService bookmarkservice;
	
	/* 북마크 추가 */
    @RequestMapping(value="bookmark.do", method=RequestMethod.POST)
    public String addBookmark(PillVO pillVo, HttpSession session) throws Exception {
        // 세션에서 사용자 ID 읽어오기
    	UserVO user = (UserVO) session.getAttribute("user");
    	
        if (user != null) {
        	String id = user.getId();
            // 북마크 추가 쿼리 실행
        	pillVo.setId(id);
            bookmarkservice.insertBookmark(pillVo);
			 }
        return "redirect:/addmedicine";
    }
    
    /* 북마크 출력 */
    @RequestMapping(value="selectBookmark", method=RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PillVO> selectBookmark(HttpSession session) throws Exception {
        // 세션에서 사용자 ID 읽어오기
    	UserVO user = (UserVO) session.getAttribute("user");
    	
        if (user != null) {
        	String id = user.getId();
            // 북마크 조회 쿼리 실행
            List<PillVO> vo = bookmarkservice.selectBookmark(id);
            return vo;
        }
        // 세션이 없거나 사용자 ID가 없으면 빈 목록 반환 또는 에러 처리
        return Collections.emptyList();
    }
    
    /* 북마크 출력 */
    @RequestMapping(value="selectBookmarkSupplement", method=RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public List<PillVO> selectBookmarkSupplement(HttpSession session) throws Exception {
        // 세션에서 사용자 ID 읽어오기
    	UserVO user = (UserVO) session.getAttribute("user");
    	
        if (user != null) {
        	String id = user.getId();
            // 북마크 조회 쿼리 실행
            List<PillVO> vo = bookmarkservice.selectBookmarkSupplement(id);
            return vo;
        }
        // 세션이 없거나 사용자 ID가 없으면 빈 목록 반환 또는 에러 처리
        return Collections.emptyList();
    }
    
    /* 북마크 식제 */
    @RequestMapping(value="deleteBookmark", method=RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public void deleteBookmark(@RequestBody PillVO vo, HttpSession session) throws Exception {
    	// 세션에서 사용자 ID 읽어오기
    	UserVO user = (UserVO) session.getAttribute("user");
    	if (user != null) {
    		vo.setId(user.getId());
    		bookmarkservice.deleteBookmark(vo);
    	}
    	
    }
    
    /* 약 알람 설정 업데이트 */
    @RequestMapping(value="updateBookmarkAlarm.do", method=RequestMethod.POST)
    @ResponseBody
    public void updateBookmarkAlarm(@RequestBody PillVO vo, HttpSession session) throws Exception {
    	// 세션에서 사용자 ID 읽어오기
    	UserVO user = (UserVO) session.getAttribute("user");
    	if (user != null) {
        	String id = user.getId();
        	vo.setId(id);
        	bookmarkservice.updateBookmarkAlarm(vo);
        }
    	
    }
}
