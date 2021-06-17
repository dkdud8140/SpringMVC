package com.callor.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.persistance.CompDao;
import com.callor.jdbc.service.CompService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/comp")
public class CompController {

	protected final CompDao compDao;
	protected final CompService compS;
	public CompController(CompDao compDao, CompService compS) {
		this.compDao = compDao;
		this.compS = compS;
	}
	
	@RequestMapping(value={"","/"},  method=RequestMethod.GET)
	public String list() {
		
		return"comp/list";
	}
	
	
	
	//localhost:8080/jdbc/comp/insert로 호출되는 함수
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insert() {
		
		return"comp/input";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(CompVO compVO) {
		log.debug("Comp VO {}",compVO.toString());
		compS.insert(compVO);
		return "redirect:/";
	}
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		
		return "comp/update";
	}
	
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("cp_code") String code) {
		compDao.delete(code);
		return "redirect:/";
	}
	
	
	
	
}
