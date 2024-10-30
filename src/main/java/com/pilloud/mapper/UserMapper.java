package com.pilloud.mapper;

import java.util.List;
import java.util.Map;

import com.pilloud.model.UserVO;

public interface UserMapper {
	//회원가입
		public void userSignup(UserVO user);
	
	//아이디 중복 검사
		public int idCheck(String id);
	
	/* 로그인 */
	public UserVO userLogin(UserVO user);
	
	public List<Map<String, Object>> searchPillNm(String user);

}
