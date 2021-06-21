package com.callor.jdbc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.jdbc.model.AuthorVO;
import com.callor.jdbc.model.UserVO;
import com.callor.jdbc.service.AuthorService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/author")
public class AuthorController {
	
	
	protected final AuthorService auSer ;
	public AuthorController(AuthorService auSer) {
		this.auSer = auSer;
	}

	@RequestMapping(value= {"/",""},method=RequestMethod.GET)
	public String list(HttpSession hSession, Model model) {
		
		UserVO userVO = (UserVO)hSession.getAttribute("USERVO");
		if(userVO == null) {
			model.addAttribute("MSG","LOGIN");
			return "redirect:/member/login";
		}
		
		List<AuthorVO> auList = auSer.selectAll();
		log.debug("저자정보 : {}",auList.toString());
		
		/*
		 * Sttribute를 지정할 때 흔히 저지르는 실수
		 * Attribute의 이름은 문자열 형태이기 때문에 어떠한 기호를 사용해도 무방하다
		 * AHTHOR-LIST
		 * 
		 * 하지만
		 * jsp에서 랜더린할 떄는 이 Attribute문자열이 변수로 취급이 된다
		 * 변수로 취급된다는 것은 java의 일반적인 코딩 규칙이 적용된다는 것이다.
		 * 
		 * 작성할때는 비록 문자열 이지만, 변수명명규칙에 맞도록 이름을 작성해야한다.
		 * 그렇지 않으면 jsp에서 오류를 만나게 될 것이다.
		 */
		
		model.addAttribute("AUTHORS", auList);
		
		return "author/list";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return "author/input";
	}
	
}