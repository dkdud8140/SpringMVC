package com.callor.score.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.SubScoreDTO;
import com.callor.score.persistance.ScoreDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/score")
public class ScoreController {

	protected ScoreDao scoreDao ;
	public ScoreController(ScoreDao scoreDao) {
		this.scoreDao = scoreDao;
	}
	
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public String score(Locale locale, Model model) {
		
		List<SubScoreDTO> subList = scoreDao.selectSubScore();
		
		model.addAttribute("subList", subList);
		
		return "/score/score";
	}
}
