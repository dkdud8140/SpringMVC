package com.callor.score.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.score.model.ScoreVO;
import com.callor.score.model.StudentVO;
import com.callor.score.model.SubScoreDTO;
import com.callor.score.persistance.ScoreDao;
import com.callor.score.persistance.ScoreViewDao;
import com.callor.score.persistance.StudentDao;
import com.callor.score.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/student")
public class StudentController {

	 protected StudentDao stuDao ;
	 protected ScoreViewDao svDao ;
	 protected ScoreDao scoreDao ;
	 protected StudentService stuSer;
	 public StudentController(StudentDao stuDao, ScoreViewDao svDao, ScoreDao scoreDao,StudentService stuSer ) {
		 this.stuDao = stuDao;
		 this.svDao = svDao;
		 this.scoreDao = scoreDao;
		 this.stuSer = stuSer;
	 }
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String student(Locale locale, Model model) {
		
		List<StudentVO> stuList = stuDao.selectAll();
		
		model.addAttribute("stuList", stuList);
		
		return "/student/student";
	}
	
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String infomation(@RequestParam("num") String num, Model model) {
		
		StudentVO stuVO = stuDao.selectById(num);
		SubScoreDTO svDTO = svDao.selectById(num);
		List<ScoreVO> sVoList = scoreDao.selectAll(num);
		
		model.addAttribute("stuVO",stuVO);
		model.addAttribute("scoreDTO",svDTO);
		model.addAttribute("sVoList",sVoList);
		
		return "/student/info";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update(@RequestParam("stnum") String num, Model model) {
	
		StudentVO stuVO = stuDao.selectById(num);
		model.addAttribute("stuVO",stuVO);
		
		return "/student/update";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String update(StudentVO stuVO) {
	
		stuSer.update(stuVO);
		
		
		return "redirect:/";
	}
	

	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insert(Model model) {
	
		
		return "/student/insert";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(StudentVO stuVO) {

		stuDao.insert(stuVO);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(StudentVO stuVO) {
		
		String st_num = stuVO.getSt_num();
		stuDao.delete(st_num);
		
		log.debug("## st_num : {}",st_num);
		
		return "redirect:/";
	}
	
	
	
}
