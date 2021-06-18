package com.callor.score.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.persistance.StudentDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/student")
public class StudentController {

	 protected StudentDao stuDao ;
	 public StudentController(StudentDao stuDao) {
		 this.stuDao = stuDao;
	 }
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String student(Locale locale, Model model) {
		
		List<StudentVO> stuList = stuDao.selectAll();
		
		model.addAttribute("stuList", stuList);
		
		return "/student/student";
	}
	
	
}
