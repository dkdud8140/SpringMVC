package com.callor.score.dao;

import java.util.List;

import com.callor.score.model.ScoreDTO;
import com.callor.score.model.ScoreVO;

public interface ScoreDao extends GenericDao<ScoreVO, Long>{

	public List<ScoreDTO> selectViewAll();
	
	// 학번으로 검색하기
	public List<ScoreDTO> findByStNum(String st_num);
}
