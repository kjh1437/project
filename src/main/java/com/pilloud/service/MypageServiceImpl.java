package com.pilloud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pilloud.mapper.MypageMapper;
import com.pilloud.mapper.UserMapper;
import com.pilloud.model.UserVO;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageMapper mypagemapper;

	@Override
	public UserVO selectUserInfo(UserVO user) throws Exception {
		
		return mypagemapper.selectUserInfo(user);
	}
	
	@Override
	public int updateName(UserVO user) throws Exception {
		
		return mypagemapper.updateName(user);
	}
	
	@Override
	public int updateTel(UserVO user) throws Exception {
		
		return mypagemapper.updateTel(user);
	}
	
	@Override
	public int updateBirth(UserVO user) throws Exception {
		
		return mypagemapper.updateBirth(user);
	}
	
	/* 회원탈퇴 */
    @Override
	public void deleteUser(UserVO user) throws Exception{
    	mypagemapper.deleteUser(user);
    }
}