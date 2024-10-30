package com.pilloud.service;

import org.springframework.stereotype.Service;

import com.pilloud.model.UserVO;

@Service
public interface MypageService {

	//유저정보 화면에 조회
	public UserVO selectUserInfo(UserVO id) throws Exception;
	
	//유저정보 수정(이름)
	public int updateName(UserVO vo) throws Exception;
	
	//유저정보 수정(연락처)
	public int updateTel(UserVO vo) throws Exception;
		
	//유저정보 수정(생년월일)
	public int updateBirth(UserVO vo) throws Exception;
	
	//회원탈퇴
	public void deleteUser(UserVO vo) throws Exception;
}