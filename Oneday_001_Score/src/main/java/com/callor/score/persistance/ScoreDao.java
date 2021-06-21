package com.callor.score.persistance;

import java.util.List;

import com.callor.score.model.ScoreVO;
import com.callor.score.model.SubScoreDTO;

public interface ScoreDao extends GenericDao<ScoreVO , String> {
	
	public List<ScoreVO> selectAll(String sc_stnum) ;
	
}
