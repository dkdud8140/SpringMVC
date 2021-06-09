package com.callor.jdbc.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.jdbc.service.RentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	// spring.properties 파일에 설정된 속성값 가져와서 변수에 setting
	@Value("${user.name}")
	protected String user_name;
	@Value("${user.email}")
	protected String user_email;
	
	
	/*
	 * 보편적인 Spring에서 bean을 사용하는 코드
	 * @Autowired
	 * private BookDao bookDao
	 * 
	 * 이 코드에서 메모리 누수 현상이 보고되어
	 * 다음의 코드를 권장한다
	 */
	//spring에서 bean을 생성할때 메모리 누수를 최소화하기 위하여
	//protected final BookDao bookDao;
	protected final RentService rentS;
	public HomeController(RentService rentS) {
		this.rentS = rentS;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		log.debug("User name : {}", user_name);
		log.debug("User email : {}", user_email);
		
		rentS.viewBookandComp();
		return "home";
	}
	
}

