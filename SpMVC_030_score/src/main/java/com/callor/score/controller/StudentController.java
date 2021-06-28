package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ScoreInputVO;
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
	//protected final ScoreService scSer;
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String studentlist(Model model) {
		
		List<StudentVO> stList = sSer.selectAll();
		
		model.addAttribute("STLIST", stList);
		model.addAttribute("BODY", "STUDENT_VIEW");
		return "home";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insert(Model model) {

		StudentVO stVO = new StudentVO();
		stVO.setSt_num( sSer.makeStNum() );
		
		model.addAttribute("STD",stVO);
		model.addAttribute("BODY","STUDENT_INPUT");
		return "home";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert( StudentVO stuVO, Model model) {

		log.debug("Req 학생정보 : {}", stuVO.toString());
		
		int ret = sSer.insert(stuVO);
		
		model.addAttribute("BODY","STUDENT_INPUT");
		return "redirect:/student";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(String st_num,Model model) {
//		List<SubjectAndScoreDTO> ssList =scSer.selectScore(st_num);
	
		String ret = sSer.detail(model, st_num);
		
		// StudentVO stVO = stService.find
//		model.addAttribute("SSLIST",ssList);
		model.addAttribute("BODY","STUDENT_DETAIL");
		return "home";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.POST)
//	public String detail(@RequestParam(name="subject") List<String> subject,@RequestParam(name="score") List<String> score ) {
	public String detail(ScoreInputVO scInputVO, Model model) {
//		log.debug("subject : {}", subject.toString());
//		log.debug("score : {}", score.toString());
		
		log.debug("Score Input {}", scInputVO.toString());
	
		String ret = sSer.scoreInput(scInputVO);
		String st_num = scInputVO.getSt_num();
		
		/*
		 * redirect를 수행할 때 query string 을 보내고 싶으면
		 * 해당 변수와 값을 model에 속성(Attribute)로 추가(add)
		 * 
		 * redirect:/student/deatil>st_num =?
		 */
		model.addAttribute("st_num", st_num);
		return "redirect:/student/deatil";
		//return "home";
		
	}
	
	
	
	
	
	
	
	
	
}
