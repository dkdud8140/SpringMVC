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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/score")
public class ScoreController {

	protected ScoreViewDao svDao ;
	protected ScoreDao scoreDao ;
	public ScoreController(ScoreViewDao svDao, ScoreDao scoreDao ) {
		this.svDao = svDao ;
		this.scoreDao = scoreDao;
	}
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String score(Locale locale, Model model) {
		
		List<SubScoreDTO> svList = svDao.selectAll();
		
		model.addAttribute("svList", svList);
		
		return "/score/score";
	}
	
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insert(Model model) {
		return "/score/insert";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(ScoreVO scoreVO) {
		scoreDao.insert(scoreVO);
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update( @RequestParam("stnum") String stnum, Model model) {
		
		List<ScoreVO> scoreList = scoreDao.selectAll(stnum);
		model.addAttribute("SCORES", scoreList);
		return "/score/update";
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String update(ScoreVO scoreVO) {
		
		log.debug(scoreVO.toString());
		scoreDao.update(scoreVO);
		return "redirect:/";
	}
	
	
}
