package com.callor.jdbc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	/*
	 * cp_title을 Req로부터 받아 변수에 세팅을 하는데
	 * Req를 할 떄 cp_title 변수를 보내지 않으면 400 httpStatus 오류가 발생한다
	 * 
	 * 400오류는 서버 App 디버깅 과정에서 상당히 관리하기 어려운 오류
	 * 
	 * 단순한 변수(VO, DTO, MAp 형식이 아닌 단일 변수)의 경우
	 * @RequestParam의 requited 옵션을 false로 선언하고
	 * default값을 임의로 설정해 두면 코드내에서 핸들을 할 수 있다.
	 */
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(@RequestParam(name="au_name",required = false, defaultValue = "") String au_name, Model model) {
		
		if(au_name == null || au_name.equals("")) {
			List<AuthorVO> auList = auSer.selectAll();
			model.addAttribute("AUTHORS",auList);
		} else {
			List<AuthorVO> auList = auSer.findByNameAndTel(au_name);
			model.addAttribute("AUTHORS",auList);
			
		}
		
		
		return "author/search";
	}
	
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		return "author/input";
	}
	
}