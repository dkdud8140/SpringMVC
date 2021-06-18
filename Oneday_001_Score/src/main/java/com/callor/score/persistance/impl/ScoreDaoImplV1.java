package com.callor.score.persistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.ScoreVO;
import com.callor.score.model.SubScoreDTO;
import com.callor.score.persistance.ScoreDao;

@Repository("ScoreDaoV1")
public class ScoreDaoImplV1 implements ScoreDao {

	
	protected JdbcTemplate jdbcTemplate;
	public ScoreDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	@Override
	public List<ScoreVO> selectAll() {
		// TODO 성적정보 리스트 전체 출력
		
		String sql = " SELECT * FROM tbl_score ";
		sql += " ";
		
		
		return null;
	}

	@Override
	public ScoreVO selectById(String pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(ScoreVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ScoreVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<SubScoreDTO> selectSubScore() {
		// TODO 피벗테이블 조회하기
		
		String sql = " SELECT * FROM view_subscore";
		
		List<SubScoreDTO> subList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<SubScoreDTO>(SubScoreDTO.class));
		
		return subList;
	}

}
