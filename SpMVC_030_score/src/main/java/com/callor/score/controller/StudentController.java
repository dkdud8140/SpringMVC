package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping(value="/student")
@Slf4j
@RequiredArgsConstructor
@Controller
public class StudentController {

	protected final StudentService sSer;
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String studentlist(Model model) {
		
		List<StudentVO> stList = sSer.selectAll();
		
		model.addAttribute("STLIST", stList);
		model.addAttribute("BODY", "STUDENT_VIEW");
		return "home";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("BODY", "STUDENT_INPUT");
		return "home";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert( StudentVO stuVO, Model model) {
		model.addAttribute("BODY", "STUDENT_INPUT");
		return "home";
	}
	
	
}
