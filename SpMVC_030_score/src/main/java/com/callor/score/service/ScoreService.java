package com.callor.score.service;

import java.util.List;

import com.callor.score.model.ScoreDTO;
import com.callor.score.model.SubjectAndScoreDTO;

public interface ScoreService {

	public List<ScoreDTO> scoreAllList();
	
	public List<ScoreDTO> findByStNum(String st_num);
	public List<SubjectAndScoreDTO> selectSubjectAndScore(String st_num);

	public List<SubjectAndScoreDTO> selectScore(String st_num);
	
}
