package com.callor.hello.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.hello.service.HomeService;

@Controller
public class HomeController {

//	protected HomeService hS ;
//	public HomeController() {
//		hs = new HomeController();
//	}

	/*
	 * Spring Container에 보관된 객체중에서
	 * 
	 * HomeService 클래스르를 이용하여 생성된 객체가 있으면 전달해줘
	 * 
	 * Spring Container는 자신이 보관하고 있는 객체들 중에
	 * 
	 * 같은 이름의 객체가 있으면 "주입"하여 사용할 수 있도록 말해준다.
	 * 
	 * 이 방식은 접속자가 많이 발생할 경우 메모리 leak(누수)가 발생하여 성능이 저하는되는 현상이 발생할 수 있다
	 */
	@Autowired
	HomeService homeService;

	protected final HomeService homeS;
	public HomeController(HomeService homeS) {
		this.homeS = homeS;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		System.out.println("첫번째 : " + homeService.add(200, 500) );
		System.out.println("두번째 : " + homeS.add(200, 500) );
		return "home";
	}

}

