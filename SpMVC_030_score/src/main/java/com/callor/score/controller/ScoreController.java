package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ScoreDTO;
import com.callor.score.service.ScoreService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping(value="/score")
@Slf4j
@RequiredArgsConstructor
@Controller
public class ScoreController {
	
	protected final ScoreService scSer;
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String scorelist(Model model) {
		
		List<ScoreDTO> sdList = scSer.scoreAllList();
		
		model.addAttribute("SDLIST", sdList);
		model.addAttribute("BODY", "SCORE_VIEW");
		return "home";
	}
	

}
