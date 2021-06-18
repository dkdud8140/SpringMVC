package com.callor.score.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ViewDTO;
import com.callor.score.persistance.ViewDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	private ViewDao vDao;
	public HomeController(ViewDao vDao) {
		this.vDao = vDao;
	}
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<ViewDTO> vList = vDao.selectAll();
		
		model.addAttribute("vList",vList);
		log.debug("DTO : {}", vList);
		return "home";
	}
	
}
