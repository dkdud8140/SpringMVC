package com.callor.hello.service;

import org.springframework.stereotype.Service;


/*
 * Spring 프로젝트에서 클래스를 선언하고 각 클래스에 stereotype을 부착하기
 */

@Service
public class HomeService {

	public Integer add(int num1, int num2) {
		
		return num1 + num2 ;
	}
}
