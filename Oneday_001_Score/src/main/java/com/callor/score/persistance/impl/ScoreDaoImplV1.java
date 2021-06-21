package com.callor.score.persistance.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.score.model.ScoreVO;
import com.callor.score.persistance.ScoreDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("ScoreDaoV1")
public class ScoreDaoImplV1 implements ScoreDao {

	
	protected JdbcTemplate jdbcTemplate;
	public ScoreDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	@Override
	public List<ScoreVO> selectAll(String sc_stnum) {
		// TODO 성적정보 리스트 전체 출력
		
		String sql = " SELECT * FROM tbl_score " ;
		sql += " WHERE sc_stnum = ? ";
		
		Object[] params = new Object[] { sc_stnum };
		
		List<ScoreVO> scoreList = new ArrayList<ScoreVO>();
		scoreList = jdbcTemplate.query(sql, params, new BeanPropertyRowMapper<ScoreVO>(ScoreVO.class));
		
		return scoreList;
	}

	@Override
	public ScoreVO selectById(String sc_stnum) {
		
		return null;
	}

	@Override
	public int insert(ScoreVO vo) {
		// TODO 성적 입력하기
		
		String sql = " INSERT INTO tbl_score ";
		sql += " (sc_stnum, sc_subject, sc_score) ";
		sql+= " values( ?, ?, ? ) ";
		
		Object[] params = new Object[] { 
				vo.getSc_stnum(),
				vo.getSc_subject(),
				vo.getSc_score()
		};
		
		return jdbcTemplate.update(sql, params);
	}

	@Override
	public int update(ScoreVO vo) {
		// TODO 성적정보 수정하기 
		
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<ScoreVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}


}
