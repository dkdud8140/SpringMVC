package com.callor.score.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class HomeController {
	
	protected final StudentService stSer;
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		List<StudentVO> stList = stSer.selectAll();
		
		//Map<String,Object> maps = stSer.selectMaps();
		
		log.debug("Controller {}", stList.toString());
		
		return "redirect:/score";
	}
	
	
	/* @ResponseBody
	 * API Server를 만들 때 String 타입의 데이터를
	 * Response하라는 지시어
	 * 
	 * API Server
	 * 서로 다른 서버와 서버, 서버와 클라이언트 간에 조건을 Request하고
	 * 그 결과를 Data로 Response하는 서비스
	 * 
	 * 서로 다른 프로젝트로 서버와 클라이언트를 개발한다
	 * API Service는 주고 받은 데이터를 XML type, JSON type으로 만든다
	 */
//	@ResponseBody
//	@RequestMapping(value="/home", method = RequestMethod.GET)
//	public String string( @RequestParam(name = "name", required = false, defaultValue = "") String name) {
//		
//		if(name != null && name.equals("HOME")) {
//			return "OK";
//		} else {
//			return "FAIL";
//		}
//	}
	
	
}
