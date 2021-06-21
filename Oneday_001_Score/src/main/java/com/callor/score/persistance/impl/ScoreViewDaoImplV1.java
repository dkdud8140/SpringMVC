package com.callor.score.persistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.SubScoreDTO;
import com.callor.score.persistance.ScoreViewDao;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Repository("ScoreViewDaoV1")
public class ScoreViewDaoImplV1 implements ScoreViewDao {

	
	protected JdbcTemplate jdbcTemplate;
	public ScoreViewDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	@Override
	public List<SubScoreDTO> selectAll() {
	// TODO 피벗테이블 조회하기
		
		String sql = " SELECT * FROM view_subscore";
		
		List<SubScoreDTO> subList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<SubScoreDTO>(SubScoreDTO.class));
		
		return subList;
	}

	@Override
	public SubScoreDTO selectById(String stnum) {
		// TODO 학생번호로 성적 출력하기

		String sql = " SELECT * FROM view_subscore ";
		sql += " WHERE stnum = ? ";
		
		Object[] params = new Object[] { stnum };
		
		try {
			SubScoreDTO scoreDTO = (SubScoreDTO)jdbcTemplate.queryForObject(sql, params, new BeanPropertyRowMapper<SubScoreDTO>(SubScoreDTO.class));
			return scoreDTO;
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public int insert(SubScoreDTO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(SubScoreDTO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

}
