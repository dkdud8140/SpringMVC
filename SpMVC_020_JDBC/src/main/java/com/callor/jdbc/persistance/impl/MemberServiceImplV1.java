package com.callor.jdbc.persistance.impl;

import org.springframework.stereotype.Service;

import com.callor.jdbc.model.UserVO;
import com.callor.jdbc.service.MemberService;


@Service
public class MemberServiceImplV1 implements MemberService {

	@Override
	public UserVO login(String username, String password) {
		// TODO 로그인 처리
		
		// 1. id가 맞는 회원인가
		if(username.equals("korea") && password.equals("1234")) {
			
			UserVO userVO = new UserVO();
			userVO.setUsername(username);
			userVO.setPassword(password);
			userVO.setEmail("email@email.com");
			return userVO;
			
		}
		return null;
	}

	@Override
	public int join(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void viewInfo(String username) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateInfo(UserVO userVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void expire(String username) {
		// TODO Auto-generated method stub

	}

}

